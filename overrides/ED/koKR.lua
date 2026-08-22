-- overrides/ED/koKR.lua
-- Korean (koKR) overrides for Everything Delves.
--
-- The store is keyed on the English phrase, which only works while that phrase means
-- the same thing in every addon. These two do not. See overrides/README.md.

local L = {}

-- Everything Quests uses "Gold" for the CURRENCY (quest money, MoneyFrame icon).
-- Everything Delves uses it for the accent COLOUR, beside Red, Purple and Dark Blue.
L["Gold"] = "금색"

-- EQ Objective Tracker uses "Title" for a SORT ORDER, alphabetical by quest name.
-- Everything Delves uses it for a PLAYER TITLE reward ("the Poisonous").
L["Title"] = "칭호"

return L
