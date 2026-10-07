-----------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------
local _, private = ...
private.addon_name = "Atlas_Transportation"
private.category = "Transportation Maps"

local constants = {}
private.constants = constants

constants.colors = {
	labels = {
		BLUE = "|cff6666ff", -- usually for informational text like entrance, connection
		GREN = "|cff66cc33", -- NPCs
		_RED = "|cffcc3333",
		ORNG = "|cffcc9933",
		PURP = "|cff9900ff", -- transportation nodes
		WHIT = "|cffffffff", -- encounters
		LBLU = "|cff33cccc",
		CYAN = "|cff00ffff",
		GREY = "|cff999999",
		ALAN = "|cff7babe0", -- Alliance's taxi node
		HRDE = "|cffda6955", -- Horde's taxi node
		NUTL = "|cfffee570", -- Nutral taxi node
	},
	classes = {
		["HUNTER"] 	= "|cffabd473",
		["WARLOCK"] 	= "|cff8788ee",
		["PRIEST"] 	= "|cffffffff",
		["PALADIN"] 	= "|cfff58cba",
		["MAGE"] 	= "|cff3fc7eb",
		["ROGUE"] 	= "|cfffff569",
		["DRUID"] 	= "|cffff7d0a",
		["SHAMAN"] 	= "|cff0070de",
		["WARRIOR"] 	= "|cffc79c6e",
		["DEATHKNIGHT"]	= "|cffc41f3b",
		["MONK"] 	= "|cff00ff96",
		["DEMONHUNTER"]	= "|cffa330c9",
	},
}

constants.defaults = {
	profile = {
		all_faction = false,
	},
}

constants.events = {}
