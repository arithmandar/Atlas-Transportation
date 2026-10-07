-----------------------------------------------------------------------
-- Data for Classic Era
-----------------------------------------------------------------------
local _G = getfenv(0)
local _, private = ...
local LibStub = _G.LibStub
local Atlas = LibStub("AceAddon-3.0"):GetAddon("Atlas")

local Client = Atlas.Client

if not Client.isClassicEra then
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

local constants = private.constants
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


alliance.maps = {
	TransAllianceCosmos_Classic = {
		ZoneName = { WORLD..ALAN..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		{ BLUE..BZ["Kalimdor"] },
		{ WHIT.." 1) "..BZ["Darnassus"]..ALC["Comma"].._RED..BZ["Teldrassil"], 10001 },
		{ WHIT.." 2) "..BZ["Rut'theran Village"]..ALC["Comma"].._RED..BZ["Teldrassil"], 10002 },
		{ WHIT.." 3) "..BZ["Auberdine"]..ALC["Comma"].._RED..BZ["Darkshore"], 10003 },
		{ WHIT.." 4) "..BZ["Nighthaven"]..ALC["Comma"].._RED..BZ["Moonglade"], 10004 },
		{ NUTL.." 5) "..BZ["Ratchet"]..ALC["Comma"].._RED..BZ["The Barrens"], 10005 },
		{ WHIT.." 6) "..BZ["Theramore"]..ALC["Comma"].._RED..BZ["Dustwallow Marsh"], 10006 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ WHIT.." 7) "..BZ["Menethil Harbor"]..ALC["Comma"].._RED..BZ["Wetlands"], 10007 },
		{ WHIT.." 8) "..BZ["Ironforge"]..ALC["Comma"].._RED..BZ["Dun Morogh"], 10008 },
		{ WHIT.." 9) "..BZ["Stormwind"]..ALC["Comma"].._RED..BZ["Elwynn Forest"], 10009 },
		{ NUTL.."10) "..BZ["Booty Bay"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"], 10010 },
	},
	TransAllianceEast_Classic = {
		ZoneName = { BZ["Eastern Kingdoms"]..ALAN..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		WorldMapID = 13,
		Faction = "Alliance",
		{ BLUE.." A) "..BZ["Auberdine"]..ALC["Comma"].._RED..BZ["Darkshore"] };
		{ BLUE.." B) "..BZ["Ratchet"]..ALC["Comma"].._RED..BZ["The Barrens"] };
		{ BLUE.." C) "..BZ["Theramore Isle"]..ALC["Comma"].._RED..BZ["Dustwallow Marsh"] };
		{ };
		{ WHIT.." 1) "..BZ["Light's Hope Chapel"]..ALC["Comma"].._RED..BZ["Eastern Plaguelands"] },
		{ WHIT.." 2) "..BZ["Chillwind Point"]..ALC["Comma"].._RED..BZ["Western Plaguelands"] },
		{ WHIT.." 3) "..BZ["Aerie Peak"]..ALC["Comma"].._RED..BZ["The Hinterlands"] },
		{ WHIT.." 4) "..BZ["Southshore"]..ALC["Comma"].._RED..BZ["Hillsbrad Foothills"] },
		{ WHIT.." 5) "..BZ["Refuge Pointe"]..ALC["Comma"].._RED..BZ["Arathi Highlands"] },
		{ WHIT.." 6) "..BZ["Menethil Harbor"]..ALC["Comma"].._RED..BZ["Wetlands"] },
		{ WHIT.." 7) "..BZ["Ironforge"]..ALC["Comma"].._RED..BZ["Dun Morogh"] },
		{ WHIT.." 8) "..BZ["Thelsamar"]..ALC["Comma"].._RED..BZ["Loch Modan"] },
		{ WHIT.." 9) "..BZ["Thorium Point"]..ALC["Comma"].._RED..BZ["Searing Gorge"] },
		{ WHIT.."10) "..BZ["Morgan's Vigil"]..ALC["Comma"].._RED..BZ["Burning Steppes"] },
		{ WHIT.."11) "..BZ["Stormwind"]..ALC["Comma"].._RED..BZ["Elwynn Forest"] },
		{ WHIT.."12) "..BZ["Lakeshire"]..ALC["Comma"].._RED..BZ["Redridge Mountains"] },
		{ WHIT.."13) "..BZ["Sentinel Hill"]..ALC["Comma"].._RED..BZ["Westfall"] },
		{ WHIT.."14) "..BZ["Darkshire"]..ALC["Comma"].._RED..BZ["Duskwood"] },
		{ WHIT.."15) "..BZ["Nethergarde Keep"]..ALC["Comma"].._RED..BZ["Blasted Lands"] },
		{ WHIT.."16) "..BZ["Booty Bay"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"] },
		{ "" },
		{ _RED..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
	TransAllianceWest_Classic = {
		ZoneName = { BZ["Kalimdor"]..ALAN..ALC["L-Parenthesis"]..FACTION_ALLIANCE..ALC["R-Parenthesis"] },
		WorldMapID = 12,
		Faction = "Alliance",
		{ BLUE.." A) "..BZ["Menethil Harbor"]..", ".._RED..BZ["Wetlands"] };
		{ BLUE.." B) "..BZ["Stormwind City"]..", ".._RED..BZ["Elwynn Forest"] };
		{ BLUE.." C) "..BZ["Booty Bay"]..", ".._RED..BZ["Stranglethorn Vale"] };
		{ };
		{ WHIT.." 1) "..BZ["Rut'theran Village"]..ALC["Comma"].._RED..BZ["Teldrassil"] },
		{ WHIT.." 2) "..BZ["Nighthaven"]..ALC["Comma"].._RED..BZ["Moonglade"] },
		{ WHIT.." 3) "..BZ["Everlook"]..ALC["Comma"].._RED..BZ["Winterspring"] },
		{ WHIT.." 4) "..BZ["Auberdine"]..ALC["Comma"].._RED..BZ["Darkshore"] },
		{ WHIT.." 5) "..BZ["Talonbranch Glade"]..ALC["Comma"].._RED..BZ["Felwood"] },
		{ WHIT.." 6) "..BZ["Stonetalon Peak"]..ALC["Comma"].._RED..BZ["Stonetalon Mountains"] },
		{ WHIT.." 7) "..BZ["Astranaar"]..ALC["Comma"].._RED..BZ["Ashenvale"] },
		{ WHIT.." 8) "..BZ["Forest Song"]..ALC["Comma"].._RED..BZ["Ashenvale"] },
		{ WHIT.." 9) "..BZ["Talrendis Point"]..ALC["Comma"].._RED..BZ["Azshara"] },
		{ WHIT.."10) "..BZ["Nijel's Point"]..ALC["Comma"].._RED..BZ["Desolace"] },
		{ NUTL.."11) "..BZ["Ratchet"]..ALC["Comma"].._RED..BZ["The Barrens"] },
		{ WHIT.."12) "..BZ["Theramore"]..ALC["Comma"].._RED..BZ["Dustwallow Marsh"] },
		{ WHIT.."13) "..BZ["Feathermoon"]..ALC["Comma"].._RED..BZ["Feralas"] },
		{ WHIT.."14) "..BZ["Thalanaar"]..ALC["Comma"].._RED..BZ["Feralas"] },
		{ NUTL.."15) "..BZ["Marshal's Refuge"]..ALC["Comma"].._RED..BZ["Un'Goro Crater"] },
		{ WHIT.."16) "..BZ["Cenarion Hold"]..ALC["Comma"].._RED..BZ["Silithus"] },
		{ WHIT.."17) "..BZ["Gadgetzan"]..ALC["Comma"].._RED..BZ["Tanaris"] },
		{ "" },
		{ _RED..L["Legend"] },
		{ NUTL..L["Yellow"]..ALC["Colon"]..L["Taxi Nodes"]..ALC["Hyphen"]..L["Nutral"] },
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
}

horde.maps = {
	TransHordeCosmos_Classic = {
		ZoneName = { WORLD..HRDE..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		{ BLUE..BZ["Kalimdor"] },
		{ WHIT.." 1) "..BZ["Orgrimmar"]..ALC["Comma"].._RED..BZ["Durotar"], 10001 },
		{ WHIT.." 2) "..BZ["Thunder Bluff"]..ALC["Comma"].._RED..BZ["Mulgore"], 10002 },
		{ NUTL.." 3) "..BZ["Ratchet"]..ALC["Comma"].._RED..BZ["The Barrens"], 10003 },
		{ WHIT.." 7) "..BZ["Shrine of Remulos"]..ALC["Comma"].._RED..BZ["Moonglade"], 10007 },
		{ "" },
		{ BLUE..BZ["Eastern Kingdoms"] },
		{ WHIT.." 4) "..BZ["Undercity"]..ALC["Comma"].._RED..BZ["Tirisfal Glades"], 10004 },
		{ WHIT.." 5) "..BZ["Grom'gol"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"], 10005 },
		{ NUTL.." 6) "..BZ["Booty Bay"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"], 10006 },
	},
	TransHordeEast_Classic = {
		ZoneName = { BZ["Eastern Kingdoms"]..HRDE..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		WorldMapID = 13,
		Faction = "Horde",
		{ BLUE.." A) "..BZ["Orgrimmar"]..ALC["Comma"].._RED..BZ["Durotar"] },
		{ BLUE.." B) "..BZ["Ratchet"]..ALC["Comma"].._RED..BZ["The Barrens"] },
		{ };
		{ WHIT.." 1) "..BZ["Light's Hope Chapel"]..ALC["Comma"].._RED..BZ["Eastern Plaguelands"] },
		{ WHIT.." 2) "..BZ["Undercity"]..ALC["Comma"].._RED..BZ["Tirisfal Glades"] },
		{ WHIT.." 3) "..BZ["The Sepulcher"]..ALC["Comma"].._RED..BZ["Silverpine Forest"] },
		{ WHIT.." 4) "..BZ["Tarren Mill"]..ALC["Comma"].._RED..BZ["Hillsbrad Foothills"] },
		{ WHIT.." 5) "..BZ["Revantusk Village"]..ALC["Comma"].._RED..BZ["The Hinterlands"] },
		{ WHIT.." 6) "..BZ["Hammerfall"]..ALC["Comma"].._RED..BZ["Arathi Highlands"] },
		{ WHIT.." 7) "..BZ["Thorium Point"]..ALC["Comma"].._RED..BZ["Searing Gorge"] },
		{ WHIT.." 8) "..BZ["Kargath"]..ALC["Comma"].._RED..BZ["Badlands"] },
		{ WHIT.." 9) "..BZ["Flame Crest"]..ALC["Comma"].._RED..BZ["Burning Steppes"] },
		{ WHIT.."10) "..BZ["Stonard"]..ALC["Comma"].._RED..BZ["Swamp of Sorrows"] },
		{ WHIT.."11) "..BZ["Grom'gol"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"] },
		{ WHIT.."12) "..BZ["Booty Bay"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"] },
		{ "" },
		{ _RED..L["Legend"] },
		{ BLUE.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
		{ NUTL.."-- : "..L["Ship / Zeppelin sailing path to destination"] },
	},
	TransHordeWest_Classic = {
		ZoneName = { BZ["Kalimdor"]..HRDE..ALC["L-Parenthesis"]..FACTION_HORDE..ALC["R-Parenthesis"] },
		WorldMapID = 12,
		Faction = "Horde",
		{ BLUE.." A) "..BZ["Undercity"]..ALC["Comma"].._RED..BZ["Tirisfal Glades"] },
		{ BLUE.." B) "..BZ["Grom'gol"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"] },
		{ BLUE.." C) "..BZ["Booty Bay"]..ALC["Comma"].._RED..BZ["Stranglethorn Vale"] },
		{ };
		{ WHIT.." 1) "..BZ["Shrine of Remulos"]..ALC["Comma"].._RED..BZ["Moonglade"] },
		{ WHIT.." 2) "..BZ["Everlook"]..ALC["Comma"].._RED..BZ["Winterspring"] },
		{ WHIT.." 3) "..BZ["Bloodvenom Post"]..ALC["Comma"].._RED..BZ["Felwood"] },
		{ WHIT.." 4) "..BZ["Zoram'gar Outpost"]..ALC["Comma"].._RED..BZ["Ashenvale"] },
		{ WHIT.." 5) "..BZ["Valormok"]..ALC["Comma"].._RED..BZ["Azshara"] },
		{ WHIT.." 6) "..BZ["Splintertree Post"]..ALC["Comma"].._RED..BZ["Ashenvale"] },
		{ WHIT.." 7) "..BZ["Orgrimmar"]..ALC["Comma"].._RED..BZ["Durotar"] },
		{ WHIT.." 8) "..BZ["Sun Rock Retreat"]..ALC["Comma"].._RED..BZ["Stonetalon Mountains"] },
		{ WHIT.." 9) "..BZ["Crossroads"]..ALC["Comma"].._RED..BZ["The Barrens"] },
		{ NUTL.."10) "..BZ["Ratchet"]..ALC["Comma"].._RED..BZ["The Barrens"] },
		{ WHIT.."11) "..BZ["Shadowprey Village"]..ALC["Comma"].._RED..BZ["Desolace"] },
		{ WHIT.."12) "..BZ["Thunder Bluff"]..ALC["Comma"].._RED..BZ["Mulgore"] },
		{ WHIT.."13) "..BZ["Camp Taurajo"]..ALC["Comma"].._RED..BZ["The Barrens"] },
		{ WHIT.."14) "..BZ["Brackenwall Village"]..ALC["Comma"].._RED..BZ["Dustwallow Marsh"] },
		{ WHIT.."15) "..BZ["Camp Mojache"]..ALC["Comma"].._RED..BZ["Feralas"] },
		{ WHIT.."16) "..BZ["Freewind Post"]..ALC["Comma"].._RED..BZ["Thousand Needles"] },
		{ NUTL.."17) "..BZ["Marshal's Refuge"]..ALC["Comma"].._RED..BZ["Un'Goro Crater"] },
		{ WHIT.."18) "..BZ["Cenarion Hold"]..ALC["Comma"].._RED..BZ["Silithus"] },
		{ WHIT.."19) "..BZ["Gadgetzan"]..ALC["Comma"].._RED..BZ["Tanaris"] },
		{ "" },
		{ _RED..L["Legend"] },
		{ NUTL..L["Yellow"]..ALC["Colon"]..L["Taxi Nodes"]..ALC["Hyphen"]..L["Nutral"] },
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
}

data.maps = {
}

data.coords = {
}



