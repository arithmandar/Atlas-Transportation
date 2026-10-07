-- Atlas_Transportation-koKR locale file

local AceLocale = LibStub:GetLibrary("AceLocale-3.0");
local L = AceLocale:NewLocale("Atlas_Transportation", "koKR", false);

if L then
	-- Colors for legend description
	L["White"] = "백색"
	L["Red"] = "적색"
	L["Purple"] = "자주색"
	L["Green"] = "녹색"
	L["Orange"] = "주황색"
	L["Blue"] = "청색"
	L["Yellow"] = "노란색"
	-- Class specific nodes
	L["Druid Only"] = "드루이드만"			-- Taxi node in Nighthaven, Moonglade which is only for Druid
	L["Death Knight Only"] = "죽음의 기사만"		-- Taxi node in Acherus: The Ebon Hold, which is only for Death Knight
	L["Hunter Only"] = "사냥꾼만"
	L["Class Specific Only"] = "특정 직업만"
	L["Warrior's landing / jumping point (from or back to Skyhold)"] = "전사의 착륙 / 도약 지점 (하늘보루에서 또는 하늘보루로)"
	-- Dalaran
	L["Class Order Halls"] = "직업 연맹 전당"
	L["Portal to the Maelstrom"] = "혼돈의 소용돌이로 통하는 차원문" -- Shaman
	L["Portal to Netherlight Temple"] = "황천빛 사원으로 통하는 차원문" -- Priest
	L["Portal to Dreadscar Rift"] = "공포흉터 균열로 통하는 차원문" -- Warlock
	L["Jump to Skyhold"] = "하늘보루로 도약" -- Warrior
	L["Illidari Gateway"] = "일리다리 관문" -- Demon Hunter
	L["Talua <Eagle Keeper>"] = "탈루아 <독수리 조련사>" -- 108868, NPC of Hunter as flight master in Dalaran's Krasus' Landing
	L["Flight to Trueshot Lodge"] = "정조준 오두막으로 비행" -- Hunter
	L["Portal to Sanctum of Light"] = "빛의 성소로 통하는 차원문" -- Paladin
	L["Connection to the Hall of Shadows"] = "그림자의 전당과 연결" -- Rogue
	L["Aludane Whitecloud <Flight Master>"] = "알루데인 화이트클라우드 <비행 조련사>" -- 96813
	-- Achievement Type
	L["Exploration"] = "탐험"
	-- Others
	L["Portal to Dalaran"] = "달라란으로 통하는 차원문"
	L["The Bogpaddle Bullet"] = "수렁진흙탕 총알로켓"
	L["Legend"] = "일러두기"				-- The chart's legend, for example, the purple line means the portal's path
	L["Gryphon"] = "그리핀"
	L["Only available after winning the PvP battle"] = "PvP 전투에서 승리한 뒤에만 이용 가능"
	L["Orb of Translocation"] = "순간이동의 보주"	-- The Orb in Silvermonn City and Ruins of Lordaeron
	L["Portals"] = "차원문"
	L["Portal / Waygate Path to the destination"] = "목적지로 통하는 차원문 / 관문 경로"
	L["Ship / Zeppelin sailing path to destination"] = "목적지까지 가는 배 / 비행선 항해 경로"
	L["Two ways portal"] = "양방향 차원문"
	L["Requires honored faction with Sha'tari Skyguard"] = "샤타리 하늘경비대에 우호적 평판 필요"
	L["Seahorse"] = "해마"
	L["South of the path along Lake Elune'ara"] = "엘룬아라 호수를 따라 난 길의 남쪽"
	L["Special transportation"] = "특별한 탈것"
	L["Taxi Nodes"] = "비행 경로"
	L["Transportation Maps"] = "탈것 지도"
	-- L["Transporter"] = "Transporter"			-- The NPC who can transport you to other place
	L["Transporters by the sea and on the cliff"] = "바닷가 절벽 위에 있는 순간이동기" -- The transporters (machine) can be found at Fuselight-by-the-Sea
	L["West of the path to Timbermaw Hold"] = "나무구렁 요새로 가는 길 서쪽"
	L["Wind Rider"] = "와이번"
	L["Won't be available once the Battle for Andorhal chain is finished."] = "일단 안돌할 전투 연계 퀘스트를 완료하면 이용할 수 없습니다." -- After quest "Alas, Andorhal" (27206) is completed.
	L["Zeppelin Towers"] = "비행선 탑승장"
	L["Climbing Rope"] = "등반용 밧줄"
	L["Rappelling Rope"] = "하강용 밧줄"
	L["Abandoned Kite"] = "버려진 연"
	L["From sea level to ground level"] = "해수면에서 지상까지"
	L["Whispercloud's Balloon"] = "위스퍼클라우드의 열기구"
	L["Shado-Pan Rope"] = "음영파 밧줄" -- 66390
	L["Require to complete \"Meet the Scout\" quest line first."] = "먼저 \"정찰병 만나기\" 퀘스트 라인을 완료해야 합니다."
	L["Warning: Drop"] = "경고: 낙하" -- In Dalaran (Legion - Broken Isles), inside teh Chamber of the Guardian, the portal to Dalaran Crater will drop you in the sky so there is a sign to warn you that
	L["Nutral"] = "중립"
	L["Airship"] = "비행선"
	L["Wind Rider Master"] = "와이번 조련사"
	L["Gryphon Master"] = "그리핀 조련사"
	L["Great Eagle"] = "거대 독수리" -- NPC: 109558
	L["Requires Eagle Ally Advancement"] = "독수리 지원군 성장 필요"
	L["Teleportation Nexus"] = "순간이동 거점"
	L["Requires Teleportation Nexus Advancement"] = "순간이동 거점 성장 필요"
	L["Gleep Chatterswitch"] = "글립 채터스위치" -- NPC: 71336
	L["Vindicaar"] = "구원호"
	L["Teleport Beacon"] = "순간이동 신호기"
	-- L["Boat to Stormwind City"] = "Boat to Stormwind City"
	-- L["Boat to Echo Isles, Durotar"] = "Boat to Echo Isles, Durotar"
	-- L["Honored with Sha'tari Skyguard"] = "Honored with Sha'tari Skyguard"
	-- L["Zeppelin to Orgrimmar"] = "Zeppelin to Orgrimmar"
	-- Options
	-- L["Return to Zuldazar"] = "Return to Zuldazar"
	-- L["Show %s's transportation maps"] = "Show %s's transportation maps"
	-- L["Change will take effect after next login; or type '/reload' command to reload addon"] = "Change will take effect after next login; or type '/reload' command to reload addon"
end
