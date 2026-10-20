-----------------------------------------------------------------------
-- TaxiCoords
-- Builds Atlas map coordinates from raw TaxiNodes world positions.
-----------------------------------------------------------------------
local _, private = ...

local floor = math.floor

local function snap(value, step)
	if (not step) then
		return value
	end
	return floor(value / step + 0.5) * step
end

-- Converts a world position (TaxiNodes Pos_0 / Pos_1) into map pixels.
--   x = offsetX - scaleX * Pos_1    (world Y grows to the west)
--   y = offsetY - scaleY * Pos_0    (world X grows to the north)
-- transform fields:
--   scale            uniform pixels per yard, used when scaleX / scaleY are not set
--   scaleX, scaleY   per-axis scale (optional)
--   offsetX, offsetY horizontal / vertical shift in map pixels
function private.WorldToMap(pos0, pos1, transform)
	local scaleX = transform.scaleX or transform.scale
	local scaleY = transform.scaleY or transform.scale
	local x = transform.offsetX - scaleX * pos1
	local y = transform.offsetY - scaleY * pos0
	return x, y
end

-- nodes: list of { mark, buttonID, Pos_0, Pos_1 [, dx, dy [, colortag]] }
--   dx, dy    optional per-node nudge in map pixels, applied after the transform
--   colortag  optional per-node marker tag, overrides transform.colortag
-- transform: see private.WorldToMap, plus
--   colortag  default marker tag, e.g. "White" or "TaxiAlliance"
--   snap      optional rounding step, e.g. 1 or 0.5
--   large     optional transform for the large map (fields 5 and 6)
-- Returns a table in the AtlasMaps_NPC_DB format:
--   { mark, buttonID, x, y, largeX, largeY, colortag }
function private.BuildTaxiCoords(nodes, transform)
	local coords = {}
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

		coords[i] = { mark, buttonID, x, y, largeX, largeY, colortag }
	end
	return coords
end
