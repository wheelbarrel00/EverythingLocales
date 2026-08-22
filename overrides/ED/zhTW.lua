-- overrides/ED/zhTW.lua
-- Traditional Chinese (zhTW) overrides for Everything Delves.
--
-- The store is keyed on the English phrase, which only works while that phrase means
-- the same thing in every addon. These two do not. See overrides/README.md.

local L = {}

-- Everything Quests uses "Gold" for the CURRENCY (quest money, MoneyFrame icon).
-- Everything Delves uses it for the accent COLOUR, beside Red, Purple and Dark Blue.
L["Gold"] = "金色"

-- EQ Objective Tracker uses "Title" for a SORT ORDER, alphabetical by quest name.
-- Everything Delves uses it for a PLAYER TITLE reward ("the Poisonous").
L["Title"] = "稱號"

return L
