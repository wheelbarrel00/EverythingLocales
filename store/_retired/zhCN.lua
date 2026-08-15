-- store/_retired/zhCN.lua
-- Simplified Chinese translations for phrases no addon in the family currently uses.
--
-- NOT dead. A phrase lands here when the last addon using it drops or rewords it,
-- and scan.py moves it straight back into store/zhCN.lua the moment any addon
-- starts using that exact English key again. Everything Quests v1.38.0 moved 224
-- phrases to EQ Objective Tracker in one release - this is what stops that costing
-- a translation.
--
-- Nothing here reaches the game. There is no reason to translate anything in this
-- file, and no reason to delete anything from it either.

local L = {}

L[" for the many hours spent translating Everything Quests into Chinese."] = "，投入大量时间将 Everything Quests 翻译为简体中文。"
L["Font for the Ready/25%/50%/75%/100% markers along this lane."] = "此轨道上「就绪」/25%/50%/75%/100% 刻度标记所用的字体。"
L["My HP %"] = "我的生命值 %"
L["My Power %"] = "我的资源 %"
L["Position (%)"] = "位置（%）"
L["Special thanks to %s for the many hours spent translating EQ Objective Tracker into Chinese."] = "特别感谢 %s，投入大量时间完成EQ Objective Tracker简体中文翻译。"

return L
