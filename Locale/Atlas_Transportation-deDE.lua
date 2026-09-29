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

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Transportation", "deDE", false);

if L then
	-- Colors for legend description
	L["White"] = "Weiß"
	L["Red"] = "Rot"
	L["Purple"] = "Violett"
	L["Green"] = "Grün"
	L["Orange"] = "Orange"
	L["Blue"] = "Blau"
	L["Yellow"] = "Gelb"
	-- Class specific nodes
	L["Druid Only"] = "Nur für Druiden"			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] = "Nur für Todesritter"		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Hunter Only"] = "Nur für Jäger"
	L["Class Specific Only"] = "Nur klassenspezifische"
	L["Warrior's landing / jumping point (from or back to Skyhold)"] = "Lande-/Sprungpunkt der Krieger (zur Himmelsfeste oder zurück)"
	-- Dalaran
	L["Class Order Halls"] = "Klassenordenshallen"
	L["Portal to the Maelstrom"] = "Portal zum Mahlstrom" -- Shaman
	L["Portal to Netherlight Temple"] = "Portal zum Netherlichttempel" -- Priest
	L["Portal to Dreadscar Rift"] = "Portal zur Schreckensnarbe" -- Warlock
	L["Jump to Skyhold"] = "Zur Himmelsfeste springen" -- Warrior
	L["Illidari Gateway"] = "Illidaritor" -- Demon Hunter
	L["Talua <Eagle Keeper>"] = "Talua <Adlerhüterin>" -- 108868, NPC of Hunter as flight master in Dalaran's Krasus' Landing
	L["Flight to Trueshot Lodge"] = "Flug zur Volltrefferhütte" -- Hunter
	L["Portal to Sanctum of Light"] = "Portal zum Sanktum des Lichts" -- Paladin
	L["Connection to the Hall of Shadows"] = "Verbindung zur Halle der Schatten" -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "Aludane Wolkenweiß <Flugmeister>" -- 96813
	-- Achievement Type
	L["Exploration"] = "Erkundung"
	-- Others
	L["Portal to Dalaran"] = "Portal nach Dalaran"
	L["The Bogpaddle Bullet"] = "Der Kraulsumpfexpress"
	L["Legend"] = "Legende"				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "Greif"
	L["Only available after winning the PvP battle"] = "Nur nach Sieg in der PvP-Schlacht verfügbar"
	L["Orb of Translocation"] = "Translokationskugel"	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "Portale"
	L["Portal / Waygate Path to the destination"] = "Portal / Torpfad zum Ziel"
	L["Ship / Zeppelin sailing path to destination"] = "Schiffs- / Zeppelinpfad zum Ziel"
	L["Two ways portal"] = "Zweiwegeportal"
	L["Requires honored faction with Sha'tari Skyguard"] = "Benötigt wohlwollenden Ruf bei Himmelswache der Sha'tari"
	L["Seahorse"] = "Seepferdchen"
	L["South of the path along Lake Elune'ara"] = "Südlich des Elune'ara Seewegs"
	L["Special transportation"] = "Spezielle Beförderungsroute"
	L["Taxi Nodes"] = "Flugpunkte"
	L["Transportation Maps"] = "Beförderungsrouten"
	L["Transporter"] = "Transporter"			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "Transporter übers Meer und am Kliff" -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "Westlich des Weges zur Holzschlundfeste"
	L["Wind Rider"] = "Windreiter"
	L["Won't be available once the Battle for Andorhal chain is finished."] = "Nicht mehr verfügbar, wenn die Schlacht um Andorhal abgeschlossen ist." -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "Zeppelintürme"
	L["Climbing Rope"] = "Kletterseil"
	L["Rappelling Rope"] = "Abseilstrick"
	L["Abandoned Kite"] = "Herrenloser Drachen"
	L["From sea level to ground level"] = "Von Meereshöhe auf Grundhöhe"
	L["Whispercloud's Balloon"] = "Flüsterwolkes Ballon"
	L["Shado-Pan Rope"] = "Seil der Shado-Pan" -- 66390
	L["Require to complete \"Meet the Scout\" quest line first."] = "Erfordert den Abschluss der Questreihe 'Treffen mit der Späherin'."
	L["Warning: Drop"] = "Achtung: Du wirst fallen" -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = " Neutral"
	L["Airship"] = "Luftschiff"
	L["Wind Rider Master"] = "Windreitermeister"
	L["Gryphon Master"] = "Greifenmeister"
	L["Great Eagle"] = "Großer Adler" -- NPC: 109558
	L["Requires Eagle Ally Advancement"] = "Erfordert den Ordensaufstieg Adlerverbündeter"
	L["Teleportation Nexus"] = "Teleportationsnexus"
	L["Requires Teleportation Nexus Advancement"] = "Erfordert den Ordensaufstieg Teleportationsnexus"
	L["Gleep Chatterswitch"] = "Gliep Klatschknips" -- NPC: 71336
	L["Vindicaar"] = "Vindicaar"
	L["Teleport Beacon"] = "Teleport Beacon"
	L["Boat to Stormwind City"] = "Schiff nach Sturmwind Stadt"
	L["Boat to Echo Isles, Durotar"] = "Schiff nach Echo Inseln, Durotar"
	L["Honored with Sha'tari Skyguard"] = "Wohlwollend mit Himmelswache der Sha'tari"
	-- L["Zeppelin to Orgrimmar"] = "Zeppelin to Orgrimmar"
	-- Options
	L["Return to Zuldazar"] = "Kehre nach Zuldazar zurück"
	L["Show %s's transportation maps"] = "Zeigt die Transportkarten von %s an"
	L["Change will take effect after next login; or type '/reload' command to reload addon"] = "Die Änderung wird nach der nächsten Anmeldung wirksam; oder gib den Befehl '/reload' ein, um das Addon neu zu laden"
end
