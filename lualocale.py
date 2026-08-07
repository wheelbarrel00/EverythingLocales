"""Shared parsing for Lua locale files. Every tool here goes through this.

The one subtle thing is decode(). Matching is done on the BYTES Lua would hold at
runtime, never on the source text, because the family does not write non-ASCII the
same way everywhere: Everything Quests writes an em dash as the literal UTF-8
character while EQ Objective Tracker writes "\\226\\128\\148". Those are one identical
Lua string at runtime but three Python characters against one, so a source-text
comparison drops the phrase with nothing to show it happened.
"""
import io
import re

PAIR = re.compile(r'^\s*L\["((?:[^"\\]|\\.)*)"\]\s*=\s*"((?:[^"\\]|\\.)*)"\s*$')
SENTINEL = re.compile(r'^L\["((?:[^"\\]|\\.)*)"\]\s*=\s*true\s*$')
KEY_USAGE = re.compile(r'L\["((?:[^"\\]|\\.)*)"\]')
SECTION = re.compile(r'^--\s*(?:─── )?([\w/]+\.lua)(?: ───)?\s*$')

ESCAPES = {'a': '\a', 'b': '\b', 'f': '\f', 'n': '\n', 'r': '\r',
           't': '\t', 'v': '\v', '\\': '\\', '"': '"', "'": "'"}

HEADER_END = 'local L = ns.L'


def decode(s):
    """Lua short-string body -> the bytes Lua holds at runtime."""
    out, i, n = [], 0, len(s)
    while i < n:
        c = s[i]
        if c != '\\':
            out.append(c.encode('utf-8'))
            i += 1
            continue
        i += 1
        if i >= n:
            break
        e = s[i]
        if e in ESCAPES:
            out.append(ESCAPES[e].encode('utf-8'))
            i += 1
        elif e.isdigit():
            digits = ''
            while i < n and s[i].isdigit() and len(digits) < 3:
                digits += s[i]
                i += 1
            out.append(bytes([int(digits) & 0xFF]))
        else:
            out.append(e.encode('utf-8'))
            i += 1
    return b''.join(out)


def read(path):
    return io.open(path, encoding='utf-8', newline='').read()


def eol_of(text, default='\n'):
    return '\r\n' if '\r\n' in text else default


def strip_comments(text):
    return '\n'.join(l for l in text.splitlines() if not l.lstrip().startswith('--'))


def pairs_in(path, warn=False):
    """(values, srckeys, bad), all keyed on the DECODED key.

    srckeys carries the key exactly as this file spells it. That matters because
    the two addons do not spell every key the same way - Everything Quests writes a
    literal em dash where EQ Objective Tracker writes "\\226\\128\\148" - and each
    addon's own verify tool compares SOURCE text, so a locale file must spell a key
    the way its own manifest does or the key reads as an orphan there.

    Only the canonical one-line form is understood. Files get REWRITTEN from what
    this returns, so anything unparsed would vanish without a trace - hence warn.
    """
    values, srckeys, bad = {}, {}, []
    for n, line in enumerate(read(path).splitlines(), 1):
        if line.lstrip().startswith('--'):
            continue
        m = PAIR.match(line)
        if m and m.group(2):
            k = decode(m.group(1))
            values[k] = m.group(2)
            srckeys[k] = m.group(1)
        elif warn and 'L[' in line and '=' in line:
            bad.append((n, line.strip()[:70]))
    return values, srckeys, bad


def manifest_in(path):
    """[(section, source-form key), ...] in manifest order."""
    out, section = [], None
    for line in read(path).splitlines():
        s = SECTION.match(line.strip())
        if s:
            section = s.group(1)
            continue
        m = SENTINEL.match(line.strip())
        if m:
            out.append((section, m.group(1)))
    return out


def header_of(path, fallback):
    """The LINES up to and including `local L = ns.L`, verbatim.

    Preserved rather than templated: each file's header is written for its own
    translator, in their language, and regenerating it would quietly rewrite what
    they were given. Only the body below it is ours to rebuild.

    Returns a list, never a joined string. Joining here would bake this function's
    idea of a line ending into the middle of a file the caller is about to join with
    a different one, and the result is a file that is half CRLF and half LF.
    """
    try:
        text = read(path)
    except IOError:
        return list(fallback) if fallback is not None else None
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if line.strip() == HEADER_END:
            return lines[:i + 1]
    return list(fallback) if fallback is not None else None
