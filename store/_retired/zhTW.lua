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

L["An on-screen panel while inside a delve showing the story variant and its grade, the recommended curios for your role, your run timer, and your death count."] = "在探究中的畫面面板，顯示劇情變體及其評級、適合你職責的建議珍奇物品、計時器和死亡次數。"
L["for WoW Midnight (12.0.x)"] = "適用於魔獸世界午夜版本（12.0.x）"
L["Frosthearth Venom \226\128\148 cuts enemy attack and cast speed by 20 percent, which buys time on both Soul Extinction and the Void Toxin dispel."] = "Frosthearth Venom — 使敵人的攻擊與施法速度降低 20％，為 Soul Extinction 和 Void Toxin 的驅散都爭取到時間。"
L["Marks every quest giver who has something for you but is not in your quest log yet, with a gold ring around the exclamation mark so it reads apart from the quests you are already carrying. One marker covers a whole quest giver, and hovering it lists everything that giver offers. Quests are filtered by your level, race, class and the quests you have already finished. Holiday quests are left out, because nothing in the data says whether the holiday is running."] = "給尚未接取的任務NPC感嘆號新增金色外圈標記；一個標記對應整個NPC，滑鼠懸浮顯示全部可接任務。按等級、種族、職業、已完成任務過濾；節日任務不會標記，插件無法判斷節日是否開啟。"
L["Maximum Height (% of tracker)"] = "最大高度（佔追蹤器百分比）"
L["Season 2 also gives her a Poison slot. This popup does not cover it yet - the Nemesis tab already recommends one for Azta'rec."] = "第 2 賽季還給了她一個毒藥欄。這個彈窗暫時還不涵蓋它 - 死敵頁面已經為 Azta'rec 建議了一種。"
L["Three of the six unlock from the quest \"%s\"."] = "六種中有三種透過任務 \"%s\" 解鎖。"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "重新開啟全部6項分類篩選，清除當前區域篩選。本標簽頁其餘選項保持不變。"

return L
