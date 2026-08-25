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
L["for WoW Midnight (12.0.x)"] = "适用于魔兽世界午夜版本（12.0.x）"
L["Marks every quest giver who has something for you but is not in your quest log yet, with a gold ring around the exclamation mark so it reads apart from the quests you are already carrying. One marker covers a whole quest giver, and hovering it lists everything that giver offers. Quests are filtered by your level, race, class and the quests you have already finished. Holiday quests are left out, because nothing in the data says whether the holiday is running."] = "给尚未接取的任务NPC感叹号添加金色外圈标记；一个标记对应整个NPC，鼠标悬浮显示全部可接任务。按等级、种族、职业、已完成任务过滤；节日任务不会标记，插件无法判断节日是否开启。"
L["Maximum Height (% of tracker)"] = "最大高度（占追踪器百分比）"
L["My HP %"] = "我的生命值 %"
L["My Power %"] = "我的资源 %"
L["Position (%)"] = "位置（%）"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "重新开启全部6项分类筛选，清除当前区域筛选。本标签页其余选项保持不变。"

return L
