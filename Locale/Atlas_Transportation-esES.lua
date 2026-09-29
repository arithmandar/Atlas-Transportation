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

--[[

-- Datos de Atlas (Español)
-- Traducido por --> maqjav|Marosth de Tyrande<--
-- maqjav@hotmail.com
-- Úlltima Actualización (last update): 28/10/2012

--]]
local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Transportation", "esES", false);

if L then
	-- Colors for legend description
	L["White"] = "Blanco"
	L["Red"] = "Rojo"
	L["Purple"] = "Morado"
	L["Green"] = "Verde"
	L["Orange"] = "Naranja"
	L["Blue"] = "Azul"
	L["Yellow"] = "Amarillo"
	-- Class specific nodes
	L["Druid Only"] = "Solo druidas"			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] = "Solo caballeros de la muerte"		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Hunter Only"] = "Solo cazadores"
	-- L["Class Specific Only"] = "Class Specific Only"
	-- L["Warrior's landing / jumping point (from or back to Skyhold)"] = "Warrior's landing / jumping point (from or back to Skyhold)"
	-- Dalaran
	-- L["Class Order Halls"] = "Class Order Halls"
	-- L["Portal to the Maelstrom"] = "Portal to the Maelstrom" -- Shaman
	-- L["Portal to Netherlight Temple"] = "Portal to Netherlight Temple" -- Priest
	-- L["Portal to Dreadscar Rift"] = "Portal to Dreadscar Rift" -- Warlock
	-- L["Jump to Skyhold"] = "Jump to Skyhold" -- Warrior
	-- L["Illidari Gateway"] = "Illidari Gateway" -- Demon Hunter
	L["Talua <Eagle Keeper>"] = "Talua <Guardiana de águilas>" -- 108868, NPC of Hunter as flight master in Dalaran's Krasus' Landing
	-- L["Flight to Trueshot Lodge"] = "Flight to Trueshot Lodge" -- Hunter
	-- L["Portal to Sanctum of Light"] = "Portal to Sanctum of Light" -- Paladin
	-- L["Connection to the Hall of Shadows"] = "Connection to the Hall of Shadows" -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "Aludane Nubeblanca <Maestro de vuelo>" -- 96813
	-- Achievement Type
	L["Exploration"] = "Exploración"
	-- Others
	L["Portal to Dalaran"] = "Portal a Dalaran"
	L["The Bogpaddle Bullet"] = "La bala de Chapaleos"
	L["Legend"] = "Leyenda"				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "Grifo"
	L["Only available after winning the PvP battle"] = "Disponible únicamente despues de haber ganado la batalla JcJ"
	L["Orb of Translocation"] = "Orbe de traslado"	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "Portales"
	L["Portal / Waygate Path to the destination"] = "Portal / Puerta con destino"
	L["Ship / Zeppelin sailing path to destination"] = "Barco / Velero Zepelín con destino"
	-- L["Two ways portal"] = "Two ways portal"
	L["Requires honored faction with Sha'tari Skyguard"] = "Requiere honorable con la facción Guardia del cielo Sha'tari"
	L["Seahorse"] = "Cabllito de mar"
	L["South of the path along Lake Elune'ara"] = "Sur del camino a Lago Elune'ara"
	L["Special transportation"] = "Transporte especial"
	L["Taxi Nodes"] = "Paradas de Taxi"
	L["Transportation Maps"] = "Mapas de Transportes"
	L["Transporter"] = "Transportador"			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "Transportes por mar y por acantilados" -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "Oeste del camino al Puesto Vigóa del Cubil"
	L["Wind Rider"] = "Jinete del viento"
	-- L["Won't be available once the Battle for Andorhal chain is finished."] = "Won't be available once the Battle for Andorhal chain is finished." -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "Aeropuertos Zepelín"
	L["Climbing Rope"] = "Cuerda de escalar"
	L["Rappelling Rope"] = "Soga de rápel"
	L["Abandoned Kite"] = "Cometa abandonada"
	L["From sea level to ground level"] = "Del nivel del mar al nivel de tierra"
	L["Whispercloud's Balloon"] = "Globo de la Nube Susurrante"
	L["Shado-Pan Rope"] = "Cuerda del Shadopan" -- 66390
	-- L["Require to complete \"Meet the Scout\" quest line first."] = "Require to complete \"Meet the Scout\" quest line first."
	-- L["Warning: Drop"] = "Warning: Drop" -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = "Neutral"
	L["Airship"] = "Dirigible"
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
