-- store/_retired/deDE.lua
-- German translations for phrases no addon in the family currently uses.
--
-- NOT dead. A phrase lands here when the last addon using it drops or rewords it,
-- and scan.py moves it straight back into store/deDE.lua the moment any addon
-- starts using that exact English key again. Everything Quests v1.38.0 moved 224
-- phrases to EQ Objective Tracker in one release - this is what stops that costing
-- a translation.
--
-- Nothing here reaches the game. There is no reason to translate anything in this
-- file, and no reason to delete anything from it either.

local L = {}

L["for WoW Midnight (12.0.x)"] = "für WoW Midnight (12.0.x)"
L["Hides Questie's tracker frame while EQ Objective Tracker is running. Questie's own settings and tracked quests are not touched."] = "Blendet den Tracker von Questie aus, während der EQ Objective Tracker aktiv ist. Die eigenen Einstellungen und verfolgten Quests von Questie werden nicht verändert."
L["Marks every quest giver who has something for you but is not in your quest log yet, with a gold ring around the exclamation mark so it reads apart from the quests you are already carrying. One marker covers a whole quest giver, and hovering it lists everything that giver offers. Quests are filtered by your level, race, class and the quests you have already finished. Holiday quests are left out, because nothing in the data says whether the holiday is running."] = "Markiert jeden Questgeber, der etwas für dich hat, das noch nicht in deinem Questlog steht, mit einem goldenen Ring um das Ausrufezeichen, damit er sich von deinen laufenden Quests abhebt. Eine Markierung steht für einen ganzen Questgeber, und wenn du mit der Maus darüberfährst, werden alle seine Quests aufgelistet. Gefiltert wird nach deiner Stufe, Volk, Klasse und den Quests, die du bereits abgeschlossen hast. Feiertagsquests bleiben außen vor, weil aus den Daten nicht hervorgeht, ob der Feiertag gerade läuft."
L["Maximum Height (% of tracker)"] = "Maximale Höhe (% des Trackers)"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "Aktiviert alle sechs Kategoriefilter wieder und deaktiviert den Filter für das aktuelle Gebiet. Andere Einstellungen auf diesem Tab werden nicht geändert."

return L
