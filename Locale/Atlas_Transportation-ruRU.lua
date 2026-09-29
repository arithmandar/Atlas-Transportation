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
-- Atlas Localization Data (Russian)
-- Translated by Nitrogen (Exorsus Guild)
-- Свежеватель Душ
--]]

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Transportation", "ruRU", false);

if L then
	-- Colors for legend description
	L["White"] = "Белый"
	L["Red"] = "Красный"
	L["Purple"] = "Пурпурный"
	L["Green"] = "Зелёный"
	L["Orange"] = "Оранжевый"
	L["Blue"] = "Синий"
	L["Yellow"] = "Жёлтый"
	-- Class specific nodes
	L["Druid Only"] = "только друиду"			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] = "только рыцарю смерти"		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Hunter Only"] = "только охотнику"
	L["Class Specific Only"] = "Для определённых классов"
	L["Warrior's landing / jumping point (from or back to Skyhold)"] = "Точка приземления / прыжка воинов (из Небесной Цитадели и обратно)"
	-- Dalaran
	L["Class Order Halls"] = "Оплоты классов"
	L["Portal to the Maelstrom"] = "Портал в Водоворот" -- Shaman
	L["Portal to Netherlight Temple"] = "Портал в Храм света Пустоты" -- Priest
	L["Portal to Dreadscar Rift"] = "Портал в Разлом Зловещего Шрама" -- Warlock
	L["Jump to Skyhold"] = "Прыжок в Небесную Цитадель" -- Warrior
	L["Illidari Gateway"] = "Врата иллидари" -- Demon Hunter
	L["Talua <Eagle Keeper>"] = "Талуа <Хозяйка орлов>" -- 108868, NPC of Hunter as flight master in Dalaran's Krasus' Landing
	L["Flight to Trueshot Lodge"] = "Полёт в Приют Стрелка" -- Hunter
	L["Portal to Sanctum of Light"] = "Портал в Обитель Света" -- Paladin
	L["Connection to the Hall of Shadows"] = "Соединение с Оплотом Теней" -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "Алудан Белое Облако <Распорядитель полетов>" -- 96813
	-- Achievement Type
	L["Exploration"] = "Исследование"
	-- Others
	L["Portal to Dalaran"] = "Портал в Даларан"
	L["The Bogpaddle Bullet"] = "Болотный экспресс"
	L["Legend"] = "Легенда"				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "Грифон"
	L["Only available after winning the PvP battle"] = "Доступно только после победы в PvP-сражении"
	L["Orb of Translocation"] = "Шар Транслокации"	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "Порталы"
	L["Portal / Waygate Path to the destination"] = "Портал / путь по Связующей спирали"
	L["Ship / Zeppelin sailing path to destination"] = "Путь корабля / дирижабля"
	L["Two ways portal"] = "Двусторонний портал"
	L["Requires honored faction with Sha'tari Skyguard"] = "Требуется Уважение у фракции Стражи Небес Ша'тар"
	L["Seahorse"] = "Морской конек"
	L["South of the path along Lake Elune'ara"] = "Южный путь вдоль Озера Алуне'ара"
	L["Special transportation"] = "Особый транспорт"
	L["Taxi Nodes"] = "Мастера полетов"
	L["Transportation Maps"] = "Маршруты полётов"
	L["Transporter"] = "Транспорт"			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "Транспорт у моря и утёсов" -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "Западный путь в Крепость Древобрюхов"
	L["Wind Rider"] = "Укротитель ветрокрылов"
	L["Won't be available once the Battle for Andorhal chain is finished."] = "Не будет доступна пока не завершена серия заданий битвы за Андорал." -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "Башни дирижаблей"
	L["Climbing Rope"] = "Канат"
	L["Rappelling Rope"] = "Канат для спуска"
	L["Abandoned Kite"] = "Брошенный воздушный змей"
	L["From sea level to ground level"] = "От уровня моря к земле"
	L["Whispercloud's Balloon"] = "Воздушный шар Шепота Облака"
	L["Shado-Pan Rope"] = "Шадопанская веревка" -- 66390
	L["Require to complete \"Meet the Scout\" quest line first."] = "Необходимо сначала выполнить серию заданий \"Встреча с разведчицей\"."
	L["Warning: Drop"] = "Осторожно: упадёте" -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = "Нейтральный"
	L["Airship"] = "Воздушное судно"
	L["Wind Rider Master"] = "Укротитель ветрокрылов"
	L["Gryphon Master"] = "Укротитель грифонов"
	L["Great Eagle"] = "Большой орел" -- NPC: 109558
	L["Requires Eagle Ally Advancement"] = "Требуется для продвижение Орлы-помощники"
	L["Teleportation Nexus"] = "Нексус телепортации"
	L["Requires Teleportation Nexus Advancement"] = "Требуется для продвижение Нексус телепортации"
	L["Gleep Chatterswitch"] = "Глип Кряхтумблер" -- NPC: 71336
	L["Vindicaar"] = "Виндикар"
	L["Teleport Beacon"] = "Телепортационный маячок"
	L["Boat to Stormwind City"] = "Корабль в Штормград"
	L["Boat to Echo Isles, Durotar"] = "Корабль на Острова Эха, Дуротар"
	L["Honored with Sha'tari Skyguard"] = "Награжден орденом Ша'тари «Небесный страж»"
	L["Zeppelin to Orgrimmar"] = "Цеппелин в Оргриммаре"
	-- Options
	L["Return to Zuldazar"] = "Возвращение в Зулдазар"
	L["Show %s's transportation maps"] = "Показать транспортные карты %s"
	L["Change will take effect after next login; or type '/reload' command to reload addon"] = "Изменения вступят в силу после следующего входа в игру. Либо введите команду '/reload', чтобы перезагрузить интерфейс"
end
