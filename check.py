"""Gate the shared store and everything generated from it.

    python check.py

Exits non-zero on any of:

  a line the parser cannot read, which scan.py would silently DELETE rather than
    retire, because it rewrites each file from exactly what pairs_in returns
  a store value that would raise inside string.format in that language
  a store phrase no addon uses (scan.py retires those, so one here means it was
    hand-added to the wrong file)
  an override naming a phrase its addon does not use
  a locale file on disk that does not match what build.py would write, which is how
    a translation edited in an addon repo instead of the store shows up

That last one is the reason this gate exists. The whole failure this repo was built
to stop is a translation living somewhere the other addon cannot see it.
"""
import collections
import os
import sys

import addons
import build
import formatcheck
import lualocale as lua


def main():
    fails = 0

    # A line pairs_in cannot match is not a parse error anywhere - Lua still loads the
    # file, and every other check here reads through pairs_in, so the phrase simply
    # stops existing as far as this repo is concerned. scan.py then rewrites the file
    # from what pairs_in returned and the translation is gone, with no retired copy.
    # A backslash before a real newline is the shape that does it: valid Lua, invisible
    # to a line-anchored parser.
    print('== lines the parser can read ==')
    unreadable = 0
    for code, _lang in addons.LANGUAGES:
        paths = [addons.store_path(code), addons.retired_path(code)]
        for addon in addons.ADDONS:
            paths.append(addons.override_path(addon, code))
            paths.append(addons.locale_path(addon, code))
        for path in paths:
            if not os.path.isfile(path):
                continue
            _v, _s, bad = lua.pairs_in(path, warn=True)
            for n, text in bad:
                print('   FAIL %s line %d unreadable, scan.py would DROP it: %s'
                      % (os.path.relpath(path, addons.ROOT), n, text))
                unreadable += 1
    fails += unreadable
    print('   %s' % ('%d unreadable line(s)' % unreadable if unreadable
                     else 'every L[...] line parses in every store, override and locale file'))

    live, per_addon = set(), {}
    for addon in addons.ADDONS:
        keys = set(lua.decode(k) for _s, k in
                   lua.manifest_in(addons.manifest_path(addon)))
        per_addon[addon] = keys
        live |= keys
    print('phrases in use: %d  (%s)'
          % (len(live), ', '.join('%s %d' % (a, len(per_addon[a])) for a in per_addon)))

    # phrases in EVERY addon is the wrong set once there are three - the homograph
    # review wants anything two or more of them draw
    seen = collections.Counter()
    for keys in per_addon.values():
        seen.update(keys)
    shared = [k for k, n in seen.items() if n > 1]
    print('used by more than one addon: %d  '
          '(check these read the same in each before rewording)' % len(shared))

    for code, lang in addons.LANGUAGES:
        sp = addons.store_path(code)
        if not os.path.isfile(sp):
            print('\n%s: MISSING %s' % (code, sp))
            fails += 1
            continue
        store, srckeys, bad = lua.pairs_in(sp, warn=True)
        for n, text in bad:
            print('\n%s: store line %d unparsed, would be DROPPED: %s' % (code, n, text))
            fails += 1

        bad_format, notes = [], 0
        for k, value in store.items():
            key_src = srckeys[k]
            f, n = formatcheck.check(key_src, value)
            if f:
                bad_format.append((key_src, value, f))
            notes += 1 if n else 0

        orphans = [k for k in store if k not in live]

        covered = len([k for k in live if k in store])
        print('\n== %s ==  %d of %d in use (%d%%), %d format NOTE(s)'
              % (code, covered, len(live),
                 round(100.0 * covered / len(live)) if live else 0, notes))
        for a in per_addon:
            got = len([k for k in per_addon[a] if k in store])
            print('   %-5s %d / %d (%d%%)'
                  % (a, got, len(per_addon[a]),
                     round(100.0 * got / len(per_addon[a])) if per_addon[a] else 0))

        for key_src, value, why in bad_format:
            print('   FAIL %s' % ascii(key_src[:70]))
            print('        %s' % ascii(value[:90]))
            for w in why:
                print('        -> %s' % w)
        fails += len(bad_format)

        if orphans:
            print('   FAIL %d store phrase(s) no addon uses - run scan.py' % len(orphans))
            for k in orphans[:8]:
                print('        %s' % ascii(k.decode('utf-8', 'replace')[:70]))
            fails += len(orphans)

        for addon in addons.ADDONS:
            op = addons.override_path(addon, code)
            if not os.path.isfile(op):
                continue
            over, _s, _b = lua.pairs_in(op)
            stray = [k for k in over if k not in per_addon[addon]]
            if stray:
                print('   FAIL %s override names %d phrase(s) that addon does not use'
                      % (addon, len(stray)))
                for k in stray[:8]:
                    print('        %s' % ascii(k.decode('utf-8', 'replace')[:70]))
                fails += len(stray)

    print('\n== generated files on disk ==')
    for code, lang in addons.LANGUAGES:
        sp = addons.store_path(code)
        if not os.path.isfile(sp):
            continue
        store, _s, _b = lua.pairs_in(sp)
        for addon in addons.ADDONS:
            op = addons.override_path(addon, code)
            over = lua.pairs_in(op)[0] if os.path.isfile(op) else {}
            path, text, _c, _t = build.build_one(addon, code, lang, store, over)
            on_disk = lua.read(path) if os.path.isfile(path) else ''
            if on_disk == text:
                continue
            same = build.key_value_pairs(on_disk) == build.key_value_pairs(text)
            print('   %s %s: DRIFT - %s' % (addon, code,
                  'layout only, run build.py' if same
                  else 'CONTENT differs, a translation was edited outside the store'))
            fails += 1

    if fails:
        print('\nFAIL: %d problem(s).' % fails)
        return 1
    print('\nOK - store is sound and every generated file matches it.')
    return 0


if __name__ == '__main__':
    sys.exit(main())
