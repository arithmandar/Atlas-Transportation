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
-- Eastern Kingdoms
-- pos = { Pos_0, Pos_1 } copied from TaxiNodes; xy = hand-placed map position
-----------------------------------------------------------------------
local TransAllianceEast_Forever_Map, TransAllianceEast_Forever_Coords =
private.BuildTransportMap({
	ZoneName = { BZ["Eastern Kingdoms"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
	WorldMapID = 13,
	Faction = "Alliance",
	DynamicMarkers = true,
	-- UiMap 1463 (taxi map, Eastern Kingdoms), from UiMapAssignment. anchor -6, -4 centres the marker on the node.
	transform = { region = { -15980, -11880, 5817, 9917 }, size = 512, anchorX = -6, anchorY = -4, snap = 0.5 },
	nodes = {
		{ label = "A", id = 20001, kind = "Ship", name = "Auberdine", zone = "Darkshore", xy = { 13, 93 } },
		{ label = "B", id = 20002, kind = "Ship", name = "Ratchet", zone = "The Barrens", xy = { 15, 231 } },
		{ label = "C", id = 20003, kind = "Ship", name = "Theramore Isle", zone = "Dustwallow Marsh", xy = { 15, 303 } },
		{ "" },
		{ label = "1", id = 10001, kind = "Alliance", name = "Stormwind", zone = "Elwynn Forest", pos = { -8832.769531, 478.6229858 } }, -- 2
		{ label = "2", id = 10002, kind = "Alliance", name = "Sentinel Hill", zone = "Westfall", pos = { -10628.88965, 1036.680054 } }, -- 4
		{ label = "3", id = 10003, kind = "Alliance", name = "Lakeshire", zone = "Redridge Mountains", pos = { -9429.099609, -2231.399902 } }, -- 5
		{ label = "4", id = 10004, kind = "Alliance", name = "Ironforge", zone = "Dun Morogh", pos = { -4821.779785, -1155.439941 } }, -- 6
		{ label = "5", id = 10005, kind = "Alliance", name = "Menethil Harbor", zone = "Wetlands", pos = { -3792.26001, -783.289978 } }, -- 7
		{ label = "6", id = 10006, kind = "Alliance", name = "Thelsamar", zone = "Loch Modan", pos = { -5421.910156, -2930.01001 } }, -- 8
		{ label = "7", id = 10007, kind = "Alliance", name = "Booty Bay", zone = "Stranglethorn Vale", pos = { -14271.76953, 299.8699951 } }, -- 9
		{ label = "8", id = 10008, kind = "Alliance", name = "Darkshire", zone = "Duskwood", pos = { -10515.45996, -1261.650024 } }, -- 12
		{ label = "9", id = 10009, kind = "Alliance", name = "Southshore", zone = "Hillsbrad", pos = { -711.4799805, -515.4799805 } }, -- 14
		{ label = "10", id = 10010, kind = "Alliance", name = "Eastern Plaguelands", pos = { 2253.399902, -5344.899902 } }, -- 15
		{ label = "11", id = 10011, kind = "Alliance", name = "Refuge Pointe", zone = "Arathi Highlands", pos = { -1240.530029, -2515.110107 } }, -- 16
		{ label = "12", id = 10012, kind = "Alliance", name = "Aerie Peak", zone = "The Hinterlands", pos = { 283.7399902, -2002.76001 } }, -- 43
		{ label = "13", id = 10013, kind = "Alliance", name = "Nethergarde Keep", zone = "Blasted Lands", pos = { -11112.25, -3435.73999 } }, -- 45
		{ label = "14", id = 10014, kind = "Alliance", name = "Chillwind Camp", zone = "Western Plaguelands", pos = { 931.3200073, -1430.109985 } }, -- 66
		{ label = "15", id = 10015, kind = "Alliance", name = "Light's Hope Chapel", zone = "Eastern Plaguelands", pos = { 2271.090088, -5340.799805 } }, -- 67
		{ label = "16", id = 10016, kind = "Alliance", name = "Morgan's Vigil", zone = "Burning Steppes", pos = { -8364.610352, -2738.350098 } }, -- 71
		{ label = "17", id = 10017, kind = "Alliance", name = "Thorium Point", zone = "Searing Gorge", pos = { -6552.589844, -1168.27002 } }, -- 74
		{ label = "18", id = 10018, kind = "Neutral", name = "Plaguewood Tower", zone = "Eastern Plaguelands", pos = { 2998.709961, -3050.100098 } }, -- 84
		{ label = "19", id = 10019, kind = "Neutral", name = "Northpass Tower", zone = "Eastern Plaguelands", pos = { 3109.310059, -4285.129883 } }, -- 85
		{ label = "20", id = 10020, kind = "Neutral", name = "Eastwall Tower", zone = "Eastern Plaguelands", pos = { 2499.22998, -4742.850098 } }, -- 86
		{ label = "21", id = 10021, kind = "Neutral", name = "Crown Guard Tower", zone = "Eastern Plaguelands", pos = { 1857.560059, -3658.469971 } }, -- 87
		{ label = "22", id = 10022, kind = "Alliance", name = "Tidegear Coast", zone = "Dun Morogh", pos = { -4375.700195, 864.7780151 } }, -- 3205
		{ label = "23", id = 10023, kind = "Alliance", name = "Powderfuse Port", zone = "Riverglades", pos = { -8180.049805, -5616.259766 } }, -- 3275
		{ label = "24", id = 10024, kind = "Alliance", name = "Farholde Keep", zone = "Riverglades", pos = { -9104.099609, -4830.470215 } }, -- 3276
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
	-- UiMap 1463 (taxi map, Eastern Kingdoms), from UiMapAssignment. anchor -6, -4 centres the marker on the node.
	transform = { region = { -15980, -11880, 5817, 9917 }, size = 512, anchorX = -6, anchorY = -4, snap = 0.5 },
	nodes = {
		{ label = "A", id = 20001, kind = "Ship", name = "Orgrimmar", zone = "Durotar", xy = { 15, 164 } },
		{ label = "B", id = 20002, kind = "Ship", name = "Ratchet", zone = "The Barrens", xy = { 18, 277 } },
		{ "" },
		{ label = "1", id = 10001, kind = "Horde", name = "The Sepulcher", zone = "Silverpine Forest", pos = { 478.8599854, 1536.589966 } }, -- 10
		{ label = "2", id = 10002, kind = "Horde", name = "Undercity", zone = "Tirisfal Glades", pos = { 1568.619995, 267.9700012 } }, -- 11
		{ label = "3", id = 10003, kind = "Horde", name = "Tarren Mill", zone = "Hillsbrad", pos = { -0.059999999, -859.9099731 } }, -- 13
		{ label = "4", id = 10004, kind = "Horde", name = "Hammerfall", zone = "Arathi Highlands", pos = { -916.289978, -3496.889893 } }, -- 17
		{ label = "5", id = 10005, kind = "Horde", name = "Booty Bay", zone = "Stranglethorn Vale", pos = { -14444.29004, 509.6199951 } }, -- 18
		{ label = "6", id = 10006, kind = "Horde", name = "Grom'gol", zone = "Stranglethorn Vale", pos = { -12414.17969, 146.2899933 } }, -- 20
		{ label = "7", id = 10007, kind = "Horde", name = "Kargath", zone = "Badlands", pos = { -6633.990234, -2180.050049 } }, -- 21
		{ label = "8", id = 10008, kind = "Horde", name = "Stonard", zone = "Swamp of Sorrows", pos = { -10456.96973, -3279.25 } }, -- 56
		{ label = "9", id = 10009, kind = "Horde", name = "Light's Hope Chapel", zone = "Eastern Plaguelands", pos = { 2327.409912, -5286.890137 } }, -- 68
		{ label = "10", id = 10010, kind = "Horde", name = "Flame Crest", zone = "Burning Steppes", pos = { -7504.029785, -2187.540039 } }, -- 70
		{ label = "11", id = 10011, kind = "Horde", name = "Thorium Point", zone = "Searing Gorge", pos = { -6554.930176, -1100.050049 } }, -- 75
		{ label = "12", id = 10012, kind = "Horde", name = "Revantusk Village", zone = "The Hinterlands", pos = { -635.2600098, -4720.5 } }, -- 76
		{ label = "13", id = 10013, kind = "Neutral", name = "Plaguewood Tower", zone = "Eastern Plaguelands", pos = { 2998.709961, -3050.100098 } }, -- 84
		{ label = "14", id = 10014, kind = "Neutral", name = "Northpass Tower", zone = "Eastern Plaguelands", pos = { 3109.310059, -4285.129883 } }, -- 85
		{ label = "15", id = 10015, kind = "Neutral", name = "Eastwall Tower", zone = "Eastern Plaguelands", pos = { 2499.22998, -4742.850098 } }, -- 86
		{ label = "16", id = 10016, kind = "Neutral", name = "Crown Guard Tower", zone = "Eastern Plaguelands", pos = { 1857.560059, -3658.469971 } }, -- 87
		{ label = "17", id = 10017, kind = "Horde", name = "Rog'mar", zone = "Riverglades", pos = { -7923.740234, -4782.959961 } }, -- 3203
		{ label = "18", id = 10018, kind = "Horde", name = "Powderfuse Port", zone = "Riverglades", pos = { -8157.200195, -5724.669922 } }, -- 3274
	},
	footer = {
		{ "" },
		{ LGRE..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
})

-----------------------------------------------------------------------
-- Kalimdor
-- pos = { Pos_0, Pos_1 } copied from TaxiNodes; xy = hand-placed map position
-----------------------------------------------------------------------
local TransAllianceWest_Forever_Map, TransAllianceWest_Forever_Coords =
private.BuildTransportMap({
	ZoneName = { BZ["Kalimdor"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
	WorldMapID = 12,
	Faction = "Alliance",
	DynamicMarkers = true,
	-- UiMap 1464 (taxi map, Kalimdor), from UiMapAssignment. anchor -6, -4 centres the marker on the node.
	transform = { region = { -11870, -13370, 12470, 10970 }, size = 512, anchorX = -6, anchorY = -4, snap = 0.5 },
	nodes = {
		{ label = "A", id = 20001, kind = "Ship", name = "Auberdine", zone = "Darkshore", xy = { 488.76, 177.58 } },
		{ label = "B", id = 20002, kind = "Ship", name = "Stormwind City", zone = "Elwynn Forest", xy = { 488.08, 266.58 } },
		{ label = "C", id = 20003, kind = "Ship", name = "Booty Bay", zone = "Stranglethorn Vale", xy = { 488.29, 420.58 } },
		{ "" },
		{ label = "1", id = 10001, kind = "Alliance", name = "Auberdine", zone = "Darkshore", pos = { 6341.379883, 557.6799927 } }, -- 26
		{ label = "2", id = 10002, kind = "Alliance", name = "Rut'theran Village", zone = "Teldrassil", pos = { 8643.589844, 841.0499878 } }, -- 27
		{ label = "3", id = 10003, kind = "Alliance", name = "Astranaar", zone = "Ashenvale", pos = { 2827.340088, -289.2399902 } }, -- 28
		{ label = "4", id = 10004, kind = "Alliance", name = "Thalanaar", zone = "Feralas", pos = { -4491.879883, -775.8900146 } }, -- 31
		{ label = "5", id = 10005, kind = "Alliance", name = "Theramore", zone = "Dustwallow Marsh", pos = { -3825.370117, -4516.580078 } }, -- 32
		{ label = "6", id = 10006, kind = "Alliance", name = "Stonetalon Peak", zone = "Stonetalon Mountains", pos = { 2681.129883, 1461.680054 } }, -- 33
		{ label = "7", id = 10007, kind = "Alliance", name = "Nijel's Point", zone = "Desolace", pos = { 139.2400055, 1325.819946 } }, -- 37
		{ label = "8", id = 10008, kind = "Alliance", name = "Gadgetzan", zone = "Tanaris", pos = { -7223.970215, -3734.590088 } }, -- 39
		{ label = "9", id = 10009, kind = "Alliance", name = "Feathermoon", zone = "Feralas", pos = { -4373.799805, 3338.649902 } }, -- 41
		{ label = "10", id = 10010, kind = "Alliance", name = "Moonglade", pos = { 7458.450195, -2487.209961 } }, -- 49
		{ label = "11", id = 10011, kind = "Alliance", name = "Everlook", zone = "Winterspring", pos = { 6799.240234, -4742.439941 } }, -- 52
		--{ label = "12", id = 10013, kind = "Alliance", name = "Fishing Village", zone = "Teldrassil", pos = { 8701.509766, 991.3699951 } }, -- 57
		{ label = "12", id = 10012, kind = "Alliance", name = "Nighthaven", zone = "Moonglade", pos = { 7793.609863, -2403.469971 } }, -- 62
		{ label = "13", id = 10013, kind = "Alliance", name = "Talrendis Point", zone = "Azshara", pos = { 2721.98999, -3880.639893 } }, -- 64
		{ label = "14", id = 10014, kind = "Alliance", name = "Talonbranch Glade", zone = "Felwood", pos = { 6205.879883, -1949.630005 } }, -- 65
		{ label = "15", id = 10015, kind = "Alliance", name = "Cenarion Hold", zone = "Silithus", pos = { -6761.830078, 772.0300293 } }, -- 73
		{ label = "16", id = 10016, kind = "Neutral", name = "Marshal's Refuge", zone = "Un'Goro Crater", pos = { -6113.819824, -1142.699951 } }, -- 79
		{ label = "17", id = 10017, kind = "Neutral", name = "Ratchet", zone = "The Barrens", pos = { -894.5900269, -3773.01001 } }, -- 80
		{ label = "18", id = 10018, kind = "Neutral", name = "Summit of Eternity", zone = "Mount Hyjal", pos = { 5283.189941, -3306.699951 } }, -- 559
		{ label = "19", id = 10019, kind = "Neutral", name = "Tainted Foothills", zone = "Mount Hyjal", pos = { 4393.52002, -2836.350098 } }, -- 3242
	},
	footer = {
		{ "" },
		{ LGRE..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
})

local TransHordeWest_Forever_Map, TransHordeWest_Forever_Coords =
private.BuildTransportMap({
	ZoneName = { BZ["Kalimdor"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
	WorldMapID = 12,
	Faction = "Horde",
	DynamicMarkers = true,
	-- UiMap 1464 (taxi map, Kalimdor), from UiMapAssignment. anchor -6, -4 centres the marker on the node.
	transform = { region = { -11870, -13370, 12470, 10970 }, size = 512, anchorX = -6, anchorY = -4, snap = 0.5 },
	nodes = {
		{ label = "A", id = 20001, kind = "Ship", name = "Undercity", zone = "Tirisfal Glades", xy = { 492.76, 125.58 } },
		{ label = "B", id = 20002, kind = "Ship", name = "Grom'gol", zone = "Stranglethorn Vale", xy = { 495.08, 357.58 } },
		{ label = "C", id = 20003, kind = "Ship", name = "Booty Bay", zone = "Stranglethorn Vale", xy = { 493.29, 414.58 } },
		{ "" },
		{ label = "1", id = 10001, kind = "Horde", name = "Thunder Bluff", zone = "Mulgore", pos = { -1197.209961, 29.70999908 } }, -- 22
		{ label = "2", id = 10002, kind = "Horde", name = "Orgrimmar", zone = "Durotar", pos = { 1677.589966, -4315.709961 } }, -- 23
		{ label = "3", id = 10003, kind = "Horde", name = "Crossroads", zone = "The Barrens", pos = { -441.7999878, -2596.080078 } }, -- 25
		{ label = "4", id = 10004, kind = "Horde", name = "Sun Rock Retreat", zone = "Stonetalon Mountains", pos = { 966.5700073, 1040.319946 } }, -- 29
		{ label = "5", id = 10005, kind = "Horde", name = "Freewind Post", zone = "Thousand Needles", pos = { -5407.709961, -2414.300049 } }, -- 30
		{ label = "6", id = 10006, kind = "Horde", name = "Shadowprey Village", zone = "Desolace", pos = { -1767.640015, 3263.889893 } }, -- 38
		{ label = "7", id = 10007, kind = "Horde", name = "Gadgetzan", zone = "Tanaris", pos = { -7048.890137, -3780.360107 } }, -- 40
		{ label = "8", id = 10008, kind = "Horde", name = "Camp Mojache", zone = "Feralas", pos = { -4419.859863, 199.3099976 } }, -- 42
		{ label = "9", id = 10009, kind = "Horde", name = "Valormok", zone = "Azshara", pos = { 3661.52002, -4390.379883 } }, -- 44
		{ label = "10", id = 10010, kind = "Horde", name = "Bloodvenom Post", zone = "Felwood", pos = { 5068.399902, -337.2200012 } }, -- 48
		{ label = "11", id = 10011, kind = "Horde", name = "Everlook", zone = "Winterspring", pos = { 6813.060059, -4611.120117 } }, -- 53
		{ label = "12", id = 10012, kind = "Horde", name = "Brackenwall Village", zone = "Dustwallow Marsh", pos = { -3147.389893, -2842.179932 } }, -- 55
		{ label = "13", id = 10013, kind = "Horde", name = "Zoram'gar Outpost", zone = "Ashenvale", pos = { 3374.709961, 996.9699707 } }, -- 58
		{ label = "14", id = 10014, kind = "Horde", name = "Splintertree Post", zone = "Ashenvale", pos = { 2302.389893, -2524.550049 } }, -- 61
		{ label = "15", id = 10015, kind = "Horde", name = "Nighthaven", zone = "Moonglade", pos = { 7787.720215, -2404.100098 } }, -- 63
		{ label = "16", id = 10016, kind = "Horde", name = "Moonglade", pos = { 7470.390137, -2123.379883 } }, -- 69
		{ label = "17", id = 10017, kind = "Horde", name = "Cenarion Hold", zone = "Silithus", pos = { -6811.390137, 836.7399902 } }, -- 72
		{ label = "18", id = 10018, kind = "Horde", name = "Camp Taurajo", zone = "The Barrens", pos = { -2380.669922, -1882.670044 } }, -- 77
		{ label = "19", id = 10019, kind = "Neutral", name = "Marshal's Refuge", zone = "Un'Goro Crater", pos = { -6113.819824, -1142.699951 } }, -- 79
		{ label = "20", id = 10020, kind = "Neutral", name = "Ratchet", zone = "The Barrens", pos = { -894.5900269, -3773.01001 } }, -- 80
		{ label = "21", id = 10021, kind = "Neutral", name = "Summit of Eternity", zone = "Mount Hyjal", pos = { 5283.189941, -3306.699951 } }, -- 559
		{ label = "22", id = 10022, kind = "Neutral", name = "Tainted Foothills", zone = "Mount Hyjal", pos = { 4393.52002, -2836.350098 } }, -- 3242
	},
	footer = {
		{ "" },
		{ LGRE..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
})

alliance.maps = {
	TransAllianceCosmos_Forever = {
		ZoneName = { BZ["Azeroth"]..ALAN..L_PAREN..FACTION_ALLIANCE..R_PAREN },
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
	TransAllianceWest_Forever = TransAllianceWest_Forever_Map,
}
alliance.coords = {
	TransAllianceCosmos_Forever = {
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
	TransAllianceEast_Forever = TransAllianceEast_Forever_Coords,
	TransAllianceWest_Forever = TransAllianceWest_Forever_Coords,
}




horde.maps = {
	TransHordeCosmos_Forever = {
		ZoneName = { BZ["Azeroth"]..HRDE..L_PAREN..FACTION_HORDE..R_PAREN },
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
	TransHordeWest_Forever = TransHordeWest_Forever_Map,
}
horde.coords = {
	TransHordeCosmos_Forever = {
		{ 1, 10001, 133, 216 },
		{ 2, 10002, 65, 261 },
		{ 3, 10003, 120, 261 },
		{ 4, 10004, 388, 150 },
		{ 5, 10005, 392, 346 },
		{ 6, 10006, 386, 373 },
		{ 7, 10007, 107, 130 },
	},
	TransHordeEast_Forever = TransHordeEast_Forever_Coords,
	TransHordeWest_Forever = TransHordeWest_Forever_Coords,
}

data.maps = {
}

data.coords = {
}



