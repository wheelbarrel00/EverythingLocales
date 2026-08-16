"""Update addon TOCs with the locales configured in addons.py.

    python update_toc.py
    python update_toc.py --apply

The default is a dry run. Existing TOC entries are left untouched.
Missing configured locale files are added after the existing locale block.
"""

import os
import sys

import addons


def read_text(path):
    with open(path, encoding='utf-8', newline='') as f:
        return f.read()


def write_text(path, text):
    with open(path, 'w', encoding='utf-8', newline='') as f:
        f.write(text)


def locale_entries(text):
    entries = []
    for line in text.splitlines():
        normalized = line.strip().replace('/', '\\')
        if normalized.startswith('Locales\\') and normalized.lower().endswith('.lua'):
            entries.append(normalized)
    return entries


def find_locale_block(lines):
    indexes = []

    for i, line in enumerate(lines):
        normalized = line.strip().replace('/', '\\')
        if normalized.startswith('Locales\\') and normalized.lower().endswith('.lua'):
            indexes.append(i)

    if not indexes:
        return None

    return min(indexes), max(indexes)


def update_toc(path, languages, apply):
    text = read_text(path)
    newline = '\r\n' if '\r\n' in text else '\n'
    lines = text.splitlines()

    block = find_locale_block(lines)
    if block is None:
        print('%s: ERROR - no locale block found' % os.path.basename(path))
        return False

    start, end = block

    existing = {
        line.strip().replace('/', '\\').lower()
        for line in lines[start:end + 1]
    }

    missing = []

    for code, _ in languages:
        entry = 'Locales\\%s.lua' % code
        if entry.lower() not in existing:
            missing.append(entry)

    if not missing:
        print('%s: OK - all configured locales present' %
              os.path.basename(path))
        return True

    for entry in missing:
        print('%s: ADD %s' % (os.path.basename(path), entry))

    if not apply:
        return True

    insert_at = end + 1
    lines[insert_at:insert_at] = missing

    write_text(path, newline.join(lines) + newline)

    return True


def main():
    apply = '--apply' in sys.argv
    ok = True

    print('TOC locale update')
    print('Mode: %s\n' % ('APPLY' if apply else 'DRY RUN'))

    for addon, cfg in addons.ADDONS.items():
        path = cfg['path']

        print('== %s ==' % addon)

        toc_files = [
            name for name in os.listdir(path)
            if name.lower().endswith('.toc')
        ]

        if not toc_files:
            print('No TOC files found.')
            ok = False
            print()
            continue

        for name in sorted(toc_files):
            toc = os.path.join(path, name)

            if not update_toc(
                toc,
                addons.LANGUAGES,
                apply
            ):
                ok = False

        print()

    if not apply:
        print('DRY RUN - re-run with --apply to write changes.')

    return 0 if ok else 1


if __name__ == '__main__':
    sys.exit(main())