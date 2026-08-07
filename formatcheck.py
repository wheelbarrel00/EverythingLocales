"""Format-specifier parity between an English key and its translation.

Ported from Everything Quests' docs/_check_locale_format.py, which is the version
that finally got this right. Keeping the logic in one place across the family is the
point of this repo: the check was written wrong twice before, first comparing
specifier COUNTS (so %s becoming %d passed) and then comparing the sequence of
conversion types (which false-failed any correct positional reorder).

WoW's string.format supports Blizzard's positional extension (%1$s, %2$d) so a
translator can reorder arguments, and Russian and Korean genuinely need it. A value
is therefore compared by ARGUMENT INDEX, never as a flat list.

  FAIL - raises at runtime in that language only:
           an invalid specifier
           a reference to an argument index the key does not supply
           a numeric conversion where the key passes a string
           positional and plain specifiers mixed in one string
  NOTE - the value uses fewer of the key's arguments than the key does. Legitimate:
         Russian and Korean have no use for English's "%s" plural suffix.
"""
import re

SPEC = re.compile(r"%(?:(\d+)\$)?([-+ #0]*)(\d*)(?:\.(\d+))?([a-zA-Z])")
# %c takes a number in Lua 5.1, so it belongs with the numeric conversions
NUMERIC = set("diouxXeEfgGc")
VALID = set("diouxXeEfgGqsc")


def parse(fmt):
    """(argmap, positional count, plain count, [bad specifier strings])."""
    args, bad = {}, []
    positional = plain = 0
    nxt = 1
    stripped = fmt.replace("%%", "")
    consumed = set()
    for m in SPEC.finditer(stripped):
        idx, _flags, width, prec, conv = m.groups()
        consumed.add(m.start())
        if conv not in VALID:
            bad.append(m.group(0))
            continue
        # Lua 5.1 rejects a width or precision longer than two digits
        if len(width or "") > 2 or len(prec or "") > 2:
            bad.append(m.group(0))
            continue
        if idx:
            positional += 1
            i = int(idx)
        else:
            plain += 1
            i = nxt
            nxt += 1
        args[i] = conv
    # A '%' the pattern did not consume is a malformed escape - '%$d', a stray '%z',
    # or a lone trailing '%' where the translator meant '%%'. Lua raises on all three
    for pos, ch in enumerate(stripped):
        if ch == "%" and pos not in consumed:
            bad.append(stripped[pos:pos + 3])
    return args, positional, plain, bad


def check(key, value):
    """([fail reasons], [note reasons])."""
    fails, notes = [], []
    kargs, _kp, _kn, kbad = parse(key)
    vargs, vpos, vplain, vbad = parse(value)

    for b in vbad:
        fails.append("invalid specifier %r" % b)
    if kbad:
        fails.append("invalid specifier in the ENGLISH KEY: %s" % kbad)
    if vpos and vplain:
        fails.append("mixes positional and plain specifiers in one string")

    for i, conv in sorted(vargs.items()):
        kconv = kargs.get(i)
        if kconv is None:
            fails.append("uses argument %d (%%%s) but the key supplies only %d"
                         % (i, conv, len(kargs)))
        elif conv in NUMERIC and kconv not in NUMERIC:
            fails.append("argument %d is %%%s but the key passes a string (%%%s)"
                         % (i, conv, kconv))

    missing = sorted(set(kargs) - set(vargs))
    if missing and not fails:
        notes.append("does not use argument" + ("s " if len(missing) > 1 else " ")
                     + ", ".join(str(i) for i in missing))
    return fails, notes
