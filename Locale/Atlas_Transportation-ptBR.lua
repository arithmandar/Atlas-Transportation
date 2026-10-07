-- Atlas_Transportation-ptBR locale file

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Transportation", "ptBR", false);

if L then
	-- Colors for legend description
	L["White"] = "Branco"
	L["Red"] = "Vermelho"
	L["Purple"] = "Roxo"
	L["Green"] = "Verde"
	L["Orange"] = "Laranja"
	L["Blue"] = "Azul"
	L["Yellow"] = "Amarelo"
	-- Class specific nodes
	L["Druid Only"] = "Apenas Druidas"			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] = "Apenas Cavaleiros da Morte"		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	-- L["Hunter Only"] = "Hunter Only"
	-- L["Class Specific Only"] = "Class Specific Only"
	-- L["Warrior's landing / jumping point (from or back to Skyhold)"] = "Warrior's landing / jumping point (from or back to Skyhold)"
	-- Dalaran
	-- L["Class Order Halls"] = "Class Order Halls"
	-- L["Portal to the Maelstrom"] = "Portal to the Maelstrom" -- Shaman
	-- L["Portal to Netherlight Temple"] = "Portal to Netherlight Temple" -- Priest
	-- L["Portal to Dreadscar Rift"] = "Portal to Dreadscar Rift" -- Warlock
	-- L["Jump to Skyhold"] = "Jump to Skyhold" -- Warrior
	-- L["Illidari Gateway"] = "Illidari Gateway" -- Demon Hunter
	L["Talua <Eagle Keeper>"] = "Talua <Tratadora de Águias>" -- 108868, NPC of Hunter as flight master in Dalaran's Krasus' Landing
	-- L["Flight to Trueshot Lodge"] = "Flight to Trueshot Lodge" -- Hunter
	-- L["Portal to Sanctum of Light"] = "Portal to Sanctum of Light" -- Paladin
	-- L["Connection to the Hall of Shadows"] = "Connection to the Hall of Shadows" -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "Aludane Albanuvem <Mestre de Voo>" -- 96813
	-- Achievement Type
	-- L["Exploration"] = "Exploration"
	-- Others
	-- L["Portal to Dalaran"] = "Portal to Dalaran"
	L["The Bogpaddle Bullet"] = "O Balaço do Brejo"
	L["Legend"] = "Lenda"				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "Grifo"
	L["Only available after winning the PvP battle"] = "Apenas disponível após vencer uma batalha PvP"
	L["Orb of Translocation"] = "Orb de translocação"	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "Portais"
	L["Portal / Waygate Path to the destination"] = "Portal / Waygate para o destino"
	L["Ship / Zeppelin sailing path to destination"] = "Caminho do Navio / Zeppelin para o destino"
	-- L["Two ways portal"] = "Two ways portal"
	L["Requires honored faction with Sha'tari Skyguard"] = "Requer honrado com a facção Guarda Aérea Sha'tari"
	L["Seahorse"] = "Cavalo-Marinho"
	L["South of the path along Lake Elune'ara"] = "Caminho sul ao longo do lago Elune'ara"
	L["Special transportation"] = "Transporte especial"
	L["Taxi Nodes"] = "Nódulos de táxi"
	L["Transportation Maps"] = "Mapas de transporte"
	L["Transporter"] = "Transportador"			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "Transportadores pelo mar sobre a falésia" -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "Oeste do caminho para Domínio dos Presamatos"
	L["Wind Rider"] = "Mantícoras"
	L["Won't be available once the Battle for Andorhal chain is finished."] = "Não estará disponível uma vez que a sequência da Batalha de Andorhal terminar." -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "Torres de Zeppelin"
	L["Climbing Rope"] = "Corda de escalar"
	L["Rappelling Rope"] = "Corda de rapel"
	L["Abandoned Kite"] = "Pipa abandonada"
	L["From sea level to ground level"] = "Do nível do mar para nível do solo"
	L["Whispercloud's Balloon"] = "Balão Nuvem Sussurrante"
	L["Shado-Pan Rope"] = "Corda Shado-Pan" -- 66390
	L["Require to complete \"Meet the Scout\" quest line first."] = "Exigido para completar a sequência de quest \"Conheça a batedora\"."
	L["Warning: Drop"] = "Atenção: Soltando" -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = "Nutral"
	L["Airship"] = "Dirigível"
	-- L["Wind Rider Master"] = "Wind Rider Master"
	-- L["Gryphon Master"] = "Gryphon Master"
	-- L["Great Eagle"] = "Great Eagle" -- NPC: 109558
	-- L["Requires Eagle Ally Advancement"] = "Requires Eagle Ally Advancement"
	-- L["Teleportation Nexus"] = "Teleportation Nexus"
	-- L["Requires Teleportation Nexus Advancement"] = "Requires Teleportation Nexus Advancement"
	-- L["Gleep Chatterswitch"] = "Gleep Chatterswitch" -- NPC: 71336
	-- L["Vindicaar"] = "Vindicaar"
	-- L["Teleport Beacon"] = "Teleport Beacon"
	-- L["Boat to Stormwind City"] = "Boat to Stormwind City"
	-- L["Boat to Echo Isles, Durotar"] = "Boat to Echo Isles, Durotar"
	-- L["Honored with Sha'tari Skyguard"] = "Honored with Sha'tari Skyguard"
	-- L["Zeppelin to Orgrimmar"] = "Zeppelin to Orgrimmar"
	-- Options
	-- L["Return to Zuldazar"] = "Return to Zuldazar"
	-- L["Show %s's transportation maps"] = "Show %s's transportation maps"
	-- L["Change will take effect after next login; or type '/reload' command to reload addon"] = "Change will take effect after next login; or type '/reload' command to reload addon"
end
