# Everything Locales

Translations for Wheelbarrel00's World of Warcraft addons, in one place.

| Addon | What it is |
|---|---|
| [Everything Quests](https://github.com/wheelbarrel00/EverythingQuests) | Quest log, world map overlays, quest history and the Chain Guide |
| [EQ Objective Tracker](https://github.com/wheelbarrel00/EQObjectiveTracker) | The objective tracker, also usable on its own |
| [Cooldown Master](https://github.com/wheelbarrel00/CooldownMaster) | Timeline-style lane cooldown tracker |

Every addon here gets its French, Russian, Korean and Simplified Chinese from this repo.
Nothing here is installed or downloaded by players - it generates the translation files
that ship inside each addon.

## Why one repo

The addons share phrases, and phrases move between them. When the tracker moved out
of Everything Quests into EQ Objective Tracker, 224 translated phrases per language went
with it - and every one of them was lost in the move, sitting unused in one addon while
showing up as untranslated English in the other.

Here, a translation is stored against its **English phrase** and nothing else. Which
addon uses it is worked out when the files are built. So a phrase that moves between
addons keeps its translation, and a phrase more than one addon uses is translated once.
Cooldown Master joined in August 2026 and arrived with 45 phrases already translated in
every language, without anyone typing a word.

## Translating

**Edit one file: `store/<language>.lua`.** That is the only file translators touch.

```lua
L["Hide tracker in combat"] = "Cacher le module de suivi pendant le combat"
```

The English text inside `L["..."]` is the key - leave it exactly as it is. Type your
translation between the quotes after the `=`.

Keep these exactly as they appear:

| | |
|---|---|
| `%d` `%s` | a number or a name gets inserted here |
| `%1$s` `%2$d` | the same, when your language needs a different word order |
| `\|cffaaaaaa ... \|r` | color codes |
| `\n` | a line break |
| `\"` | a quote mark inside the text |

Anything you leave out simply stays English in game, so a partial translation is always
safe. There is no need to finish a language, and no need to work in order.

**`store/_phrases.lua` is the worklist.** It lists every phrase currently in use, grouped
by the addon and the source file it comes from, so you can see what a phrase is *for*
before choosing a word for it. It is generated - do not translate in it.

**`store/_retired/` is not work.** Those are phrases no addon uses at the moment. They
are kept so that if a phrase comes back, its translation comes back with it. Nothing in
there reaches the game.

### Sending a translation

Open a pull request against this repo with your changes to `store/<language>.lua`. You
can edit the file directly on GitHub - no need to clone anything or install any tools.

Please do not open translation PRs against the two addon repos. Their `Locales/` files
are generated from this one, so changes there are overwritten on the next build.

## Current coverage

| | French | Russian | Korean | Simplified Chinese |
|---|---|---|---|---|
| Everything Quests | 440 / 440 | 440 / 440 | 355 / 440 | 384 / 440 |
| EQ Objective Tracker | 380 / 387 | 380 / 387 | 380 / 387 | 380 / 387 |
| Cooldown Master | 45 / 444 | 45 / 444 | 45 / 444 | 437 / 444 |

1173 phrases in use across the addons, 82 of them used by more than one. Measured
2026-08-15; the addons are under active development, so run `check.py` for today's figure
rather than trusting this table.

The seven the tracker is missing are the same seven in every language. Cooldown Master is
newly added, so French, Russian and Korean cover only the phrases it shares with the other
two - it is the obvious place to start if you would like to help.

**Cooldown Master's Simplified Chinese is a machine draft and has not been checked by a
native speaker.** It is marked here rather than quietly counted, and a review of it is
worth more than new coverage elsewhere.

## Credits

| | |
|---|---|
| French | Zox |
| Russian | Malevi4 |
| Korean | labrie75 |
| Simplified Chinese | 失眠啤酒 (Everything Quests and the tracker) |

## For maintainers

```
python scan.py --apply     # rebuild every manifest, sync the store from every addon
python build.py --apply    # write every addon's Locales/<lang>.lua from the store
python check.py            # gate, must exit 0
```

`scan.py` imports translations an addon has that the store does not, retires phrases no
addon uses, and revives retired phrases that have come back into use. `build.py` writes
each addon's locale files in that addon's own house style. `check.py` verifies format
specifiers by argument index, catches phrases no addon uses, and reports drift - a
locale file that no longer matches what the store would produce, which is how a
translation edited in the wrong repo shows up.

Each addon keeps its own `Locales/enUS.lua` manifest and its own gates, and passes them
on a lone checkout. This repo is a build-time input, never a runtime or CI dependency.

Adding another addon to the family is one entry in `addons.py`.

## License

MIT for the tooling. Translations are contributed by the people credited above.
