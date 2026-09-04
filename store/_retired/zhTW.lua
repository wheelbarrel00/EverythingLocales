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

L["%d hidden entries restored."] = "%d 條隱藏記錄已恢復。"
L["An on-screen panel while inside a delve showing the story variant and its grade, the recommended curios for your role, your run timer, and your death count."] = "在探究中的畫面面板，顯示劇情變體及其評級、適合你職責的建議珍奇物品、計時器和死亡次數。"
L["Bonus Spoils: Nemesis Strongbox packs + the Sanctified Banner — the bonus loot to grab before the boss."] = "額外戰利品：死敵保險箱的怪物組 + Sanctified Banner — 開首領之前該拿到手的額外戰利品。"
L["Bring back every entry you have hidden"] = "恢復所有被隱藏的記錄"
L["Draws a filled bar for objectives that report a percentage or a running total, the way the default tracker does, instead of a plain line of text. Applies to quests, World Quests, achievements and scenario objectives."] = "對於會給出百分比或累計數值的目標，像預設追蹤器那樣繪製一條填滿的進度條，而不是單純的一行文字。適用於任務、世界任務、成就和場景戰目標。"
L["for WoW Midnight (12.0.x)"] = "適用於魔獸世界午夜版本（12.0.x）"
L["Frosthearth Venom \226\128\148 cuts enemy attack and cast speed by 20 percent, which buys time on both Soul Extinction and the Void Toxin dispel."] = "Frosthearth Venom — 使敵人的攻擊與施法速度降低 20％，為 Soul Extinction 和 Void Toxin 的驅散都爭取到時間。"
L["Marks every quest giver who has something for you but is not in your quest log yet, with a gold ring around the exclamation mark so it reads apart from the quests you are already carrying. One marker covers a whole quest giver, and hovering it lists everything that giver offers. Quests are filtered by your level, race, class and the quests you have already finished. Holiday quests are left out, because nothing in the data says whether the holiday is running."] = "給尚未接取的任務NPC感嘆號新增金色外圈標記；一個標記對應整個NPC，滑鼠懸浮顯示全部可接任務。按等級、種族、職業、已完成任務過濾；節日任務不會標記，插件無法判斷節日是否開啟。"
L["Maximum Height (% of tracker)"] = "最大高度（佔追蹤器百分比）"
L["nothing is hidden."] = "沒有隱藏項目。"
L["Restore every option to its default value."] = "把每一項設定恢復為預設值。"
L["Restores every setting on every tab to its default and reloads the interface. This also clears the Options Window Scale, which every character shares, and this character's collapsed sections and individually hidden entries."] = "全部標簽頁恢復預設並重載界面。同時重置全角色共享的選項窗口縮放，以及本角色折疊板塊、單獨隱藏條目。"
L["Sanctified Banner - find it for bonus loot"] = "Sanctified Banner - 找到它即可獲得額外戰利品"
L["Sanctified Banner - Grand Spoils earned!"] = "Sanctified Banner - 已獲得豐厚戰利品！"
L["Sanctified Banner - kill the Voidfused Rager!"] = "Sanctified Banner - 擊殺 Voidfused Rager！"
L["Sanctified Banner found - bonus Spoils secured"] = "已找到 Sanctified Banner - 額外戰利品到手"
L["Season 2 also gives her a Poison slot. This popup does not cover it yet - the Nemesis tab already recommends one for Azta'rec."] = "第 2 賽季還給了她一個毒藥欄。這個彈窗暫時還不涵蓋它 - 死敵頁面已經為 Azta'rec 建議了一種。"
L["The most of this crest you're allowed to earn this season - the seasonal earning cap."] = "本賽季你最多能獲得的該紋章數量 - 也就是賽季取得上限。"
L["The seasonal cap on this crest - how many you can earn for the lower crests, and how many you can hold at once for the higher ones."] = "該紋章的賽季上限 - 低階紋章指你能取得的數量，高階紋章指你能同時持有的數量。"
L["Three of the six unlock from the quest \"%s\"."] = "六種中有三種透過任務 \"%s\" 解鎖。"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "重新開啟全部6項分類篩選，清除當前區域篩選。本標簽頁其餘選項保持不變。"
L["While inside a delve, tracks the two bonus-chest objectives - Nemesis Strongbox packs and the Sanctified Banner - so you know you've grabbed the extra loot before pulling the boss."] = "在探究中追蹤兩個額外寶箱目標 - 死敵保險箱的怪物組和 Sanctified Banner - 讓你在開首領之前確認額外戰利品都已到手。"

return L
