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
-- Atlas Localization Data (Simplified Chinese)
-- Initial translation by DiabloHu
-- Maintained by DiabloHu, arith, Ananhaid

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Transportation", "zhCN", false);

if L then
	-- Colors for legend description
	L["White"] = "白"
	L["Red"] = "红"
	L["Purple"] = "紫"
	L["Green"] = "绿"
	L["Orange"] = "橙"
	L["Blue"] = "蓝"
	L["Yellow"] = "黄"
	-- Class specific nodes
	L["Druid Only"] = "德鲁伊专用"			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] = "死亡骑士专用"		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Hunter Only"] = "猎人专用"
	L["Class Specific Only"] = "职业特定专用"
	L["Warrior's landing / jumping point (from or back to Skyhold)"] = "战士着陆/飞跃点（往返苍穹要塞）"
	-- Dalaran
	L["Class Order Halls"] = "职业大厅"
	L["Portal to the Maelstrom"] = "传送到大漩涡" -- Shaman
	L["Portal to Netherlight Temple"] = "传送到虚空之光神殿" -- Priest
	L["Portal to Dreadscar Rift"] = "传送到恐痕裂隙" -- Warlock
	L["Jump to Skyhold"] = "跃向苍穹要塞" -- Warrior
	L["Illidari Gateway"] = "伊利达雷传送门" -- Demon Hunter
	L["Talua <Eagle Keeper>"] = "塔鲁瓦 <雄鹰管理员>" -- 108868, NPC of Hunter as flight master in Dalaran's Krasus' Landing
	L["Flight to Trueshot Lodge"] = "飞往神射手营地" -- Hunter
	L["Portal to Sanctum of Light"] = "传送到圣光秘殿" -- Paladin
	L["Connection to the Hall of Shadows"] = "通向暗影大厅" -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "奥鲁丹·白云 <飞行管理员>" -- 96813
	-- Achievement Type
	L["Exploration"] = "探索"
	-- Others
	L["Portal to Dalaran"] = "传送到达拉然"
	L["The Bogpaddle Bullet"] = "沼桨弹头"
	L["Legend"] = "图例"				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "狮鹫"
	L["Only available after winning the PvP battle"] = "只有赢下 PvP 战斗后可用"
	L["Orb of Translocation"] = "传送宝珠"	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "传送门"
	L["Portal / Waygate Path to the destination"] = "传送门 / 界门传往目的地的路径"
	L["Ship / Zeppelin sailing path to destination"] = "船只 / 飞船航向目的地的路径"
	L["Two ways portal"] = "双向传送门"
	L["Requires honored faction with Sha'tari Skyguard"] = "需要沙塔尔天空卫队声望尊敬"
	L["Seahorse"] = "海马"
	L["South of the path along Lake Elune'ara"] = "月神湖旁小径的南方"
	L["Special transportation"] = "特殊交通"
	L["Taxi Nodes"] = "飞行点"
	L["Transportation Maps"] = "交通线路图"
	L["Transporter"] = "传送者"			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "在海上或悬崖上的传送者" -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "通往木喉要塞道路的西方"
	L["Wind Rider"] = "驭风者"
	L["Won't be available once the Battle for Andorhal chain is finished."] = "“安多哈尔之战”任务链完成之前不可使用。" -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "飞艇塔"
	L["Climbing Rope"] = "登山绳索"
	L["Rappelling Rope"] = "垂降绳索"
	L["Abandoned Kite"] = "被遗弃的风筝"
	L["From sea level to ground level"] = "从海平面到陆地"
	L["Whispercloud's Balloon"] = "语云的热气球"
	L["Shado-Pan Rope"] = "影踪派绳索" -- 66390
	L["Require to complete \"Meet the Scout\" quest line first."] = "需要先完成“会见斥候”任务线。"
	L["Warning: Drop"] = "警告：跌落" -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = "中立"
	L["Airship"] = "飞船"
	L["Wind Rider Master"] = "双足飞龙管理员"
	L["Gryphon Master"] = "狮鹫管理员"
	L["Great Eagle"] = "巨鹰" -- NPC: 109558
	L["Requires Eagle Ally Advancement"] = "需要升级巨鹰盟友"
	L["Teleportation Nexus"] = "传送中枢"
	L["Requires Teleportation Nexus Advancement"] = "需要升级传送中枢"
	L["Gleep Chatterswitch"] = "格里普·跳闸" -- NPC: 71336
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
