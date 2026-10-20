-----------------------------------------------------------------------
-- Data for Forever
-----------------------------------------------------------------------
local _G = getfenv(0)
local _, private = ...
local LibStub = _G.LibStub
---@type AtlasAddon
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")

local Client = Atlas.Client

if not Client.isForever then
	return
end

local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0")
local BF = Atlas_GetLocaleLibBabble("LibBabble-Faction-3.0")
local L = LibStub("AceLocale-3.0"):GetLocale(private.addon_name)
local ALC = LibStub("AceLocale-3.0"):GetLocale("Atlas")

local data = {}
local alliance = {}
local horde = {}
private.data = data
private.alliance = alliance
private.horde = horde

local constants = Atlas.constants
local labelcolors = constants.colors.labels
local classcolors = constants.colors.classes

local BLUE = labelcolors.BLUE
local GREN = labelcolors.GREN
local _RED = labelcolors._RED
local ORNG = labelcolors.ORNG
local PURP = labelcolors.PURP
local WHIT = labelcolors.WHIT
local LBLU = labelcolors.LBLU
local CYAN = labelcolors.CYAN
local GREY = labelcolors.GREY
local ALAN = labelcolors.ALAN -- Alliance's taxi node
local HRDE = labelcolors.HRDE -- Horde's taxi node
local NUTL = labelcolors.NUTL -- Nutral taxi node
local INDENT = "      "

-- Test switch: build the Eastern Kingdoms (Alliance) taxi node coords from the
-- TaxiNodes world positions, and let Atlas draw the node numbers dynamically.
-- Set to false to go back to the hand-placed coords below.
local USE_TAXINODES_COORDS = true

local CL = {
	["HUNTER"] 		= classcolors["HUNTER"],
	["WARLOCK"] 	= classcolors["WARLOCK"],
	["PRIEST"] 		= classcolors["PRIEST"],
	["PALADIN"] 	= classcolors["PALADIN"],
	["MAGE"] 		= classcolors["MAGE"],
	["ROGUE"] 		= classcolors["ROGUE"],
	["DRUID"] 		= classcolors["DRUID"],
	["SHAMAN"] 		= classcolors["SHAMAN"],
	["WARRIOR"] 	= classcolors["WARRIOR"],
	["DEATHKNIGHT"]	= classcolors["DEATHKNIGHT"],
	["MONK"] 		= classcolors["MONK"],
	["DEMONHUNTER"]	= classcolors["DEMONHUNTER"],
}

-- local helper functions
local function getBossName(bossname, encounterID, creatureIndex)
	return Atlas:GetBossName(bossname, encounterID, creatureIndex, private.module_name)
end

local function getCreatureName(creatureName, creatureID)
	return Atlas:GetCreatureName(creatureName, creatureID)
end

local function getQuestTitlebyID(title, id)
	return Atlas:GetQuestTitlebyID(title, id)
end

local function getItemTitlebyID(title, id)
	return Atlas:GetItemTitlebyID(title, id)
end

-- local constants for easier access
local SLASH = ALC["Slash"]
local COLON = ALC["Colon"]
local COMMA = ALC["Comma"]
local L_PAREN = ALC["L-Parenthesis"]
local R_PAREN = ALC["R-Parenthesis"]
local ENTRANCE = ALC["Entrance"]
local WANDERS = ALC["Wanders"]
local UPPER = ALC["Upper"]
local CONNECTION = ALC["Connection"]
local RARE = ALC["Rare"]
local RANDOM = ALC["Random"]

alliance.maps = {
	TransAllianceCosmos_Classic = {
		ZoneName = { WORLD..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
		{ BLUE..BZ["Kalimdor"] },
		{ ALAN.." 1) "..BZ["Darnassus"]..COMMA.._RED..BZ["Teldrassil"], 10001 },
		{ ALAN.." 2) "..BZ["Rut'theran Village"]..COMMA.._RED..BZ["Teldrassil"], 10002 },
		{ ALAN.." 3) "..BZ["Auberdine"]..COMMA.._RED..BZ["Darkshore"], 10003 },
		{ ALAN.." 4) "..BZ["Nighthaven"]..COMMA.._RED..BZ["Moonglade"], 10004 },
		{ NUTL.." 5) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 10005 },
		{ ALAN.." 6) "..BZ["Theramore"]..COMMA.._RED..BZ["Dustwallow Marsh"], 10006 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ ALAN.." 7) "..BZ["Menethil Harbor"]..COMMA.._RED..BZ["Wetlands"], 10007 },
		{ ALAN.." 8) "..BZ["Ironforge"]..COMMA.._RED..BZ["Dun Morogh"], 10008 },
		{ ALAN.." 9) "..BZ["Stormwind"]..COMMA.._RED..BZ["Elwynn Forest"], 10009 },
		{ NUTL.."10) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10010 },
	},
	TransAllianceEast_Forever = {
		ZoneName = { BZ["Eastern Kingdoms"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
		WorldMapID = 13,
		Faction = "Alliance",
		DynamicMarkers = USE_TAXINODES_COORDS,
		{ ORNG.." A) "..BZ["Auberdine"]..COMMA.._RED..BZ["Darkshore"], 20001 },
		{ ORNG.." B) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 20002 },
		{ ORNG.." C) "..BZ["Theramore Isle"]..COMMA.._RED..BZ["Dustwallow Marsh"], 20003 },
		{ "" },
		{ ALAN.." 1) "..BZ["Light's Hope Chapel"]..COMMA.._RED..BZ["Eastern Plaguelands"], 10001 },
		{ ALAN.." 2) "..BZ["Chillwind Camp"]..COMMA.._RED..BZ["Western Plaguelands"], 10002 },
		{ ALAN.." 3) "..BZ["Aerie Peak"]..COMMA.._RED..BZ["The Hinterlands"], 10003 },
		{ ALAN.." 4) "..BZ["Southshore"]..COMMA.._RED..BZ["Hillsbrad Foothills"], 10004 },
		{ ALAN.." 5) "..BZ["Refuge Pointe"]..COMMA.._RED..BZ["Arathi Highlands"], 10005 },
		{ ALAN.." 6) "..BZ["Menethil Harbor"]..COMMA.._RED..BZ["Wetlands"], 10006 },
		{ ALAN.." 7) "..BZ["Ironforge"]..COMMA.._RED..BZ["Dun Morogh"], 10007 },
		-- Tidegear Coast ?
		{ ALAN.." 8) "..BZ["Thelsamar"]..COMMA.._RED..BZ["Loch Modan"], 10008 },
		{ ALAN.." 9) "..BZ["Thorium Point"]..COMMA.._RED..BZ["Searing Gorge"], 10009 },
		{ ALAN.."10) "..BZ["Morgan's Vigil"]..COMMA.._RED..BZ["Burning Steppes"], 10010 },
		{ ALAN.."11) "..BZ["Stormwind"]..COMMA.._RED..BZ["Elwynn Forest"], 10011 },
		{ ALAN.."12) "..BZ["Lakeshire"]..COMMA.._RED..BZ["Redridge Mountains"], 10012 },
		{ ALAN.."13) "..BZ["Sentinel Hill"]..COMMA.._RED..BZ["Westfall"], 10013 },
		{ ALAN.."14) "..BZ["Darkshire"]..COMMA.._RED..BZ["Duskwood"], 10014 },
		{ ALAN.."15) "..BZ["Nethergarde Keep"]..COMMA.._RED..BZ["Blasted Lands"], 10015 },
		{ ALAN.."16) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10016 },
		{ ALAN.."17) "..BZ["Farholde Keep"]..COMMA.._RED..BZ["Riverglades"], 10017 },
		{ ALAN.."18) "..BZ["Powderfuse Port"]..COMMA.._RED..BZ["Riverglades"], 10018 },
		{ "" },
		{ _RED..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
	TransAllianceWest_Forever = {
		ZoneName = { BZ["Kalimdor"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
		WorldMapID = 12,
		Faction = "Alliance",
		{ ORNG.." A) "..BZ["Menethil Harbor"]..COMMA.._RED..BZ["Wetlands"], 10001 },
		{ ORNG.." B) "..BZ["Stormwind City"]..COMMA.._RED..BZ["Elwynn Forest"], 10002 },
		{ ORNG.." C) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10003 },
		{ },
		{ ALAN.." 1) "..BZ["Rut'theran Village"]..COMMA.._RED..BZ["Teldrassil"], 20001 },
		{ ALAN.." 2) "..BZ["Nighthaven"]..COMMA.._RED..BZ["Moonglade"], 20002 },
		{ ALAN.." 3) "..BZ["Everlook"]..COMMA.._RED..BZ["Winterspring"], 20003 },
		{ ALAN.." 4) "..BZ["Auberdine"]..COMMA.._RED..BZ["Darkshore"], 20004 },
		{ ALAN.." 5) "..BZ["Talonbranch Glade"]..COMMA.._RED..BZ["Felwood"], 20005 },
		{ ALAN.." 6) "..BZ["Stonetalon Peak"]..COMMA.._RED..BZ["Stonetalon Mountains"], 20006 },
		{ ALAN.." 7) "..BZ["Astranaar"]..COMMA.._RED..BZ["Ashenvale"], 20007 },
		{ ALAN.." 8) "..BZ["Forest Song"]..COMMA.._RED..BZ["Ashenvale"], 20008 },
		{ ALAN.." 9) "..BZ["Talrendis Point"]..COMMA.._RED..BZ["Azshara"], 20009 },
		{ ALAN.."10) "..BZ["Nijel's Point"]..COMMA.._RED..BZ["Desolace"], 20010 },
		{ NUTL.."11) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 20011 },
		{ ALAN.."12) "..BZ["Theramore"]..COMMA.._RED..BZ["Dustwallow Marsh"], 20012 },
		{ ALAN.."13) "..BZ["Feathermoon"]..COMMA.._RED..BZ["Feralas"], 20013 },
		{ ALAN.."14) "..BZ["Thalanaar"]..COMMA.._RED..BZ["Feralas"], 20014 },
		{ NUTL.."15) "..BZ["Marshal's Refuge"]..COMMA.._RED..BZ["Un'Goro Crater"], 20015 },
		{ ALAN.."16) "..BZ["Cenarion Hold"]..COMMA.._RED..BZ["Silithus"], 20016 },
		{ ALAN.."17) "..BZ["Gadgetzan"]..COMMA.._RED..BZ["Tanaris"], 20017 },
		{ NUTL.."18) "..BZ["Tainted Foothills"]..COMMA.._RED..BZ["Mount Hyjal"], 20018 },
		{ NUTL.."19) "..BZ["Summit of Eternity"]..COMMA.._RED..BZ["Mount Hyjal"], 20019 },
		
		{ "" },
		{ _RED..L["Legend"] },
		{ NUTL..L["Yellow"]..COLON..L["Taxi Nodes"]..ALC["Hyphen"]..L["Nutral"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
}
alliance.coords = {
	TransAllianceCosmos_Classic = {
		{ 1, 10001, 32, 101 },
		{ 2, 10002, 52, 123 },
		{ 3, 10003, 61, 146 },
		{ 4, 10004, 106, 132 },
		{ 5, 10005, 116, 256 },
		{ 6, 10006, 135, 300 },
		{ 7, 10007, 402, 229 },
		{ 8, 10008, 402, 248 },
		{ 9, 10009, 385, 304 },
		{10, 10010, 388, 373 },
	},
    TransAllianceEast_Forever = {
        { "A", 20001, 13, 93 }, -- orange
        { "B", 20002, 15, 231 }, -- orange
        { "C", 20003, 15, 303 }, -- orange
		{ "1", 10001, 349, 69 }, -- Light's Hope Chapel
        { "2", 10002, 261, 103 }, -- Chillwind Point
        { "3", 10003, 278, 124 }, -- Aerie Peak
        { "4", 10004, 236, 151 }, -- Southshore
        { "5", 10005, 287, 158 }, -- Refuge Pointe
        { "6", 10006, 247, 218 }, -- enethil Harbor
        { "7", 10007, 247, 251 }, -- Ironforge
        { "8", 10008, 295, 257 }, -- Thelsamar
        { "9", 10009, 259, 283 }, -- Thorium
        { "10", 10010, 287, 333 }, -- Morgan's Vigil
        { "11", 10011, 214, 347 }, -- Stormwind
        { "12", 10012, 268, 349 }, -- Lakeshire
        { "13", 10013, 194, 381 }, -- Sentinel Hill
        { "14", 10014, 241, 379 }, -- Darkshire
        { "15", 10015, 306, 396 }, -- Nethergarde Keep
        { "16", 10016, 211, 468 }, -- Booty Bay
        { "17", 10017, 338, 347 }, -- Farholde Keep
        { "18", 10018, 349, 325 }, -- Powderfuse Port
    },
    TransAllianceWest_Forever = {
        { "A", 10001, 488, 180 }, -- orange
        { "B", 10002, 488, 269 }, -- orange
        { "C", 10003, 488, 423 }, -- orange
        { "1", 20001, 210, 72 }, -- blue
        { "2", 20002, 281, 106 }, -- blue
        { "3", 20003, 320, 118 }, -- blue
        { "4", 20004, 223, 121 }, -- blue
        { "5", 20005, 270, 129 }, -- blue
        { "6", 20006, 197, 200 }, -- blue
        { "7", 20007, 236, 199 }, -- blue
        { "8", 20008, 293, 188 }, -- blue
        { "9", 20009, 317, 209 }, -- blue
        { "10", 20010, 198, 254 }, -- blue
        { "11", 20011, 298, 278 }, -- yellow
        { "12", 20012, 311, 325 }, -- blue
        { "13", 20013, 158, 351 }, -- blue
        { "14", 20014, 235, 355 }, -- blue
        { "15", 20015, 252, 391 }, -- yellow
        { "16", 20016, 214, 408 }, -- blue
        { "17", 20017, 299, 407 }, -- blue
        { "18", 20018, 281, 167 }, -- yellow
        { "19", 20019, 291, 148 }, -- yellow
    },

}


-- Eastern Kingdoms (Alliance) taxi nodes, raw TaxiNodes world positions.
-- { mark, buttonID, Pos_0, Pos_1 [, dx, dy [, colortag]] }
local TransAllianceEast_Forever_Nodes = {
	{ "1",  10001,   2271.09,  -5340.8   }, -- Light's Hope Chapel (TaxiNodes 67)
	{ "2",  10002,    931.32,  -1430.11  }, -- Chillwind Camp (66)
	{ "3",  10003,    283.74,  -2002.76  }, -- Aerie Peak (43)
	{ "4",  10004,   -711.48,   -515.48  }, -- Southshore (14)
	{ "5",  10005,  -1240.53,  -2515.11  }, -- Refuge Pointe (16)
	{ "6",  10006,  -3792.26,   -783.29  }, -- Menethil Harbor (7)
	{ "7",  10007,  -4821.78,  -1155.44  }, -- Ironforge (6)
	--{ "?", 10019,  -4375.7,    864.778 }, -- Tidegear Coast (3205), estimated around 202, 233
	{ "8",  10008,  -5421.91,  -2930.01  }, -- Thelsamar (8)
	{ "9",  10009,  -6552.59,  -1168.27  }, -- Thorium Point (74)
	{ "10", 10010,  -8364.61,  -2738.35  }, -- Morgan's Vigil (71)
	{ "11", 10011,  -8832.77,    478.623 }, -- Stormwind (2)
	{ "12", 10012,  -9429.1,   -2231.4   }, -- Lakeshire (5)
	{ "13", 10013, -10628.9,    1036.68  }, -- Sentinel Hill (4)
	{ "14", 10014, -10515.5,   -1261.65  }, -- Darkshire (12)
	{ "15", 10015, -11112.3,   -3435.74  }, -- Nethergarde Keep (45)
	{ "16", 10016, -14271.8,     299.87  }, -- Booty Bay (9)
	{ "17", 10017,  -9104.1,   -4830.47  }, -- Farholde Keep (3276)
	{ "18", 10018,  -8180.05,  -5616.26  }, -- Powderfuse Port (3275)
}

-- Fitted against the hand-placed coords on the 512x512 map (button TOPLEFT convention).
--   x = offsetX - scale * Pos_1
--   y = offsetY - scale * Pos_0
local TransAllianceEast_Forever_Transform = {
	scale    = 0.0239019,
	offsetX  = 222.40,
	offsetY  = 128.99,
	colortag = "Green", -- a contrasting colour while testing against the numbers drawn in the image
	snap     = 0.5,
}

if (USE_TAXINODES_COORDS) then
	-- Ship destinations are not taxi nodes, keep them hand-placed.
	alliance.coords.TransAllianceEast_Forever = private.BuildTaxiCoords(
		TransAllianceEast_Forever_Nodes,
		TransAllianceEast_Forever_Transform,
		{
			{ "A", 20001, 13, 93 }, -- orange
			{ "B", 20002, 15, 231 }, -- orange
			{ "C", 20003, 15, 303 }, -- orange
		}
	)
end

horde.maps = {
	TransHordeCosmos_Classic = {
		ZoneName = { WORLD..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		{ BLUE..BZ["Kalimdor"] },
		{ HRDE.." 1) "..BZ["Orgrimmar"]..COMMA.._RED..BZ["Durotar"], 10001 },
		{ HRDE.." 2) "..BZ["Thunder Bluff"]..COMMA.._RED..BZ["Mulgore"], 10002 },
		{ NUTL.." 3) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 10003 },
		{ HRDE.." 7) "..BZ["Shrine of Remulos"]..COMMA.._RED..BZ["Moonglade"], 10007 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ HRDE.." 4) "..BZ["Undercity"]..COMMA.._RED..BZ["Tirisfal Glades"], 10004 },
		{ HRDE.." 5) "..BZ["Grom'gol"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10005 },
		{ NUTL.." 6) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10006 },
	},
	TransHordeEast_Classic = {
		ZoneName = { BZ["Eastern Kingdoms"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		WorldMapID = 13,
		Faction = "Horde",
		{ ORNG.." A) "..BZ["Orgrimmar"]..COMMA.._RED..BZ["Durotar"], 10001 },
		{ ORNG.." B) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 10002 },
		{ "" };
		{ HRDE.." 1) "..BZ["Light's Hope Chapel"]..COMMA.._RED..BZ["Eastern Plaguelands"], 20001 },
		{ HRDE.." 2) "..BZ["Undercity"]..COMMA.._RED..BZ["Tirisfal Glades"], 20002 },
		{ HRDE.." 3) "..BZ["The Sepulcher"]..COMMA.._RED..BZ["Silverpine Forest"], 20003 },
		{ HRDE.." 4) "..BZ["Tarren Mill"]..COMMA.._RED..BZ["Hillsbrad Foothills"], 20004 },
		{ HRDE.." 5) "..BZ["Revantusk Village"]..COMMA.._RED..BZ["The Hinterlands"], 20005 },
		{ HRDE.." 6) "..BZ["Hammerfall"]..COMMA.._RED..BZ["Arathi Highlands"], 20006 },
		{ HRDE.." 7) "..BZ["Thorium Point"]..COMMA.._RED..BZ["Searing Gorge"], 20007 },
		{ HRDE.." 8) "..BZ["Kargath"]..COMMA.._RED..BZ["Badlands"], 20008 },
		{ HRDE.." 9) "..BZ["Flame Crest"]..COMMA.._RED..BZ["Burning Steppes"], 20009 },
		{ HRDE.."10) "..BZ["Stonard"]..COMMA.._RED..BZ["Swamp of Sorrows"], 20010 },
		{ HRDE.."11) "..BZ["Grom'gol"]..COMMA.._RED..BZ["Stranglethorn Vale"], 20011 },
		{ HRDE.."12) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 20012 },
		{ HRDE.."13) "..BZ["Rog'mar"]..COMMA.._RED..BZ["Riverglades"], 20013 },
		{ HRDE.."14) "..BZ["Powderfuse Port"]..COMMA.._RED..BZ["Riverglades"], 20014 },
		{ "" },
		{ _RED..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
		{ NUTL.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
	TransHordeWest_Classic = {
		ZoneName = { BZ["Kalimdor"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		WorldMapID = 12,
		Faction = "Horde",
		{ BLUE.." A) "..BZ["Undercity"]..COMMA.._RED..BZ["Tirisfal Glades"], 10001 },
		{ BLUE.." B) "..BZ["Grom'gol"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10002 },
		{ BLUE.." C) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10003 },
		{ };
		{ HRDE.." 1) "..BZ["Shrine of Remulos"]..COMMA.._RED..BZ["Moonglade"], 20001 },
		{ HRDE.." 2) "..BZ["Everlook"]..COMMA.._RED..BZ["Winterspring"], 20002 },
		{ HRDE.." 3) "..BZ["Bloodvenom Post"]..COMMA.._RED..BZ["Felwood"], 20003 },
		{ HRDE.." 4) "..BZ["Zoram'gar Outpost"]..COMMA.._RED..BZ["Ashenvale"], 20004 },
		{ HRDE.." 5) "..BZ["Valormok"]..COMMA.._RED..BZ["Azshara"], 20005 },
		{ HRDE.." 6) "..BZ["Splintertree Post"]..COMMA.._RED..BZ["Ashenvale"], 20006 },
		{ HRDE.." 7) "..BZ["Orgrimmar"]..COMMA.._RED..BZ["Durotar"], 20007 },
		{ HRDE.." 8) "..BZ["Sun Rock Retreat"]..COMMA.._RED..BZ["Stonetalon Mountains"], 20008 },
		{ HRDE.." 9) "..BZ["Crossroads"]..COMMA.._RED..BZ["The Barrens"], 20009 },
		{ NUTL.."10) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 20010 },
		{ HRDE.."11) "..BZ["Shadowprey Village"]..COMMA.._RED..BZ["Desolace"], 20011 },
		{ HRDE.."12) "..BZ["Thunder Bluff"]..COMMA.._RED..BZ["Mulgore"], 20012 },
		{ HRDE.."13) "..BZ["Camp Taurajo"]..COMMA.._RED..BZ["The Barrens"], 20013 },
		{ HRDE.."14) "..BZ["Brackenwall Village"]..COMMA.._RED..BZ["Dustwallow Marsh"], 20014 },
		{ HRDE.."15) "..BZ["Camp Mojache"]..COMMA.._RED..BZ["Feralas"], 20015 },
		{ HRDE.."16) "..BZ["Freewind Post"]..COMMA.._RED..BZ["Thousand Needles"], 20016 },
		{ NUTL.."17) "..BZ["Marshal's Refuge"]..COMMA.._RED..BZ["Un'Goro Crater"], 20017 },
		{ HRDE.."18) "..BZ["Cenarion Hold"]..COMMA.._RED..BZ["Silithus"], 20018 },
		{ HRDE.."19) "..BZ["Gadgetzan"]..COMMA.._RED..BZ["Tanaris"], 20019 },
		{ NUTL.."20) "..BZ["Tainted Foothills"]..COMMA.._RED..BZ["Mount Hyjal"], 20020 },
		{ NUTL.."21) "..BZ["Summit of Eternity"]..COMMA.._RED..BZ["Mount Hyjal"], 20021 },
		{ "" },
		{ _RED..L["Legend"] },
		{ NUTL..L["Yellow"]..COLON..L["Taxi Nodes"]..ALC["Hyphen"]..L["Nutral"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
		{ NUTL.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
}
horde.coords = {
	TransHordeCosmos_Classic = {
		{ 1, 10001, 133, 216 },
		{ 2, 10002, 65, 261 },
		{ 3, 10003, 120, 261 },
		{ 4, 10004, 388, 150 },
		{ 5, 10005, 392, 346 },
		{ 6, 10006, 386, 373 },
		{ 7, 10007, 107, 130 },
	},
    TransHordeEast_Forever = {
        { "A", 10001, 15, 164 }, -- blue
        { "B", 10002, 18, 277 }, -- blue
        { "1", 20001, 366, 62 }, -- red
        { "2", 20002, 220, 87 }, -- red
        { "3", 20003, 190, 122 }, -- red
        { "4", 20004, 245, 131 }, -- red
        { "5", 20005, 330, 137 }, -- red
        { "6", 20006, 314, 155 }, -- red
        { "7", 20007, 251, 284 }, -- red
        { "8", 20008, 276, 288 }, -- red
        { "9", 20009, 271, 310 }, -- red
        { "10", 20010, 303, 376 }, -- red
        { "11", 20011, 223, 417 }, -- red
        { "12", 20012, 215, 466 }, -- red
        { "13", 20013, 332, 315 }, -- red
        { "14", 20014, 348, 327 }, -- red
    },
    TransHordeWest_Forever = {
        { "A", 10001, 492, 128 }, -- orange
        { "B", 10002, 495, 360 }, -- orange
        { "C", 10003, 493, 417 }, -- orange
        { "1", 20001, 278, 102 }, -- red
        { "2", 20002, 324, 115 }, -- red
        { "3", 20003, 239, 150 }, -- red
        { "4", 20004, 207, 192 }, -- red
        { "5", 20005, 324, 190 }, -- red
        { "6", 20006, 274, 206 }, -- red
        { "7", 20007, 320, 222 }, -- red
        { "8", 20008, 212, 234 }, -- red
        { "9", 20009, 273, 261 }, -- red
        { "10", 20010, 298, 278 }, -- yellow
        { "11", 20011, 165, 294 }, -- red
        { "12", 20012, 219, 282 }, -- red
        { "13", 20013, 254, 304 }, -- red
        { "14", 20014, 286, 316 }, -- red
        { "15", 20015, 216, 350 }, -- red
        { "16", 20016, 267, 371 }, -- red
        { "17", 20017, 254, 391 }, -- yellow
        { "18", 20018, 211, 409 }, -- red
        { "19", 20019, 298, 407 }, -- red
        { "20", 20020, 280, 167 }, -- yellow
        { "21", 20021, 291, 148 }, -- yellow
    },
}

data.maps = {
}

data.coords = {
}



