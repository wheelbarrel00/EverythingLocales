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

L["for WoW Midnight (12.0.x)"] = "適用於魔獸世界午夜版本（12.0.x）"
L["Marks every quest giver who has something for you but is not in your quest log yet, with a gold ring around the exclamation mark so it reads apart from the quests you are already carrying. One marker covers a whole quest giver, and hovering it lists everything that giver offers. Quests are filtered by your level, race, class and the quests you have already finished. Holiday quests are left out, because nothing in the data says whether the holiday is running."] = "給尚未接取的任務NPC感嘆號新增金色外圈標記；一個標記對應整個NPC，滑鼠懸浮顯示全部可接任務。按等級、種族、職業、已完成任務過濾；節日任務不會標記，插件無法判斷節日是否開啟。"
L["Maximum Height (% of tracker)"] = "最大高度（佔追蹤器百分比）"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "重新開啟全部6項分類篩選，清除當前區域篩選。本標簽頁其餘選項保持不變。"

return L
