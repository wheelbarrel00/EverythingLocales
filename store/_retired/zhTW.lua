-- store/_retired/zhTW.lua
-- Traditional Chinese translations for phrases no addon in the family currently uses.
--
-- NOT dead. A phrase lands here when the last addon using it drops or rewords it,
-- and scan.py moves it straight back into store/zhTW.lua the moment any addon
-- starts using that exact English key again. Everything Quests v1.38.0 moved 224
-- phrases to EQ Objective Tracker in one release - this is what stops that costing
-- a translation.
--
-- Nothing here reaches the game. There is no reason to translate anything in this
-- file, and no reason to delete anything from it either.

local L = {}

L["Maximum Height (% of tracker)"] = "最大高度（佔追蹤器百分比）"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "重新開啟全部6項分類篩選，清除當前區域篩選。本標簽頁其餘選項保持不變。"

return L
