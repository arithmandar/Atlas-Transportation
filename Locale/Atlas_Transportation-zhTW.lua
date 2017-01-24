-- $Id$
--[[

	Atlas, a World of Warcraft instance map browser
	Copyright 2005 ~ 2010 - Dan Gilbert <dan.b.gilbert@gmail.com>
	Copyright 2010 - Lothaer <lothayer@gmail.com>, Atlas Team
	Copyright 2011 ~ 2017 - Arith Hsu, Atlas Team <atlas.addon at gmail.com>

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
local L = AceLocale:NewLocale("Atlas_Transportation", "zhTW", false);

if L then
--@do-not-package@
	-- Colors for legend description
	L["White"] 	= "白";
	L["Red"] 	= "紅";
	L["Purple"] 	= "紫";
	L["Green"] 	= "綠";
	L["Orange"] 	= "橙";
	L["Blue"] 	= "藍";
	L["Yellow"] 	= "黃";
	-- Class specific nodes
	L["Druid Only"] 	= "僅限德魯伊";		-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] 	= "僅限死亡騎士";	-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Hunter Only"] 	= "僅限獵人";
	L["Class Specific Only"] = "僅限特定職業";
	L["Warrior's landing / jumping point (from or back to Skyhold)"] = "戰士的降落 / 跳躍點（往返擎天堡）";
	-- Dalaran
	L["Class Order Halls"] 			= "職業大廳";
	L["Portal to the Maelstrom"] 		= "大漩渦傳送門"; -- Shaman
	L["Portal to Netherlight Temple"] 	= "虛空之光神殿傳送門"; -- Priest
	L["Portal to Dreadscar Rift"] 		= "懼痕裂隙傳送門" -- Warlock
	L["Jump to Skyhold"] 			= "跳到擎天堡"; -- Warrior
	L["Illidari Gateway"] 			= "伊利達瑞傳送門"; -- Demon Hunter
	L["Talua <Eagle Keeper>"] 		= "塔陸亞 <飼鷹者>"; -- NPC of Hunter as flight master in Dalaran's Krasus' Landing
	L["Flight to Trueshot Lodge"] 		= "飛行到神獵廳"; -- Hunter
	L["Portal to Sanctum of Light"] 	= "聖光會堂傳送門"; -- Paladin
	L["Connection to the Hall of Shadows"] 	= "通往潛影之廳"; -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "艾魯丹·白雲 <飛行管理員>";
	-- Achievement Type
	L["Exploration"]	= "探索";
	-- Others
	L["Portal to Dalaran"] = "到達拉然的傳送門";
	L["The Bogpaddle Bullet"] = "沼槳火箭";
	L["Legend"] = "圖例";				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "獅鷲獸";
	L["Only available after winning the PvP battle"] = "僅限贏得戰場勝利後";
	L["Orb of Translocation"] = "傳送之門";	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "傳送門";
	L["Portal / Waygate Path to the destination"] = "傳送門 / 甬道之門傳往目的地的路徑";
	L["Ship / Zeppelin sailing path to destination"] = "船隻 / 飛船航向目的地的路徑";
	L["Two ways portal"] = "雙向傳送門";
	L["Requires honored faction with Sha'tari Skyguard"] = "需薩塔空防陣營榮譽";
	L["Seahorse"] = "海馬";
	L["South of the path along Lake Elune'ara"] = "月神湖南方小徑";
	L["Special transportation"] = "特殊運輸工具";
	L["Taxi Nodes"] = "航行點";
	L["Transportation Maps"] = "交通網路地圖";
	L["Transporter"] = "輸送者";
	L["Transporters by the sea and on the cliff"] = "傳送器位於懸崖上與懸崖下"; -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "往木喉要塞小徑西方";
	L["Wind Rider"] = "雙足飛龍";
	L["Won't be available once the Battle for Andorhal chain is finished."] = "安多哈爾任務線完成後飛行點將會消失"; -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "飛船空塔";
	L["Climbing Rope"] = "登山繩";
	L["Rappelling Rope"] = "垂降繩";
	L["Abandoned Kite"] = "被遺棄的鳶";
	L["From sea level to ground level"] = "從海平面到地面";
	L["Whispercloud's Balloon"] = "雲語的氣球";
	L["Shado-Pan Rope"] = "影潘索 "; -- 66390
	L["Require to complete \"Meet the Scout\" quest line first."] = "需要先完成“和斥候會面”任務線。";
	L["Warning: Drop"] = "小心輕放"; -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = "中立";
	L["Airship"] = "飛行器";
	L["Wind Rider Master"] = "蠍尾獅管理員";
	L["Gryphon Master"] = "獅鷲獸管理員";
	L["Great Eagle"] = "巨鷹";
	L["Requires Eagle Ally Advancement"] = "需要升級飛鷹盟友";
	L["Teleportation Nexus"] = "傳送網路";
	L["Requires Teleportation Nexus Advancement"] = "需要升級傳送網路";
	L["Gleep Chatterswitch"] = "格里坡·恰恰開關"; -- NPC: 71336
--@end-do-not-package@
--@localization(locale="zhTW", format="lua_additive_table")@
end

