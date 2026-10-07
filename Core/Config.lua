-----------------------------------------------------------------------
-- Config
-----------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
-- Libraries
local UnitFactionGroup = _G.UnitFactionGroup
local string = _G.string
local format = string.format
-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local _, private = ...
local LibStub = _G.LibStub
local addon = LibStub("AceAddon-3.0"):GetAddon(private.addon_name)
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)

local faction = UnitFactionGroup("player")

local config = {}
private.config = config

local function ShowOption()
	local faction_name
	if (faction == "Alliance") then
		faction_name = FACTION_HORDE
	else
		faction_name = FACTION_ALLIANCE
	end
	
	return format(L["Show %s's transportation maps"], faction_name)
end

config.options = {
	type = "group",
	name = addon.LocName,
	desc = addon.Notes,
	args = {
		group1 = {
			type = "group",
			name = ShowOption,
			order = 10,
			inline = true,
			args = {
				all_faction = {
					name = ENABLE,
					desc = L["Change will take effect after next login; or type '/reload' command to reload addon"],
					type = "toggle",
					order = 10,
					get = function()
						return private.db.all_faction
						
					end,
					set = function(info, value)
						private.db.all_faction = value
					end,
				},
			},
		},
	},
}

