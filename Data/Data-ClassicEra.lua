-----------------------------------------------------------------------
-- Data for Classic Era
-----------------------------------------------------------------------
local _G = getfenv(0)
local _, private = ...
local LibStub = _G.LibStub
---@type AtlasAddon
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")

local Client = Atlas.Client

if not Client.isClassicEra then
	return
end

local BZ = Atlas_GetLocaleLibBabble("LibBabble-SubZone-3.0")
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
		{ WHIT.." 1) "..BZ["Darnassus"]..COMMA.._RED..BZ["Teldrassil"], 10001 },
		{ WHIT.." 2) "..BZ["Rut'theran Village"]..COMMA.._RED..BZ["Teldrassil"], 10002 },
		{ WHIT.." 3) "..BZ["Auberdine"]..COMMA.._RED..BZ["Darkshore"], 10003 },
		{ WHIT.." 4) "..BZ["Nighthaven"]..COMMA.._RED..BZ["Moonglade"], 10004 },
		{ NUTL.." 5) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 10005 },
		{ WHIT.." 6) "..BZ["Theramore"]..COMMA.._RED..BZ["Dustwallow Marsh"], 10006 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ WHIT.." 7) "..BZ["Menethil Harbor"]..COMMA.._RED..BZ["Wetlands"], 10007 },
		{ WHIT.." 8) "..BZ["Ironforge"]..COMMA.._RED..BZ["Dun Morogh"], 10008 },
		{ WHIT.." 9) "..BZ["Stormwind"]..COMMA.._RED..BZ["Elwynn Forest"], 10009 },
		{ NUTL.."10) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10010 },
	},
	TransAllianceEast_Classic = {
		ZoneName = { BZ["Eastern Kingdoms"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
		WorldMapID = 13,
		Faction = "Alliance",
		{ BLUE.." A) "..BZ["Auberdine"]..COMMA.._RED..BZ["Darkshore"], 20001 },
		{ BLUE.." B) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 20002 },
		{ BLUE.." C) "..BZ["Theramore Isle"]..COMMA.._RED..BZ["Dustwallow Marsh"], 20003 },
		{ "" },
		{ WHIT.." 1) "..BZ["Light's Hope Chapel"]..COMMA.._RED..BZ["Eastern Plaguelands"], 10001 },
		{ WHIT.." 2) "..BZ["Chillwind Point"]..COMMA.._RED..BZ["Western Plaguelands"], 10002 },
		{ WHIT.." 3) "..BZ["Aerie Peak"]..COMMA.._RED..BZ["The Hinterlands"], 10003 },
		{ WHIT.." 4) "..BZ["Southshore"]..COMMA.._RED..BZ["Hillsbrad Foothills"], 10004 },
		{ WHIT.." 5) "..BZ["Refuge Pointe"]..COMMA.._RED..BZ["Arathi Highlands"], 10005 },
		{ WHIT.." 6) "..BZ["Menethil Harbor"]..COMMA.._RED..BZ["Wetlands"], 10006 },
		{ WHIT.." 7) "..BZ["Ironforge"]..COMMA.._RED..BZ["Dun Morogh"], 10007 },
		{ WHIT.." 8) "..BZ["Thelsamar"]..COMMA.._RED..BZ["Loch Modan"], 10008 },
		{ WHIT.." 9) "..BZ["Thorium Point"]..COMMA.._RED..BZ["Searing Gorge"], 10009 },
		{ WHIT.."10) "..BZ["Morgan's Vigil"]..COMMA.._RED..BZ["Burning Steppes"], 10010 },
		{ WHIT.."11) "..BZ["Stormwind"]..COMMA.._RED..BZ["Elwynn Forest"], 10011 },
		{ WHIT.."12) "..BZ["Lakeshire"]..COMMA.._RED..BZ["Redridge Mountains"], 10012 },
		{ WHIT.."13) "..BZ["Sentinel Hill"]..COMMA.._RED..BZ["Westfall"], 10013 },
		{ WHIT.."14) "..BZ["Darkshire"]..COMMA.._RED..BZ["Duskwood"], 10014 },
		{ WHIT.."15) "..BZ["Nethergarde Keep"]..COMMA.._RED..BZ["Blasted Lands"], 10015 },
		{ WHIT.."16) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10016 },
		{ "" },
		{ _RED..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
	TransAllianceWest_Classic = {
		ZoneName = { BZ["Kalimdor"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
		WorldMapID = 12,
		Faction = "Alliance",
		{ BLUE.." A) "..BZ["Menethil Harbor"]..", ".._RED..BZ["Wetlands"], 20001 },
		{ BLUE.." B) "..BZ["Stormwind City"]..", ".._RED..BZ["Elwynn Forest"], 20002 },
		{ BLUE.." C) "..BZ["Booty Bay"]..", ".._RED..BZ["Stranglethorn Vale"], 20003 },
		{ "" },
		{ WHIT.." 1) "..BZ["Rut'theran Village"]..COMMA.._RED..BZ["Teldrassil"], 10001 },
		{ WHIT.." 2) "..BZ["Nighthaven"]..COMMA.._RED..BZ["Moonglade"], 10002 },
		{ WHIT.." 3) "..BZ["Everlook"]..COMMA.._RED..BZ["Winterspring"], 10003 },
		{ WHIT.." 4) "..BZ["Auberdine"]..COMMA.._RED..BZ["Darkshore"], 10004 },
		{ WHIT.." 5) "..BZ["Talonbranch Glade"]..COMMA.._RED..BZ["Felwood"], 10005 },
		{ WHIT.." 6) "..BZ["Stonetalon Peak"]..COMMA.._RED..BZ["Stonetalon Mountains"], 10006 },
		{ WHIT.." 7) "..BZ["Astranaar"]..COMMA.._RED..BZ["Ashenvale"], 10007 },
		{ WHIT.." 8) "..BZ["Forest Song"]..COMMA.._RED..BZ["Ashenvale"], 10008 },
		{ WHIT.." 9) "..BZ["Talrendis Point"]..COMMA.._RED..BZ["Azshara"], 10009 },
		{ WHIT.."10) "..BZ["Nijel's Point"]..COMMA.._RED..BZ["Desolace"], 10010 },
		{ NUTL.."11) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 10011 },
		{ WHIT.."12) "..BZ["Theramore"]..COMMA.._RED..BZ["Dustwallow Marsh"], 10012 },
		{ WHIT.."13) "..BZ["Feathermoon"]..COMMA.._RED..BZ["Feralas"], 10013 },
		{ WHIT.."14) "..BZ["Thalanaar"]..COMMA.._RED..BZ["Feralas"], 10014 },
		{ NUTL.."15) "..BZ["Marshal's Refuge"]..COMMA.._RED..BZ["Un'Goro Crater"], 10015 },
		{ WHIT.."16) "..BZ["Cenarion Hold"]..COMMA.._RED..BZ["Silithus"], 10016 },
		{ WHIT.."17) "..BZ["Gadgetzan"]..COMMA.._RED..BZ["Tanaris"], 10017 },
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
    TransAllianceEast_Classic = {
        { "A", 20001, 14, 94 }, -- blue
        { "B", 20002, 16, 232 }, -- blue
        { "C", 20003, 16, 304 }, -- blue
        { "1", 10001, 349, 70 }, -- white
        { "2", 10002, 261, 104 }, -- white
        { "3", 10003, 278, 125 }, -- white
        { "4", 10004, 237, 152 }, -- white
        { "5", 10005, 287, 159 }, -- white
        { "6", 10006, 247, 219 }, -- white
        { "7", 10007, 248, 252 }, -- white
        { "8", 10008, 296, 258 }, -- white
        { "9", 10009, 260, 284 }, -- white
        { "10", 10010, 288, 334 }, -- white
        { "11", 10011, 215, 348 }, -- white
        { "12", 10012, 269, 350 }, -- white
        { "13", 10013, 195, 382 }, -- white
        { "14", 10014, 242, 380 }, -- white
        { "15", 10015, 307, 397 }, -- white
        { "16", 10016, 212, 469 }, -- white
    },
    TransAllianceWest_Classic = {
        { "A", 20001, 489, 181 }, -- blue
        { "B", 20002, 489, 270 }, -- blue
        { "C", 20003, 489, 424 }, -- blue
        { "1", 10001, 177, 63 }, -- white
        { "2", 10002, 281, 107 }, -- white
        { "3", 10003, 320, 119 }, -- white
        { "4", 10004, 224, 122 }, -- white
        { "5", 10005, 270, 130 }, -- white
        { "6", 10006, 197, 201 }, -- white
        { "7", 10007, 237, 200 }, -- white
        { "8", 10008, 294, 189 }, -- white
        { "9", 10009, 318, 210 }, -- white
        { "10", 10010, 199, 255 }, -- white
        { "11", 10011, 298, 278 }, -- yellow
        { "12", 10012, 312, 326 }, -- white
        { "13", 10013, 159, 352 }, -- white
        { "14", 10014, 236, 356 }, -- white
        { "15", 10015, 252, 391 }, -- yellow
        { "16", 10016, 215, 409 }, -- white
        { "17", 10017, 300, 408 }, -- white
    },
}

horde.maps = {
	TransHordeCosmos_Classic = {
		ZoneName = { WORLD..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		{ BLUE..BZ["Kalimdor"] },
		{ WHIT.." 1) "..BZ["Orgrimmar"]..COMMA.._RED..BZ["Durotar"], 10001 },
		{ WHIT.." 2) "..BZ["Thunder Bluff"]..COMMA.._RED..BZ["Mulgore"], 10002 },
		{ NUTL.." 3) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 10003 },
		{ WHIT.." 7) "..BZ["Shrine of Remulos"]..COMMA.._RED..BZ["Moonglade"], 10007 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ WHIT.." 4) "..BZ["Undercity"]..COMMA.._RED..BZ["Tirisfal Glades"], 10004 },
		{ WHIT.." 5) "..BZ["Grom'gol"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10005 },
		{ NUTL.." 6) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10006 },
	},
	TransHordeEast_Classic = {
		ZoneName = { BZ["Eastern Kingdoms"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		WorldMapID = 13,
		Faction = "Horde",
		{ BLUE.." A) "..BZ["Orgrimmar"]..COMMA.._RED..BZ["Durotar"], 20001 },
		{ BLUE.." B) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 20002 },
		{ "" },
		{ WHIT.." 1) "..BZ["Light's Hope Chapel"]..COMMA.._RED..BZ["Eastern Plaguelands"], 10001 },
		{ WHIT.." 2) "..BZ["Undercity"]..COMMA.._RED..BZ["Tirisfal Glades"], 10002 },
		{ WHIT.." 3) "..BZ["The Sepulcher"]..COMMA.._RED..BZ["Silverpine Forest"], 10003 },
		{ WHIT.." 4) "..BZ["Tarren Mill"]..COMMA.._RED..BZ["Hillsbrad Foothills"], 10004 },
		{ WHIT.." 5) "..BZ["Revantusk Village"]..COMMA.._RED..BZ["The Hinterlands"], 10005 },
		{ WHIT.." 6) "..BZ["Hammerfall"]..COMMA.._RED..BZ["Arathi Highlands"], 10006 },
		{ WHIT.." 7) "..BZ["Thorium Point"]..COMMA.._RED..BZ["Searing Gorge"], 10007 },
		{ WHIT.." 8) "..BZ["Kargath"]..COMMA.._RED..BZ["Badlands"], 10008 },
		{ WHIT.." 9) "..BZ["Flame Crest"]..COMMA.._RED..BZ["Burning Steppes"], 10009 },
		{ WHIT.."10) "..BZ["Stonard"]..COMMA.._RED..BZ["Swamp of Sorrows"], 10010 },
		{ WHIT.."11) "..BZ["Grom'gol"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10011 },
		{ WHIT.."12) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 10012 },
		{ "" },
		{ _RED..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
		{ NUTL.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
	TransHordeWest_Classic = {
		ZoneName = { BZ["Kalimdor"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		WorldMapID = 12,
		Faction = "Horde",
		{ BLUE.." A) "..BZ["Undercity"]..COMMA.._RED..BZ["Tirisfal Glades"], 20001 },
		{ BLUE.." B) "..BZ["Grom'gol"]..COMMA.._RED..BZ["Stranglethorn Vale"], 20002 },
		{ BLUE.." C) "..BZ["Booty Bay"]..COMMA.._RED..BZ["Stranglethorn Vale"], 20003 },
		{ "" },
		{ WHIT.." 1) "..BZ["Shrine of Remulos"]..COMMA.._RED..BZ["Moonglade"], 10001 },
		{ WHIT.." 2) "..BZ["Everlook"]..COMMA.._RED..BZ["Winterspring"], 10002 },
		{ WHIT.." 3) "..BZ["Bloodvenom Post"]..COMMA.._RED..BZ["Felwood"], 10003 },
		{ WHIT.." 4) "..BZ["Zoram'gar Outpost"]..COMMA.._RED..BZ["Ashenvale"], 10004 },
		{ WHIT.." 5) "..BZ["Valormok"]..COMMA.._RED..BZ["Azshara"], 10005 },
		{ WHIT.." 6) "..BZ["Splintertree Post"]..COMMA.._RED..BZ["Ashenvale"], 10006 },
		{ WHIT.." 7) "..BZ["Orgrimmar"]..COMMA.._RED..BZ["Durotar"], 10007 },
		{ WHIT.." 8) "..BZ["Sun Rock Retreat"]..COMMA.._RED..BZ["Stonetalon Mountains"], 10008 },
		{ WHIT.." 9) "..BZ["Crossroads"]..COMMA.._RED..BZ["The Barrens"], 10009 },
		{ NUTL.."10) "..BZ["Ratchet"]..COMMA.._RED..BZ["The Barrens"], 10010 },
		{ WHIT.."11) "..BZ["Shadowprey Village"]..COMMA.._RED..BZ["Desolace"], 10011 },
		{ WHIT.."12) "..BZ["Thunder Bluff"]..COMMA.._RED..BZ["Mulgore"], 10012 },
		{ WHIT.."13) "..BZ["Camp Taurajo"]..COMMA.._RED..BZ["The Barrens"], 10013 },
		{ WHIT.."14) "..BZ["Brackenwall Village"]..COMMA.._RED..BZ["Dustwallow Marsh"], 10014 },
		{ WHIT.."15) "..BZ["Camp Mojache"]..COMMA.._RED..BZ["Feralas"], 10015 },
		{ WHIT.."16) "..BZ["Freewind Post"]..COMMA.._RED..BZ["Thousand Needles"], 10016 },
		{ NUTL.."17) "..BZ["Marshal's Refuge"]..COMMA.._RED..BZ["Un'Goro Crater"], 10017 },
		{ WHIT.."18) "..BZ["Cenarion Hold"]..COMMA.._RED..BZ["Silithus"], 10018 },
		{ WHIT.."19) "..BZ["Gadgetzan"]..COMMA.._RED..BZ["Tanaris"], 10019 },
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
    TransHordeEast_Classic = {
        { "A", 20001, 15, 164 }, -- blue
        { "B", 20002, 18, 277 }, -- blue
        { "1", 10001, 366, 63 }, -- white
        { "2", 10002, 220, 88 }, -- white
        { "3", 10003, 190, 123 }, -- white
        { "4", 10004, 246, 132 }, -- white
        { "5", 10005, 330, 138 }, -- white
        { "6", 10006, 314, 156 }, -- white
        { "7", 10007, 252, 285 }, -- white
        { "8", 10008, 277, 289 }, -- white
        { "9", 10009, 272, 311 }, -- white
        { "10", 10010, 304, 377 }, -- white
        { "11", 10011, 224, 418 }, -- white
        { "12", 10012, 216, 467 }, -- white
    },
    TransHordeWest_Classic = {
        { "A", 20001, 493, 129 }, -- blue
        { "B", 20002, 496, 361 }, -- blue
        { "C", 20003, 494, 418 }, -- blue
        { "1", 10001, 278, 103 }, -- white
        { "2", 10002, 324, 116 }, -- white
        { "3", 10003, 239, 151 }, -- white
        { "4", 10004, 208, 193 }, -- white
        { "5", 10005, 324, 191 }, -- white
        { "6", 10006, 274, 207 }, -- white
        { "7", 10007, 321, 223 }, -- white
        { "8", 10008, 213, 235 }, -- white
        { "9", 10009, 274, 262 }, -- white
        { "10", 10010, 299, 279 }, -- yellow
        { "11", 10011, 166, 295 }, -- white
        { "12", 10012, 220, 283 }, -- white
        { "13", 10013, 255, 305 }, -- white
        { "14", 10014, 287, 317 }, -- white
        { "15", 10015, 217, 351 }, -- white
        { "16", 10016, 268, 372 }, -- white
        { "17", 10017, 255, 392 }, -- yellow
        { "18", 10018, 212, 410 }, -- white
        { "19", 10019, 299, 408 }, -- white
    },
}

data.maps = {
}

data.coords = {
}



