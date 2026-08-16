"""Per-addon profiles. Everything that differs between the addons lives here.

Adding a third addon to the family means adding one entry, nothing else.

The paths are sibling checkouts, matching how the repos already sit on disk. No
addon depends on this repo at runtime or in CI - the locale files it generates are
committed into each addon, so a lone checkout still builds and still passes its own
gates. This is a build-time input only.
"""
import os

ROOT = os.path.dirname(os.path.abspath(__file__))
SIBLING = os.path.dirname(ROOT)

LANGUAGES = [
    ('deDE', 'German'),
    ('frFR', 'French'),
    ('ruRU', 'Russian'),
    ('koKR', 'Korean'),
    ('zhCN', 'Simplified Chinese'),
    ('zhTW', 'Traditional Chinese'),
]


ADDONS = {
    'EQ': {
        'name': 'Everything Quests',
        'path': os.path.join(SIBLING, 'EverythingQuests'),
        # section comment written above each file's block in the generated files
        'section': '-- ─── %s ───',
        # manifest ordering: these files first, everything else alphabetical
        'preferred': [
            'Options/TabGeneral.lua', 'Options/TabTracker.lua',
            'Options/TabWorldQuests.lua', 'Options/TabChainGuide.lua',
            'Options/TabAppearance.lua', 'Options/TabHistory.lua',
            'Options/Frame.lua',
        ],
        # repo-root translator worksheets are not source
        'skip': ('Libs/', 'Locales/'),
        'skip_contains': ('TRANSLATE-ME',),
        'eol': '\n',
        'manifest_eol': '\n',
    },
    'EQOT': {
        'name': 'EQ Objective Tracker',
        'path': os.path.join(SIBLING, 'EQObjectiveTracker'),
        'section': '-- %s',
        'preferred': [
            'Options/TabGeneral.lua', 'Options/TabTracker.lua',
            'Options/TabAppearance.lua', 'Options/TabAbout.lua',
            'Options/Frame.lua',
        ],
        'skip': ('Libs/', 'Locales/'),
        'skip_contains': (),
        'eol': '\n',
        'manifest_eol': '\n',
    },
    'CDM': {
        'name': 'Cooldown Master',
        'path': os.path.join(SIBLING, 'CooldownMaster'),
        'section': '-- %s',
        # One hand-rolled panel rather than a file per tab, so the order is just
        # the panel first and the frames it draws after it.
        'preferred': [
            'UI/Options.lua', 'UI/Widgets.lua', 'UI/WhatsNew.lua',
            'UI/Lanes.lua', 'UI/ReadyFrames.lua', 'UI/Bars.lua',
        ],
        # tools/ and docs/ are dev scripts, media/ has no Lua
        'skip': ('Libs/', 'Locales/', 'tools/', 'docs/'),
        'skip_contains': (),
        'eol': '\n',
        'manifest_eol': '\n',
    },
}


def locale_path(addon, code):
    return os.path.join(ADDONS[addon]['path'], 'Locales', '%s.lua' % code)


def manifest_path(addon):
    return os.path.join(ADDONS[addon]['path'], 'Locales', 'enUS.lua')


def store_path(code):
    return os.path.join(ROOT, 'store', '%s.lua' % code)


def retired_path(code):
    return os.path.join(ROOT, 'store', '_retired', '%s.lua' % code)


def override_path(addon, code):
    return os.path.join(ROOT, 'overrides', addon, '%s.lua' % code)
