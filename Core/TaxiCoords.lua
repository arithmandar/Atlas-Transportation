-----------------------------------------------------------------------
-- TaxiCoords
-- Builds Atlas map coordinates from raw TaxiNodes world positions.
-----------------------------------------------------------------------
local _G = getfenv(0)
local _, private = ...
local LibStub = _G.LibStub
---@type AtlasAddon
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")

local floor = math.floor
local format = string.format

local function snap(value, step)
	if (not step) then
		return value
	end
	return floor(value / step + 0.5) * step
end

-- Converts a world position (TaxiNodes Pos_0 / Pos_1) into map pixels.
--
-- Projection from UiMapAssignment (preferred, exact):
--   region   { Region_0, Region_1, Region_3, Region_4 } = { minX, minY, maxX, maxY } world bounds
--   ui       optional { UiMin_0, UiMin_1, UiMax_0, UiMax_1 }, default { 0, 0, 1, 1 }
--   size     map size in pixels, default 512
--   anchorX, anchorY  optional shift in pixels; -6, -4 centres a 12x12 normal-map button on the node
--
-- Or a manual linear fit:
--   x = offsetX - scaleX * Pos_1    (world Y grows to the west)
--   y = offsetY - scaleY * Pos_0    (world X grows to the north)
--   scale            uniform pixels per yard, used when scaleX / scaleY are not set
--   scaleX, scaleY   per-axis scale (optional)
--   offsetX, offsetY horizontal / vertical shift in map pixels
function private.WorldToMap(pos0, pos1, transform)
	local x, y
	local region = transform.region
	if (region) then
		local minX, minY, maxX, maxY = region[1], region[2], region[3], region[4]
		local ui = transform.ui
		local u0, v0, u1, v1 = 0, 0, 1, 1
		if (ui) then
			u0, v0, u1, v1 = ui[1], ui[2], ui[3], ui[4]
		end
		local size = transform.size or 512
		local u = u0 + (u1 - u0) * (maxY - pos1) / (maxY - minY)
		local v = v0 + (v1 - v0) * (maxX - pos0) / (maxX - minX)
		x = size * u
		y = size * v
	else
		local scaleX = transform.scaleX or transform.scale
		local scaleY = transform.scaleY or transform.scale
		x = transform.offsetX - scaleX * pos1
		y = transform.offsetY - scaleY * pos0
	end
	return x + (transform.anchorX or 0), y + (transform.anchorY or 0)
end

-- nodes: list of { mark, buttonID, Pos_0, Pos_1 [, dx, dy [, colortag]] }
--   dx, dy    optional per-node nudge in map pixels, applied after the transform
--   colortag  optional per-node marker tag, overrides transform.colortag
-- transform: see private.WorldToMap, plus
--   colortag  default marker tag, e.g. "White" or "TaxiAlliance"
--   snap      optional rounding step, e.g. 1 or 0.5
--   large     optional transform for the large map (fields 5 and 6)
-- coords: optional existing list (e.g. hand-placed rows); generated rows are appended to it
-- Returns a table in the AtlasMaps_NPC_DB format:
--   { mark, buttonID, x, y, largeX, largeY, colortag }
function private.BuildTaxiCoords(nodes, transform, coords)
	coords = coords or {}
	for i = 1, #nodes do
		local node = nodes[i]
		local mark, buttonID, pos0, pos1 = node[1], node[2], node[3], node[4]
		local dx, dy = node[5] or 0, node[6] or 0
		local colortag = node[7] or transform.colortag

		local x, y = private.WorldToMap(pos0, pos1, transform)
		x = snap(x + dx, transform.snap)
		y = snap(y + dy, transform.snap)

		local largeX, largeY
		if (transform.large) then
			largeX, largeY = private.WorldToMap(pos0, pos1, transform.large)
			largeX = snap(largeX, transform.large.snap or transform.snap)
			largeY = snap(largeY, transform.large.snap or transform.snap)
		end

		coords[#coords + 1] = { mark, buttonID, x, y, largeX, largeY, colortag }
	end
	return coords
end

-----------------------------------------------------------------------
-- Transport map builder
-- One source table per map produces both the legend rows (AtlasMaps)
-- and the button coords (AtlasMaps_NPC_DB).
-----------------------------------------------------------------------

-- How each kind of node looks.
--   legend  colour escape used in the legend text
--   marker  field 7 tag used on the map: a text colour ("Blue", ...) or an icon ("TaxiAlliance", ...)
local function getDefaultStyles()
	local labels = Atlas.constants.colors.labels
	local fonts = _G.ATLAS_FONT_COLORS or {}
	return {
		Alliance = { legend = labels.ALAN, marker = fonts.Alliance and "Alliance" or "Blue" },
		Horde    = { legend = labels.HRDE, marker = fonts.Horde and "Horde" or "Red" },
		Neutral  = { legend = labels.NUTL, marker = fonts.Neutral and "Neutral" or "Yellow" },
		Ship     = { legend = labels.ORNG, marker = "Orange" },
		Portal   = { legend = labels.PURP, marker = "Purple" },
	}
end

-- def fields:
--   ZoneName, WorldMapID, Faction, DynamicMarkers   copied to the map table
--   transform   see private.WorldToMap; used for nodes with pos
--   styles      optional, overrides / extends the default styles by kind
--   nodes       list of node entries (see below) or plain legend rows such as { "" }
--   footer      optional list of plain legend rows appended at the end
--
-- node entry fields:
--   label   "1", "A", ...
--   id      button ID, links the legend row with the map button
--   name    BZ key of the node name
--   zone    BZ key of the zone (optional)
--   kind    "Alliance", "Horde", "Neutral", "Ship", "Portal", ... (key in styles)
--   pos     { Pos_0, Pos_1 } raw TaxiNodes world position
--   xy      { x, y } hand-placed map position, used when pos is not given
--   nudge   { dx, dy } optional fine tuning in map pixels
--   large   { x, y } optional large map position (fields 5 and 6)
--   marker  optional marker tag override, e.g. "TaxiNeutral"
--   legend  optional legend colour override
--   suffix  optional extra text appended to the legend row
--
-- Returns map, coords
function private.BuildTransportMap(def)
	local ALC = _G.LibStub("AceLocale-3.0"):GetLocale("Atlas")
	local BZ = _G.Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0")
	local zoneColor = Atlas.constants.colors.labels.LGRE
	local COMMA = ALC["Comma"]

	local styles = getDefaultStyles()
	for k, v in pairs(def.styles or {}) do
		styles[k] = v
	end

	local map = {
		ZoneName = def.ZoneName,
		WorldMapID = def.WorldMapID,
		Faction = def.Faction,
		DynamicMarkers = def.DynamicMarkers,
	}
	local coords = {}

	for _, e in ipairs(def.nodes) do
		if (not e.id) then
			-- plain legend row, e.g. { "" }
			map[#map + 1] = e
		else
			local style = styles[e.kind] or {}
			local text = (e.legend or style.legend or "")..format("%2s", e.label)..") "..BZ[e.name]
			if (e.zone) then
				text = text..COMMA..zoneColor..BZ[e.zone]
			end
			if (e.suffix) then
				text = text..e.suffix
			end
			map[#map + 1] = { text, e.id }

			local x, y
			if (e.pos and def.transform) then
				x, y = private.WorldToMap(e.pos[1], e.pos[2], def.transform)
			elseif (e.xy) then
				x, y = e.xy[1], e.xy[2]
			end
			if (x and y) then
				if (e.nudge) then
					x, y = x + (e.nudge[1] or 0), y + (e.nudge[2] or 0)
				end
				local step = def.transform and def.transform.snap
				local lx, ly
				if (e.large) then
					lx, ly = e.large[1], e.large[2]
				end
				coords[#coords + 1] = { e.label, e.id, snap(x, step), snap(y, step), lx, ly, e.marker or style.marker }
			end
		end
	end

	for _, row in ipairs(def.footer or {}) do
		map[#map + 1] = row
	end

	return map, coords
end
