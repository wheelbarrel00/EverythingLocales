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

L["By default the World Quests area shares space with your quest list and gets squeezed when you have a lot of quests. Turn this on to give it its own height, set by the slider below."] = "기본적으로 전역 퀘스트 영역은 퀘스트 목록과 공간을 공유하여 퀘스트가 많으면 좁아집니다. 이 설정을 켜면 아래 슬라이더로 지정한 자체 높이를 갖습니다."
L["Card color for campaign quests. Needs Tint cards by quest type switched on."] = "대장정 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Card color for dungeon quests. Needs Tint cards by quest type switched on."] = "던전 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Card color for legendary quests. Needs Tint cards by quest type switched on."] = "전설 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Card color for raid quests. Needs Tint cards by quest type switched on."] = "공격대 퀘스트의 카드 색상입니다. 퀘스트 종류별 카드 색상을 켜야 적용됩니다."
L["Give campaign, legendary, dungeon and raid quests their own card color so you can tell them apart at a glance. Anything else uses the plain background color above."] = "대장정, 전설, 던전, 공격대 퀘스트에 각각 고유한 카드 색상을 주어 한눈에 구분할 수 있게 합니다. 그 외에는 위의 기본 배경 색상을 사용합니다."
L["The most of the tracker the world quest area may take. Quest sections are given their space first, so this is a ceiling rather than a reservation. Only used while Set a custom World Quests height is off."] = "전역 퀘스트 영역이 추적기에서 차지할 수 있는 최대치입니다. 퀘스트 섹션에 먼저 자리를 주므로 확보가 아니라 상한입니다. 전역 퀘스트 높이 직접 지정이 꺼져 있을 때만 사용됩니다."

return L
