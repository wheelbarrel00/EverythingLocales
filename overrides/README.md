# Overrides

For the rare phrase that means **different things in different addons**.

The store is keyed on the English phrase, which is only safe while that phrase means the
same thing everywhere. Sometimes it does not. A file here wins over the store, for one
addon only:

```
overrides/EQOT/frFR.lua
overrides/EQ/ruRU.lua
```

Same format as a store file, and only the phrases that need overriding.

## The case this exists for

`L["Back"]` was the real one. EQ Objective Tracker used it for the **cloak equipment
slot**; Everything Quests uses it for a **go back** navigation button. One shared key,
and the French, Russian and Korean all said "go back" - so a French player read
`Équipé: ilvl 610 (Retour)` on a cloak.

## Prefer fixing it at the source

An override is the last resort, not the first move. Better, in order:

1. **Use the game's own word.** An equipment slot, item type, class or race name is
   already a Blizzard global string. `_G[equipLoc]` is correct in every client language,
   not just the three shipped here, and matches the wording on the tooltip the player is
   comparing against. This is how `Back` was actually fixed - the phrase was deleted, not
   overridden.
2. **Reword one side** so the two phrases are genuinely different keys. Do this before it
   ships: changing a shipped English key orphans its translation in every language.
3. **Override**, if there is no game string to defer to and neither wording can move.

## Rules

- Name the conflict in a comment, with the other addon's usage, so the call can be
  re-checked if that addon rewords.
- Only for a phrase that means the wrong THING. A translation that is merely
  stylistically off is not a reason - an imperfect translation still beats English.
  `Daily` and `Weekly` are deliberately not overridden for this reason.
- `check.py` fails on an override naming a phrase its addon does not use.

## In use today

`overrides/ED/{ruRU,koKR,zhCN,zhTW}.lua` - two keys, both of which shipped wrong in
Everything Delves v1.28.0 and were fixed in v1.29.0:

- `L["Title"]` - EQ Objective Tracker offers it as a sort order meaning the quest's own
  name, so Russian, Korean and both Chinese chose the word for the heading of a document.
  Everything Delves uses it for a PLAYER TITLE reward, where that word is wrong.
- `L["Gold"]` - Everything Quests uses it for quest money, beside a coin icon. Everything
  Delves uses it for an accent colour, in a list whose other entries are Red, Purple and
  Dark Blue. Four languages returned the currency.

German and French need neither file: their word for each carries both senses. Note the
lowercase `L["gold"]` is a separate key and was always the colour, which is what made the
collision easy to confirm.

Two files today. Fewer is better.
