"""Generate every addon's Locales/<lang>.lua from the shared store.

    python build.py            # report only, and diff against what is on disk
    python build.py --apply

For each addon and language:  manifest  ∩  (override -> store)

The manifest decides WHICH phrases that addon gets and in what order, the store
supplies the words, and the addon's own house style decides how the file is spelled.
The store itself knows nothing about addons, which is what lets a phrase move
between them without losing its translation.

Three things are taken from the addon rather than the store, and all three matter:

  the key spelling   each addon's own verify tool compares SOURCE text, so a key
                     must be spelled the way that addon's manifest spells it. The
                     em dash is the live case: Everything Quests writes it literally,
                     EQ Objective Tracker writes "\\226\\128\\148".
  the section format Everything Quests uses "-- ─── File.lua ───", the tracker "-- File.lua"
  the file header    kept verbatim from the existing file, because it is written for
                     that addon's translators and is not ours to rewrite
"""
import io
import os
import sys

import addons
import lualocale as lua

FALLBACK_HEADER = '''-- Locales/%(code)s.lua
-- %(lang)s (%(code)s) translations for %(addon)s.
--
-- GENERATED from the shared translation store. Do not hand-edit: translate in the
-- EverythingLocales repo instead, which feeds every addon in the family.
--
-- NOTE: do NOT add an @localization@ packager token here. It fails the CurseForge
-- build with errorCode 1002 on a project without localization enabled. Translations
-- are bundled directly as the L["..."] lines below.

if GetLocale() ~= "%(code)s" then return end

local _, ns = ...
local L = ns.L'''


def build_one(addon, code, lang, store, overrides):
    cfg = addons.ADDONS[addon]
    path = addons.locale_path(addon, code)
    manifest = lua.manifest_in(addons.manifest_path(addon))

    header = lua.header_of(path, (FALLBACK_HEADER % {
        'code': code, 'lang': lang, 'addon': cfg['name']}).splitlines())

    lines, section, count = list(header), None, 0
    for src_section, src_key in manifest:
        decoded = lua.decode(src_key)
        value = overrides.get(decoded) or store.get(decoded)
        if not value:
            continue
        if src_section != section:
            section = src_section
            lines.append('')
            lines.append(cfg['section'] % src_section)
        # spelled the way THIS addon's manifest spells it, never the store's way
        lines.append('L["%s"] = "%s"' % (src_key, value))
        count += 1

    existing = lua.read(path) if os.path.isfile(path) else ''
    eol = lua.eol_of(existing, cfg['eol'])
    return path, eol.join(lines) + eol, count, len(manifest)


def key_value_pairs(text):
    """The set of (key, value) a file actually defines, ignoring layout."""
    out = {}
    for line in text.splitlines():
        if line.lstrip().startswith('--'):
            continue
        m = lua.PAIR.match(line)
        if m and m.group(2):
            out[lua.decode(m.group(1))] = lua.decode(m.group(2))
    return out


def main():
    apply = '--apply' in sys.argv
    ok = True

    for code, lang in addons.LANGUAGES:
        sp = addons.store_path(code)
        if not os.path.isfile(sp):
            print('%s: no store file, run scan.py first' % code)
            return 1
        store, _, _ = lua.pairs_in(sp)

        for addon in addons.ADDONS:
            op = addons.override_path(addon, code)
            overrides = {}
            if os.path.isfile(op):
                overrides, _, _ = lua.pairs_in(op)

            path, text, count, total = build_one(addon, code, lang, store, overrides)
            existing = lua.read(path) if os.path.isfile(path) else ''

            if existing == text:
                state = 'identical'
            else:
                before, after = key_value_pairs(existing), key_value_pairs(text)
                if before == after:
                    state = 'LAYOUT ONLY (same keys and values)'
                else:
                    lost = set(before) - set(after)
                    gained = set(after) - set(before)
                    changed = [k for k in set(before) & set(after)
                               if before[k] != after[k]]
                    state = ('CONTENT CHANGED: -%d +%d ~%d'
                             % (len(lost), len(gained), len(changed)))
                    ok = False
                    for k in list(lost)[:5]:
                        print('      lost   %r' % k.decode('utf-8', 'replace')[:60])
                    for k in list(changed)[:5]:
                        print('      value  %r' % k.decode('utf-8', 'replace')[:60])

            print('%-5s %s  %d / %d (%d%%)  [%s]'
                  % (addon, code, count, total,
                     round(100.0 * count / total) if total else 0, state))

            if apply:
                io.open(path, 'w', encoding='utf-8', newline='').write(text)

    if not apply:
        print('\nDRY RUN - re-run with --apply')
    if not ok:
        print('\nA file would change CONTENT, not just layout. Read the lines above '
              'before applying.')
    return 0


if __name__ == '__main__':
    sys.exit(main())
