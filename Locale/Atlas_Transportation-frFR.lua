-- Atlas_Transportation-frFR locale file

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Transportation", "frFR", false);

if L then
	-- Colors for legend description
	-- L["White"] = "White"
	L["Red"] = "Rouge"
	L["Purple"] = "Violet"
	L["Green"] = "Vert"
	L["Orange"] = "Orange"
	L["Blue"] = "Bleu"
	-- L["Yellow"] = "Yellow"
	-- Class specific nodes
	L["Druid Only"] = "Druide seulement"			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] = "Chevalier de la mort seulement"		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Hunter Only"] = "Chasseur uniquement"
	-- L["Class Specific Only"] = "Class Specific Only"
	-- L["Warrior's landing / jumping point (from or back to Skyhold)"] = "Warrior's landing / jumping point (from or back to Skyhold)"
	-- Dalaran
	-- L["Class Order Halls"] = "Class Order Halls"
	-- L["Portal to the Maelstrom"] = "Portal to the Maelstrom" -- Shaman
	-- L["Portal to Netherlight Temple"] = "Portal to Netherlight Temple" -- Priest
	-- L["Portal to Dreadscar Rift"] = "Portal to Dreadscar Rift" -- Warlock
	-- L["Jump to Skyhold"] = "Jump to Skyhold" -- Warrior
	-- L["Illidari Gateway"] = "Illidari Gateway" -- Demon Hunter
	L["Talua <Eagle Keeper>"] = "Talua <Responsable des aigles>" -- 108868, NPC of Hunter as flight master in Dalaran's Krasus' Landing
	-- L["Flight to Trueshot Lodge"] = "Flight to Trueshot Lodge" -- Hunter
	-- L["Portal to Sanctum of Light"] = "Portal to Sanctum of Light" -- Paladin
	-- L["Connection to the Hall of Shadows"] = "Connection to the Hall of Shadows" -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "Aludane Nuageblanc <Maître de vol>" -- 96813
	-- Achievement Type
	L["Exploration"] = "Exploration"
	-- Others
	L["Portal to Dalaran"] = "Portail vers Dalaran"
	L["The Bogpaddle Bullet"] = "La balle de Brasse-Tourbe"
	L["Legend"] = "Légende"				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "Griffon"
	L["Only available after winning the PvP battle"] = "Disponible uniquement après avoir remporté une bataille JcJ"
	L["Orb of Translocation"] = "Orbe de transposition"	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "Portails"
	L["Portal / Waygate Path to the destination"] = "Destination de Portail / Porte de transport"
	L["Ship / Zeppelin sailing path to destination"] = "Chemin de navigation de Vaisseau / Zeppelin"
	-- L["Two ways portal"] = "Two ways portal"
	L["Requires honored faction with Sha'tari Skyguard"] = "Honoré avec la Garde-ciel sha'tari"
	L["Seahorse"] = "Hippocampe"
	L["South of the path along Lake Elune'ara"] = "Sud du chemin du lac d'Elune'ara"
	L["Special transportation"] = "Transport spécial"
	L["Taxi Nodes"] = "Nœuds de transports"
	L["Transportation Maps"] = "Cartes des Transports"
	L["Transporter"] = "Transporteur"			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "Transporteurs par la mer et sur la falaise" -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "Ouest du chemin du Repaire des Grumegueules"
	L["Wind Rider"] = "Coursier du vent"
	L["Won't be available once the Battle for Andorhal chain is finished."] = "N'est plus disponible une fois la série de quêtes de la Bataille pour Andorhal terminée." -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "Tours de Zeppelin"
	L["Climbing Rope"] = "Corde d’escalade"
	L["Rappelling Rope"] = "Corde de rappel"
	L["Abandoned Kite"] = "Cerf-volant abandonné"
	L["From sea level to ground level"] = "De la mer vers la terre ferme"
	L["Whispercloud's Balloon"] = "Montgolfière de Murmure de Nuage"
	L["Shado-Pan Rope"] = "Corde pandashan" -- 66390
	-- L["Require to complete \"Meet the Scout\" quest line first."] = "Require to complete \"Meet the Scout\" quest line first."
	-- L["Warning: Drop"] = "Warning: Drop" -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = "Neutre"
	L["Airship"] = "Dirigeable"
	-- L["Wind Rider Master"] = "Wind Rider Master"
	-- L["Gryphon Master"] = "Gryphon Master"
	-- L["Great Eagle"] = "Great Eagle" -- NPC: 109558
	-- L["Requires Eagle Ally Advancement"] = "Requires Eagle Ally Advancement"
	-- L["Teleportation Nexus"] = "Teleportation Nexus"
	-- L["Requires Teleportation Nexus Advancement"] = "Requires Teleportation Nexus Advancement"
	-- L["Gleep Chatterswitch"] = "Gleep Chatterswitch" -- NPC: 71336
	-- L["Vindicaar"] = "Vindicaar"
	-- L["Teleport Beacon"] = "Teleport Beacon"
	L["Boat to Stormwind City"] = "Bateau vers Hurlevent"
	-- L["Boat to Echo Isles, Durotar"] = "Boat to Echo Isles, Durotar"
	-- L["Honored with Sha'tari Skyguard"] = "Honored with Sha'tari Skyguard"
	-- L["Zeppelin to Orgrimmar"] = "Zeppelin to Orgrimmar"
	-- Options
	-- L["Return to Zuldazar"] = "Return to Zuldazar"
	-- L["Show %s's transportation maps"] = "Show %s's transportation maps"
	-- L["Change will take effect after next login; or type '/reload' command to reload addon"] = "Change will take effect after next login; or type '/reload' command to reload addon"
end
