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
L["%d hidden entries restored."] = "%d 条隐藏记录已恢复。"
L["/eqs\n/everythingquests\n\n|cff999999Both open this options window.|r\n\n/eqs whatsnew\n\n|cff999999Show what's new in the latest update.|r\n\n/eqs session\n\n|cff999999Show a recap of your current play session.|r"] = "/eqs\n/everythingquests\n\n|cff999999以上两条命令均可打开此设置窗口。|r\n\n/eqs whatsnew\n\n|cff999999查看本次更新的新内容。|r\n\n/eqs session\n\n|cff999999查看当前游戏会话统计。|r"
L["A unified replacement for the Blizzard quest experience: a custom tracker, objective markers on the map and minimap, nameplate quest icons, and a browser for the quests you have not picked up yet."] = "一套完整替代暴雪任务体验的工具：自定义追踪器、世界地图与小地图上的目标标记、姓名板任务图标，以及尚未接取任务的浏览器。"
L["A unified replacement for the Blizzard quest experience: a custom tracker, world-map overlays, quest history, and a Midnight chain guide."] = "一套完整替代暴雪任务体验的工具：自定义追踪器、世界地图覆盖层、任务历史记录以及午夜版本任务链指南。"
L["Also reads the progress other quest addons broadcast, so you see everyone in the group rather than only the people running EQ. When you join a group EQ asks those addons for their quest logs, the same way they ask each other. Your own progress is never sent on their channel."] = "同时读取其他任务插件广播的进度，这样你能看到队伍中的所有人，而不只是使用 EQ 的玩家。加入队伍时，EQ 会像这些插件彼此之间那样向它们请求任务日志。你自己的进度绝不会通过它们的频道发送。"
L["An on-screen panel while inside a delve showing the story variant and its grade, the recommended curios for your role, your run timer, and your death count."] = "在地下堡中的屏幕面板，显示剧情变体及其评级、适合你职责的推荐珍奇物品、计时器和死亡次数。"
L["Bonus Spoils: Nemesis Strongbox packs + the Sanctified Banner — the bonus loot to grab before the boss."] = "额外战利品：死敌保险箱的怪物组 + Sanctified Banner — 开首领之前该拿到手的额外战利品。"
L["Bring back every entry you have hidden"] = "恢复所有被隐藏的记录"
L["Colors & Dimensions"] = "颜色与尺寸"
L["Colors each quest title by how hard it is for your level, the way the quest log does. The Quest Title Color Override on the Appearance tab wins over this while it is set."] = "像原生任务日志一样，按等级难度渲染任务标题颜色。外观页的任务标题强制颜色优先级更高。"
L["Colors quest, achievement, and endeavor titles with the class color of the character you are currently logged in on. Overrides the color above while it is on. Off by default."] = "使用当前登录角色职业颜色渲染任务、成就、活动标题。开启后覆盖上面设置，默认关闭。"
L["Colors quest, achievement, and endeavor titles with the class color of the character you are currently logged in on. Overrides the color below while it is on. Off by default."] = "使用当前登录角色职业颜色渲染任务、成就、活动标题。开启后覆盖下面设置，默认关闭。"
L["Colors the section headers (Quests, Campaign, and so on) with the class color of the character you are currently logged in on. Overrides the color above while it is on. Off by default."] = "使用当前登录角色职业颜色渲染板块标题。开启后覆盖上面设置，默认关闭。"
L["Draws a filled bar for objectives that report a percentage or a running total, the way the default tracker does, instead of a plain line of text. Applies to quests, World Quests, achievements and scenario objectives."] = "对于会给出百分比或累计数值的目标，像默认追踪器那样绘制一条填充的进度条，而不是单纯的一行文字。适用于任务、世界任务、成就和场景战目标。"
L["Font for the Ready/25%/50%/75%/100% markers along this lane."] = "此轨道上「就绪」/25%/50%/75%/100% 刻度标记所用的字体。"
L["for WoW Midnight (12.0.x)"] = "适用于魔兽世界午夜版本（12.0.x）"
L["Frosthearth Venom \226\128\148 cuts enemy attack and cast speed by 20 percent, which buys time on both Soul Extinction and the Void Toxin dispel."] = "Frosthearth Venom — 使敌人的攻击与施法速度降低 20％，为 Soul Extinction 和 Void Toxin 的驱散都争取到时间。"
L["Header Bar"] = "标题条带"
L["Instead of green."] = "替换绿色显示。"
L["Marks every quest giver who has something for you but is not in your quest log yet, with a gold ring around the exclamation mark so it reads apart from the quests you are already carrying. One marker covers a whole quest giver, and hovering it lists everything that giver offers. Quests are filtered by your level, race, class and the quests you have already finished. Holiday quests are left out, because nothing in the data says whether the holiday is running."] = "给尚未接取的任务NPC感叹号添加金色外圈标记；一个标记对应整个NPC，鼠标悬浮显示全部可接任务。按等级、种族、职业、已完成任务过滤；节日任务不会标记，插件无法判断节日是否开启。"
L["Maximum Height (% of tracker)"] = "最大高度（占追踪器百分比）"
L["My HP %"] = "我的生命值 %"
L["My Power %"] = "我的资源 %"
L["nothing is hidden."] = "没有隐藏项目。"
L["Off: Everything Quests stops putting World Quests on the map — no world-map pins, no reward summary box, no zone quest list. The boxes below do nothing while this is off. This switch is ONLY for World Quests. It does NOT remove the red \"!\" / \"?\" quest rings — those are your normal quests, and you turn them off on the General tab. It also does NOT change the World Quests list in your tracker (that's on the Tracker tab)."] = "关闭：不再在地图渲染世界任务标记、奖励汇总框、区域任务列表。该开关仅控制世界任务；不会移除普通任务红色!/?标记（在通用页关闭）；也不修改追踪器内世界任务列表（追踪器页设置）。"
L["Position (%)"] = "位置（%）"
L["Quest Title Color By Difficulty"] = "按难度着色任务标题"
L["Quest Title Color Override"] = "强制任务标题颜色"
L["Restore every option to its default value."] = "把每一项设置恢复为默认值。"
L["Restores every setting on every tab to its default and reloads the interface. This also clears the Options Window Scale, which every character shares, and this character's collapsed sections and individually hidden entries."] = "全部标签页恢复默认并重载界面。同时重置全角色共享的选项窗口缩放，以及本角色折叠板块、单独隐藏条目。"
L["Sanctified Banner - find it for bonus loot"] = "Sanctified Banner - 找到它即可获得额外战利品"
L["Sanctified Banner - Grand Spoils earned!"] = "Sanctified Banner - 已获得丰厚战利品！"
L["Sanctified Banner - kill the Voidfused Rager!"] = "Sanctified Banner - 击杀 Voidfused Rager！"
L["Sanctified Banner found - bonus Spoils secured"] = "已找到 Sanctified Banner - 额外战利品到手"
L["Season 2 also gives her a Poison slot. This popup does not cover it yet - the Nemesis tab already recommends one for Azta'rec."] = "第 2 赛季还给了她一个毒药槽。这个弹窗暂时还不涵盖它 - 死敌页面已经为 Azta'rec 推荐了一种。"
L["Show Options icon on the tracker"] = "追踪框显示设置图标"
L["Slash commands"] = "聊天命令"
L["The most of this crest you're allowed to earn this season - the seasonal earning cap."] = "本赛季你最多能获得的该纹章数量 - 也就是赛季获取上限。"
L["The seasonal cap on this crest - how many you can earn for the lower crests, and how many you can hold at once for the higher ones."] = "该纹章的赛季上限 - 低阶纹章指你能获得的数量，高阶纹章指你能同时持有的数量。"
L["Three of the six unlock from the quest \"%s\"."] = "六种中有三种通过任务 \"%s\" 解锁。"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "重新开启全部6项分类筛选，清除当前区域筛选。本标签页其余选项保持不变。"
L["Use class color for titles"] = "任务标题使用职业颜色"
L["When cleared, falls back to difficulty coloring or default yellow."] = "清空后将使用任务难度颜色或默认黄色。"
L["While inside a delve, tracks the two bonus-chest objectives - Nemesis Strongbox packs and the Sanctified Banner - so you know you've grabbed the extra loot before pulling the boss."] = "在地下堡中追踪两个额外宝箱目标 - 死敌保险箱的怪物组和 Sanctified Banner - 让你在开首领之前确认额外战利品都已到手。"

return L
