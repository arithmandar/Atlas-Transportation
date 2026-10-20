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
local LGRE = labelcolors.LGRE
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

-----------------------------------------------------------------------
-- Eastern Kingdoms (Alliance)
-- pos = { Pos_0, Pos_1 } copied from TaxiNodes; xy = hand-placed map position
-----------------------------------------------------------------------
local TransAllianceEast_Forever_Map, TransAllianceEast_Forever_Coords =
private.BuildTransportMap({
	ZoneName = { BZ["Eastern Kingdoms"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
	WorldMapID = 13,
	Faction = "Alliance",
	DynamicMarkers = true,
	-- Fitted against the hand-placed coords on the 512x512 map (button TOPLEFT convention).
	transform = { scale = 0.0239019, offsetX = 222.40, offsetY = 128.99, snap = 0.5 },
	nodes = {
		{ label = "A", id = 20001, kind = "Ship", name = "Auberdine", zone = "Darkshore", xy = { 13, 93 } },
		{ label = "B", id = 20002, kind = "Ship", name = "Ratchet", zone = "The Barrens", xy = { 15, 231 } },
		{ label = "C", id = 20003, kind = "Ship", name = "Theramore Isle", zone = "Dustwallow Marsh", xy = { 15, 303 } },
		{ "" },
		{ label = "1", id = 10002, kind = "Alliance", name = "Stormwind", zone = "Elwynn Forest", pos = { -8832.769531, 478.6229858 } }, -- 2
		{ label = "2", id = 10003, kind = "Alliance", name = "Sentinel Hill", zone = "Westfall", pos = { -10628.88965, 1036.680054 } }, -- 4
		{ label = "3", id = 10004, kind = "Alliance", name = "Lakeshire", zone = "Redridge Mountains", pos = { -9429.099609, -2231.399902 } }, -- 5
		{ label = "4", id = 10005, kind = "Alliance", name = "Ironforge", zone = "Dun Morogh", pos = { -4821.779785, -1155.439941 } }, -- 6
		{ label = "5", id = 10006, kind = "Alliance", name = "Menethil Harbor", zone = "Wetlands", pos = { -3792.26001, -783.289978 } }, -- 7
		{ label = "6", id = 10007, kind = "Alliance", name = "Thelsamar", zone = "Loch Modan", pos = { -5421.910156, -2930.01001 } }, -- 8
		{ label = "7", id = 10008, kind = "Alliance", name = "Booty Bay", zone = "Stranglethorn Vale", pos = { -14271.76953, 299.8699951 } }, -- 9
		{ label = "8", id = 10009, kind = "Alliance", name = "Darkshire", zone = "Duskwood", pos = { -10515.45996, -1261.650024 } }, -- 12
		{ label = "9", id = 10010, kind = "Alliance", name = "Southshore", zone = "Hillsbrad", pos = { -711.4799805, -515.4799805 } }, -- 14
		{ label = "10", id = 10011, kind = "Alliance", name = "Eastern Plaguelands", pos = { 2253.399902, -5344.899902 } }, -- 15
		{ label = "11", id = 10012, kind = "Alliance", name = "Refuge Pointe", zone = "Arathi Highlands", pos = { -1240.530029, -2515.110107 } }, -- 16
		{ label = "12", id = 10013, kind = "Alliance", name = "Booty Bay", zone = "Stranglethorn Vale", pos = { -14473.0498, 464.1499939 } }, -- 19
		{ label = "13", id = 10014, kind = "Alliance", name = "Aerie Peak", zone = "The Hinterlands", pos = { 283.7399902, -2002.76001 } }, -- 43
		{ label = "14", id = 10015, kind = "Alliance", name = "Nethergarde Keep", zone = "Blasted Lands", pos = { -11112.25, -3435.73999 } }, -- 45
		{ label = "15", id = 10016, kind = "Alliance", name = "Chillwind Camp", zone = "Western Plaguelands", pos = { 931.3200073, -1430.109985 } }, -- 66
		{ label = "16", id = 10017, kind = "Alliance", name = "Light's Hope Chapel", zone = "Eastern Plaguelands", pos = { 2271.090088, -5340.799805 } }, -- 67
		{ label = "17", id = 10018, kind = "Alliance", name = "Morgan's Vigil", zone = "Burning Steppes", pos = { -8364.610352, -2738.350098 } }, -- 71
		{ label = "18", id = 10019, kind = "Alliance", name = "Thorium Point", zone = "Searing Gorge", pos = { -6552.589844, -1168.27002 } }, -- 74
		{ label = "19", id = 10020, kind = "Neutral", name = "Plaguewood Tower", zone = "Eastern Plaguelands", pos = { 2998.709961, -3050.100098 } }, -- 84
		{ label = "20", id = 10021, kind = "Neutral", name = "Northpass Tower", zone = "Eastern Plaguelands", pos = { 3109.310059, -4285.129883 } }, -- 85
		{ label = "21", id = 10022, kind = "Neutral", name = "Eastwall Tower", zone = "Eastern Plaguelands", pos = { 2499.22998, -4742.850098 } }, -- 86
		{ label = "22", id = 10023, kind = "Neutral", name = "Crown Guard Tower", zone = "Eastern Plaguelands", pos = { 1857.560059, -3658.469971 } }, -- 87
		{ label = "23", id = 10024, kind = "Alliance", name = "Tidegear Coast", zone = "Dun Morogh", pos = { -4375.700195, 864.7780151 } }, -- 3205
		{ label = "24", id = 10026, kind = "Alliance", name = "Powderfuse Port", zone = "Riverglades", pos = { -8180.049805, -5616.259766 } }, -- 3275
		{ label = "25", id = 10027, kind = "Alliance", name = "Farholde Keep", zone = "Riverglades", pos = { -9104.099609, -4830.470215 } }, -- 3276
	},
	footer = {
		{ "" },
		{ LGRE..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
})

local TransHordeEast_Forever_Map, TransHordeEast_Forever_Coords =
private.BuildTransportMap({
	ZoneName = { BZ["Eastern Kingdoms"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
	WorldMapID = 13,
	Faction = "Horde",
	DynamicMarkers = true,
	-- Fitted against the hand-placed coords on the 512x512 map (button TOPLEFT convention).
	transform = { scale = 0.0239019, offsetX = 222.40, offsetY = 128.99, snap = 0.5 },
	nodes = {
		{ label = "A", id = 20001, kind = "Ship", name = "Orgrimmar", zone = "Durotar", xy = { 15, 164 } },
		{ label = "B", id = 20002, kind = "Ship", name = "Ratchet", zone = "The Barrens", xy = { 18, 277 } },
		{ label = "1", id = 10001, kind = "Horde", name = "Northshire Abbey", pos = { -8888.980469, -0.540000021 } }, -- 1
		{ label = "2", id = 10002, kind = "Horde", name = "Programmer Isle", pos = { 16391.81055, 16341.20996 } }, -- 3
		{ label = "3", id = 10003, kind = "Horde", name = "The Sepulcher", zone = "Silverpine Forest", pos = { 478.8599854, 1536.589966 } }, -- 10
		{ label = "4", id = 10004, kind = "Horde", name = "Undercity", zone = "Tirisfal Glades", pos = { 1568.619995, 267.9700012 } }, -- 11
		{ label = "5", id = 10005, kind = "Horde", name = "Tarren Mill", zone = "Hillsbrad", pos = { -0.059999999, -859.9099731 } }, -- 13
		{ label = "6", id = 10006, kind = "Horde", name = "Hammerfall", zone = "Arathi Highlands", pos = { -916.289978, -3496.889893 } }, -- 17
		{ label = "7", id = 10007, kind = "Horde", name = "Booty Bay", zone = "Stranglethorn Vale", pos = { -14444.29004, 509.6199951 } }, -- 18
		{ label = "8", id = 10008, kind = "Horde", name = "Grom'gol", zone = "Stranglethorn Vale", pos = { -12414.17969, 146.2899933 } }, -- 20
		{ label = "9", id = 10009, kind = "Horde", name = "Kargath", zone = "Badlands", pos = { -6633.990234, -2180.050049 } }, -- 21
		{ label = "10", id = 10010, kind = "Horde", name = "Stonard", zone = "Swamp of Sorrows", pos = { -10456.96973, -3279.25 } }, -- 56
		{ label = "11", id = 10011, kind = "Horde", name = "Light's Hope Chapel", zone = "Eastern Plaguelands", pos = { 2327.409912, -5286.890137 } }, -- 68
		{ label = "12", id = 10012, kind = "Horde", name = "Flame Crest", zone = "Burning Steppes", pos = { -7504.029785, -2187.540039 } }, -- 70
		{ label = "13", id = 10013, kind = "Horde", name = "Thorium Point", zone = "Searing Gorge", pos = { -6554.930176, -1100.050049 } }, -- 75
		{ label = "14", id = 10014, kind = "Horde", name = "Revantusk Village", zone = "The Hinterlands", pos = { -635.2600098, -4720.5 } }, -- 76
		{ label = "15", id = 10015, kind = "Neutral", name = "Plaguewood Tower", zone = "Eastern Plaguelands", pos = { 2998.709961, -3050.100098 } }, -- 84
		{ label = "16", id = 10016, kind = "Neutral", name = "Northpass Tower", zone = "Eastern Plaguelands", pos = { 3109.310059, -4285.129883 } }, -- 85
		{ label = "17", id = 10017, kind = "Neutral", name = "Eastwall Tower", zone = "Eastern Plaguelands", pos = { 2499.22998, -4742.850098 } }, -- 86
		{ label = "18", id = 10018, kind = "Neutral", name = "Crown Guard Tower", zone = "Eastern Plaguelands", pos = { 1857.560059, -3658.469971 } }, -- 87
		{ label = "19", id = 10019, kind = "Horde", name = "Rog'mar", zone = "Riverglades", pos = { -7923.740234, -4782.959961 } }, -- 3203
		{ label = "20", id = 10020, kind = "Horde", name = "Powderfuse Port", zone = "Riverglades", pos = { -8157.200195, -5724.669922 } }, -- 3274
	},
	footer = {
		{ "" },
		{ LGRE..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
})

alliance.maps = {
	TransAllianceCosmos_Classic = {
		ZoneName = { WORLD..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
		{ BLUE..BZ["Kalimdor"] },
		{ ALAN.." 1) "..BZ["Darnassus"]..COMMA..LGRE..BZ["Teldrassil"], 10001 },
		{ ALAN.." 2) "..BZ["Rut'theran Village"]..COMMA..LGRE..BZ["Teldrassil"], 10002 },
		{ ALAN.." 3) "..BZ["Auberdine"]..COMMA..LGRE..BZ["Darkshore"], 10003 },
		{ ALAN.." 4) "..BZ["Nighthaven"]..COMMA..LGRE..BZ["Moonglade"], 10004 },
		{ NUTL.." 5) "..BZ["Ratchet"]..COMMA..LGRE..BZ["The Barrens"], 10005 },
		{ ALAN.." 6) "..BZ["Theramore"]..COMMA..LGRE..BZ["Dustwallow Marsh"], 10006 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ ALAN.." 7) "..BZ["Menethil Harbor"]..COMMA..LGRE..BZ["Wetlands"], 10007 },
		{ ALAN.." 8) "..BZ["Ironforge"]..COMMA..LGRE..BZ["Dun Morogh"], 10008 },
		{ ALAN.." 9) "..BZ["Stormwind"]..COMMA..LGRE..BZ["Elwynn Forest"], 10009 },
		{ NUTL.."10) "..BZ["Booty Bay"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 10010 },
	},
	TransAllianceEast_Forever = TransAllianceEast_Forever_Map,
	TransAllianceWest_Forever = {
		ZoneName = { BZ["Kalimdor"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
		WorldMapID = 12,
		Faction = "Alliance",
		{ ORNG.." A) "..BZ["Menethil Harbor"]..COMMA..LGRE..BZ["Wetlands"], 10001 },
		{ ORNG.." B) "..BZ["Stormwind City"]..COMMA..LGRE..BZ["Elwynn Forest"], 10002 },
		{ ORNG.." C) "..BZ["Booty Bay"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 10003 },
		{ },
		{ ALAN.." 1) "..BZ["Rut'theran Village"]..COMMA..LGRE..BZ["Teldrassil"], 20001 },
		{ ALAN.." 2) "..BZ["Nighthaven"]..COMMA..LGRE..BZ["Moonglade"], 20002 },
		{ ALAN.." 3) "..BZ["Everlook"]..COMMA..LGRE..BZ["Winterspring"], 20003 },
		{ ALAN.." 4) "..BZ["Auberdine"]..COMMA..LGRE..BZ["Darkshore"], 20004 },
		{ ALAN.." 5) "..BZ["Talonbranch Glade"]..COMMA..LGRE..BZ["Felwood"], 20005 },
		{ ALAN.." 6) "..BZ["Stonetalon Peak"]..COMMA..LGRE..BZ["Stonetalon Mountains"], 20006 },
		{ ALAN.." 7) "..BZ["Astranaar"]..COMMA..LGRE..BZ["Ashenvale"], 20007 },
		{ ALAN.." 8) "..BZ["Forest Song"]..COMMA..LGRE..BZ["Ashenvale"], 20008 },
		{ ALAN.." 9) "..BZ["Talrendis Point"]..COMMA..LGRE..BZ["Azshara"], 20009 },
		{ ALAN.."10) "..BZ["Nijel's Point"]..COMMA..LGRE..BZ["Desolace"], 20010 },
		{ NUTL.."11) "..BZ["Ratchet"]..COMMA..LGRE..BZ["The Barrens"], 20011 },
		{ ALAN.."12) "..BZ["Theramore"]..COMMA..LGRE..BZ["Dustwallow Marsh"], 20012 },
		{ ALAN.."13) "..BZ["Feathermoon"]..COMMA..LGRE..BZ["Feralas"], 20013 },
		{ ALAN.."14) "..BZ["Thalanaar"]..COMMA..LGRE..BZ["Feralas"], 20014 },
		{ NUTL.."15) "..BZ["Marshal's Refuge"]..COMMA..LGRE..BZ["Un'Goro Crater"], 20015 },
		{ ALAN.."16) "..BZ["Cenarion Hold"]..COMMA..LGRE..BZ["Silithus"], 20016 },
		{ ALAN.."17) "..BZ["Gadgetzan"]..COMMA..LGRE..BZ["Tanaris"], 20017 },
		{ NUTL.."18) "..BZ["Tainted Foothills"]..COMMA..LGRE..BZ["Mount Hyjal"], 20018 },
		{ NUTL.."19) "..BZ["Summit of Eternity"]..COMMA..LGRE..BZ["Mount Hyjal"], 20019 },
		
		{ "" },
		{ LGRE..L["Legend"] },
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


alliance.coords.TransAllianceEast_Forever = TransAllianceEast_Forever_Coords

horde.maps = {
	TransHordeCosmos_Classic = {
		ZoneName = { WORLD..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		{ BLUE..BZ["Kalimdor"] },
		{ HRDE.." 1) "..BZ["Orgrimmar"]..COMMA..LGRE..BZ["Durotar"], 10001 },
		{ HRDE.." 2) "..BZ["Thunder Bluff"]..COMMA..LGRE..BZ["Mulgore"], 10002 },
		{ NUTL.." 3) "..BZ["Ratchet"]..COMMA..LGRE..BZ["The Barrens"], 10003 },
		{ HRDE.." 7) "..BZ["Shrine of Remulos"]..COMMA..LGRE..BZ["Moonglade"], 10007 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ HRDE.." 4) "..BZ["Undercity"]..COMMA..LGRE..BZ["Tirisfal Glades"], 10004 },
		{ HRDE.." 5) "..BZ["Grom'gol"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 10005 },
		{ NUTL.." 6) "..BZ["Booty Bay"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 10006 },
	},
	TransHordeEast_Forever = TransHordeEast_Forever_Map,
	--[[
	TransHordeEast_Classic = {
		ZoneName = { BZ["Eastern Kingdoms"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		WorldMapID = 13,
		Faction = "Horde",
		{ ORNG.." A) "..BZ["Orgrimmar"]..COMMA..LGRE..BZ["Durotar"], 10001 },
		{ ORNG.." B) "..BZ["Ratchet"]..COMMA..LGRE..BZ["The Barrens"], 10002 },
		{ "" };
		{ HRDE.." 1) "..BZ["Light's Hope Chapel"]..COMMA..LGRE..BZ["Eastern Plaguelands"], 20001 },
		{ HRDE.." 2) "..BZ["Undercity"]..COMMA..LGRE..BZ["Tirisfal Glades"], 20002 },
		{ HRDE.." 3) "..BZ["The Sepulcher"]..COMMA..LGRE..BZ["Silverpine Forest"], 20003 },
		{ HRDE.." 4) "..BZ["Tarren Mill"]..COMMA..LGRE..BZ["Hillsbrad Foothills"], 20004 },
		{ HRDE.." 5) "..BZ["Revantusk Village"]..COMMA..LGRE..BZ["The Hinterlands"], 20005 },
		{ HRDE.." 6) "..BZ["Hammerfall"]..COMMA..LGRE..BZ["Arathi Highlands"], 20006 },
		{ HRDE.." 7) "..BZ["Thorium Point"]..COMMA..LGRE..BZ["Searing Gorge"], 20007 },
		{ HRDE.." 8) "..BZ["Kargath"]..COMMA..LGRE..BZ["Badlands"], 20008 },
		{ HRDE.." 9) "..BZ["Flame Crest"]..COMMA..LGRE..BZ["Burning Steppes"], 20009 },
		{ HRDE.."10) "..BZ["Stonard"]..COMMA..LGRE..BZ["Swamp of Sorrows"], 20010 },
		{ HRDE.."11) "..BZ["Grom'gol"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 20011 },
		{ HRDE.."12) "..BZ["Booty Bay"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 20012 },
		{ HRDE.."13) "..BZ["Rog'mar"]..COMMA..LGRE..BZ["Riverglades"], 20013 },
		{ HRDE.."14) "..BZ["Powderfuse Port"]..COMMA..LGRE..BZ["Riverglades"], 20014 },
		{ "" },
		{ LGRE..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
		{ NUTL.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
	]]
	TransHordeWest_Classic = {
		ZoneName = { BZ["Kalimdor"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
		WorldMapID = 12,
		Faction = "Horde",
		{ BLUE.." A) "..BZ["Undercity"]..COMMA..LGRE..BZ["Tirisfal Glades"], 10001 },
		{ BLUE.." B) "..BZ["Grom'gol"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 10002 },
		{ BLUE.." C) "..BZ["Booty Bay"]..COMMA..LGRE..BZ["Stranglethorn Vale"], 10003 },
		{ };
		{ HRDE.." 1) "..BZ["Shrine of Remulos"]..COMMA..LGRE..BZ["Moonglade"], 20001 },
		{ HRDE.." 2) "..BZ["Everlook"]..COMMA..LGRE..BZ["Winterspring"], 20002 },
		{ HRDE.." 3) "..BZ["Bloodvenom Post"]..COMMA..LGRE..BZ["Felwood"], 20003 },
		{ HRDE.." 4) "..BZ["Zoram'gar Outpost"]..COMMA..LGRE..BZ["Ashenvale"], 20004 },
		{ HRDE.." 5) "..BZ["Valormok"]..COMMA..LGRE..BZ["Azshara"], 20005 },
		{ HRDE.." 6) "..BZ["Splintertree Post"]..COMMA..LGRE..BZ["Ashenvale"], 20006 },
		{ HRDE.." 7) "..BZ["Orgrimmar"]..COMMA..LGRE..BZ["Durotar"], 20007 },
		{ HRDE.." 8) "..BZ["Sun Rock Retreat"]..COMMA..LGRE..BZ["Stonetalon Mountains"], 20008 },
		{ HRDE.." 9) "..BZ["Crossroads"]..COMMA..LGRE..BZ["The Barrens"], 20009 },
		{ NUTL.."10) "..BZ["Ratchet"]..COMMA..LGRE..BZ["The Barrens"], 20010 },
		{ HRDE.."11) "..BZ["Shadowprey Village"]..COMMA..LGRE..BZ["Desolace"], 20011 },
		{ HRDE.."12) "..BZ["Thunder Bluff"]..COMMA..LGRE..BZ["Mulgore"], 20012 },
		{ HRDE.."13) "..BZ["Camp Taurajo"]..COMMA..LGRE..BZ["The Barrens"], 20013 },
		{ HRDE.."14) "..BZ["Brackenwall Village"]..COMMA..LGRE..BZ["Dustwallow Marsh"], 20014 },
		{ HRDE.."15) "..BZ["Camp Mojache"]..COMMA..LGRE..BZ["Feralas"], 20015 },
		{ HRDE.."16) "..BZ["Freewind Post"]..COMMA..LGRE..BZ["Thousand Needles"], 20016 },
		{ NUTL.."17) "..BZ["Marshal's Refuge"]..COMMA..LGRE..BZ["Un'Goro Crater"], 20017 },
		{ HRDE.."18) "..BZ["Cenarion Hold"]..COMMA..LGRE..BZ["Silithus"], 20018 },
		{ HRDE.."19) "..BZ["Gadgetzan"]..COMMA..LGRE..BZ["Tanaris"], 20019 },
		{ NUTL.."20) "..BZ["Tainted Foothills"]..COMMA..LGRE..BZ["Mount Hyjal"], 20020 },
		{ NUTL.."21) "..BZ["Summit of Eternity"]..COMMA..LGRE..BZ["Mount Hyjal"], 20021 },
		{ "" },
		{ LGRE..L["Legend"] },
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
	TransHordeEast_Forever = TransHordeEast_Forever_Coords,
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



