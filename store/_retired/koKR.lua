-- store/_retired/koKR.lua
-- Korean translations for phrases no addon in the family currently uses.
--
-- NOT dead. A phrase lands here when the last addon using it drops or rewords it,
-- and scan.py moves it straight back into store/koKR.lua the moment any addon
-- starts using that exact English key again. Everything Quests v1.38.0 moved 224
-- phrases to EQ Objective Tracker in one release - this is what stops that costing
-- a translation.
--
-- Nothing here reaches the game. There is no reason to translate anything in this
-- file, and no reason to delete anything from it either.

local L = {}

L["An on-screen panel while inside a delve showing the story variant and its grade, the recommended curios for your role, your run timer, and your death count."] = "구렁 안에 있는 동안 이야기 변형과 등급, 역할에 맞는 추천 진기한 물건, 진행 시간, 사망 횟수를 보여주는 화면 패널입니다."
L["By default the World Quests area shares space with your quest list and gets squeezed when you have a lot of quests. Turn this on to give it its own height, set by the slider below."] = "기본적으로 전역 퀘스트 영역은 퀘스트 목록과 공간을 공유하여 퀘스트가 많으면 좁아집니다. 이 설정을 켜면 아래 슬라이더로 지정한 자체 높이를 갖습니다."
L["Card color for campaign quests. Needs Tint cards by quest type switched on."] = "대장정 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Card color for dungeon quests. Needs Tint cards by quest type switched on."] = "던전 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Card color for legendary quests. Needs Tint cards by quest type switched on."] = "전설 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Card color for raid quests. Needs Tint cards by quest type switched on."] = "공격대 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Draws a filled bar for objectives that report a percentage or a running total, the way the default tracker does, instead of a plain line of text. Applies to quests, World Quests, achievements and scenario objectives."] = "백분율이나 누적 수치를 보여주는 목표에 기본 추적기처럼 채워지는 막대를 그립니다. 단순한 텍스트 줄 대신 표시되며, 퀘스트, 전역 퀘스트, 업적, 시나리오 목표에 적용됩니다."
L["for WoW Midnight (12.0.x)"] = "WoW 한밤 (12.0.x) 용"
L["Frosthearth Venom \226\128\148 cuts enemy attack and cast speed by 20 percent, which buys time on both Soul Extinction and the Void Toxin dispel."] = "Frosthearth Venom — 적의 공격 속도와 시전 속도를 20퍼센트 낮춰, Soul Extinction과 Void Toxin 해제 양쪽에서 여유를 벌어 줍니다."
L["Give campaign, legendary, dungeon and raid quests their own card color so you can tell them apart at a glance. Anything else uses the plain background color above."] = "대장정, 전설, 던전, 공격대 퀘스트에 각각 고유한 카드 색상을 주어 한눈에 구분할 수 있게 합니다. 그 외에는 위의 기본 배경 색상을 사용합니다."
L["Marks every quest giver who has something for you but is not in your quest log yet, with a gold ring around the exclamation mark so it reads apart from the quests you are already carrying. One marker covers a whole quest giver, and hovering it lists everything that giver offers. Quests are filtered by your level, race, class and the quests you have already finished. Holiday quests are left out, because nothing in the data says whether the holiday is running."] = "줄 것이 있지만 아직 퀘스트 일지에 없는 퀘스트 제공자를 모두 표시하며, 느낌표 둘레에 금색 테두리를 둘러 이미 수행 중인 퀘스트와 구분됩니다. 표식 하나가 제공자 한 명 전체를 나타내고, 마우스를 올리면 그 제공자가 주는 모든 퀘스트가 나열됩니다. 퀘스트는 레벨, 종족, 직업, 그리고 이미 완료한 퀘스트를 기준으로 걸러집니다. 축제 퀘스트는 데이터만으로 축제 진행 여부를 알 수 없어 제외됩니다."
L["Maximum Height (% of tracker)"] = "최대 높이 (추적기의 백분율)"
L["Season 2 also gives her a Poison slot. This popup does not cover it yet - the Nemesis tab already recommends one for Azta'rec."] = "시즌 2에는 독 칸도 생겼습니다. 이 창은 아직 다루지 않으며 - 원수 탭에서 Azta'rec용 독을 이미 추천하고 있습니다."
L["The most of the tracker the world quest area may take. Quest sections are given their space first, so this is a ceiling rather than a reservation. Only used while Set a custom World Quests height is off."] = "전역 퀘스트 영역이 추적기에서 차지할 수 있는 최대치입니다. 퀘스트 섹션에 먼저 자리를 주므로 확보가 아니라 상한입니다. 전역 퀘스트 높이 직접 지정이 꺼져 있을 때만 사용됩니다."
L["These are the round red markers Everything Quests puts on the big world map for quests you've already picked up (the ones in your quest log). A red \"!\" means \"go here for this quest's next step.\" A red \"?\" means \"this quest is done \226\128\148 go here to turn it in.\" Quests you haven't accepted yet keep the game's own yellow \"!\" markers; EQ does not change those. Uncheck this box and all of EQ's red markers go away."] = "이미 수락한(퀘스트 일지에 있는) 퀘스트에 대해 Everything Quests가 큰 지도에 찍는 둥근 빨간 표시입니다. 빨간 \"!\"는 \"이 퀘스트의 다음 단계로 가라\", 빨간 \"?\"는 \"이 퀘스트는 완료됨 - 여기서 완료하라\"는 뜻입니다. 아직 수락 안 한 퀘스트는 게임 기본 노란 \"!\" 표시를 그대로 둡니다(EQ는 그것을 바꾸지 않음). 이 설정을 끄면 EQ의 빨간 표시가 모두 사라집니다."
L["Three of the six unlock from the quest \"%s\"."] = "여섯 중 셋은 \"%s\" 퀘스트로 해금됩니다."
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "여섯 개 분류 필터를 모두 다시 켜고 현재 지역 필터를 해제합니다. 이 탭의 다른 설정은 바뀌지 않습니다."

return L
