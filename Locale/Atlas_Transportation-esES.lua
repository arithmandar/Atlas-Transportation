-- $Id$
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2023 - Arith Hsu, Atlas Team <atlas.addon at gmail.com>

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
--@do-not-package@
	L["The Bogpaddle Bullet"] = "La bala de Chapaleos";
	L["Death Knight Only"] = "Solo caballeros de la muerte";		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Druid-only"] = "Solo druidas";			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Legend"] = "Leyenda";				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "Grifo";
	L["Only available after winning the PvP battle"] = "Disponible únicamente despues de haber ganado la batalla JcJ";
	L["Orb of Translocation"] = "Orbe de traslado";	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "Portales";				
	L["Portal / Waygate Path to the destination"] = "Portal / Puerta con destino";
	L["Ship / Zeppelin sailing path to destination"] = "Barco / Velero Zepelín con destino";
	L["Requires honored faction with Sha'tari Skyguard"] = "Requiere honorable con la facción Guardia del cielo Sha'tari";
	L["Seahorse"] = "Cabllito de mar";				
	L["South of the path along Lake Elune'ara"] = "Sur del camino a Lago Elune'ara";
	L["Special transportation"] = "Transporte especial";
	L["Taxi Nodes"] = "Paradas de Taxi";			
	L["Transportation Maps"] = "Mapas de Transportes";
	L["Transporter"] = "Transportador";			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "Transportes por mar y por acantilados"; -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "Oeste del camino al Puesto Vigóa del Cubil";
	L["Wind Rider"] = "Jinete del viento";
	--L["Won't be available once Thassarian departed"] = "No estará disponible una vez se marche Thassarian"; -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "Aeropuertos Zepelín";		
	L["Climbing Rope"] = "Cuerda de escalar";
	L["Rappelling Rope"] = "Soga de rápel";
	L["Abandoned Kite"] = "Cometa abandonada";
	L["From sea level to ground level"] = "Del nivel del mar al nivel de tierra";
	L["Whispercloud's Balloon"] = "Globo de la Nube Susurrante";
	L["Shado-Pan Rope"] = "Cuerda del Shadopan"; -- 66390
--@end-do-not-package@
--@localization(locale="esES", format="lua_additive_table")@
end
