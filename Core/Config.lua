-- $Id$
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2026 - Arith Hsu, Atlas Team

	This file is part of Atlas.

	Atlas is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	Atlas is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with Atlas; if not, write to the Free Software
	Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

--]]
-----------------------------------------------------------------------
-- Upvalued Lua API.
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

