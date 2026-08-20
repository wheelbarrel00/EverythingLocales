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

L["Hides Questie's tracker frame while EQ Objective Tracker is running. Questie's own settings and tracked quests are not touched."] = "Blendet den Tracker von Questie aus, während der EQ Objective Tracker aktiv ist. Die eigenen Einstellungen und verfolgten Quests von Questie werden nicht verändert."
L["Maximum Height (% of tracker)"] = "Maximale Höhe (% des Trackers)"
L["Turns all six category filters back on and clears the current-zone filter. Nothing else on this tab is changed."] = "Aktiviert alle sechs Kategoriefilter wieder und deaktiviert den Filter für das aktuelle Gebiet. Andere Einstellungen auf diesem Tab werden nicht geändert."

return L
