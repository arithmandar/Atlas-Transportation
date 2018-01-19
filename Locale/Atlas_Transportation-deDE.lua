-- $Id$
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2018 - Arith Hsu, Atlas Team <atlas.addon at gmail.com>

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
--@do-not-package@
	L["The Bogpaddle Bullet"] = "Der Kraulsumpfexpress";
	L["Death Knight Only"] = "Nur Todesritter";
	L["Druid-only"] = "Nur Druiden";
	L["Legend"] = "Legende";
	L["Gryphon"] = "Greif";
	L["Only available after winning the PvP battle"] = "Nur nach Sieg in der PvP Schlacht verfügbar";
	L["Orb of Translocation"] = "Translokationskugel";
	L["Portals"] = "Portale";
	L["Portal / Waygate Path to the destination"] = "Portal / Torpfad zum Ziel";
	L["Ship / Zeppelin sailing path to destination"] = "Schiff / Zeppelinpfad zum Ziel";
	L["Requires honored faction with Sha'tari Skyguard"] = "Benötigt wohlwollenden Ruf bei Himmelswache der Sha'tari";
	L["Seahorse"] = "Seepferdchen";
	L["South of the path along Lake Elune'ara"] = "Südlich des Elune'ara Seewegs";
	L["Special transportation"] = "Spezielle Beförderungsroute";
	L["Taxi Nodes"] = "Flugpunkte";
	L["Transportation Maps"] = "Beförderungsrouten";
	L["Transporter"] = "Transporter";
	L["Transporters by the sea and on the cliff"] = "Transporter übers Meer und am Kliff";
	L["West of the path to Timbermaw Hold"] = "Westlich des Weges zur Holzschlundfeste";
	L["Wind Rider"] = "Windreiter";
	L["Won't be available once the Battle for Andorhal chain is finished."] = "Nicht mehr verfügbar, wenn die Schlacht um Andorhal abgeschlossen ist.";
	L["Zeppelin Towers"] = "Zeppelintürme";
	L["Climbing Rope"] = "Kletterseil";
	L["Rappelling Rope"] = "Abseilstrick";
	L["Abandoned Kite"] = "Herrenloser Drachen";
	L["From sea level to ground level"] = "Von Meereshöhe auf Grundhöhe";
	L["Whispercloud's Balloon"] = "Flüsterwolkes Ballon";
	L["Shado-Pan Rope"] = "Seil der Shado-Pan";
--@end-do-not-package@
--@localization(locale="deDE", format="lua_additive_table")@
end
