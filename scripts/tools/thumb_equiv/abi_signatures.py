"""Function-specific ABI metadata for nonmatching equivalence checks.

The ARM AAPCS passes the first four words in r0-r3 and later words on the
caller's stack.  The symbolic call oracle historically recorded only r0-r3,
which is insufficient for callees such as sub_800A194.
"""

from dataclasses import dataclass
import re


@dataclass(frozen=True)
class CallSignature:
    name: str
    address: int
    arg_words: int


CALL_SIGNATURES = {
    "sub_800A194": CallSignature(
        name="sub_800A194",
        address=0x0800A194,
        arg_words=5,
    ),
}

CALL_SIGNATURES_BY_ADDRESS = {
    signature.address: signature
    for signature in CALL_SIGNATURES.values()
}

# Keep this deliberately narrow.  Add an entry only when a nonmatching
# function's proof needs a known callee ABI that cannot be inferred from r0-r3.
REQUIRED_CALLEES = {
    "sub_800A34C": ("sub_800A194",),
}


def signature_for_target(target):
    """Return known metadata for a direct call target, or None."""
    if isinstance(target, int):
        return CALL_SIGNATURES_BY_ADDRESS.get(target & ~1)
    if isinstance(target, str):
        return CALL_SIGNATURES.get(target)
    return None


def strip_comments_and_literals(source):
    """Remove comments and literals while preserving punctuation/line shape."""
    out = []
    i = 0
    state = "code"
    while i < len(source):
        ch = source[i]
        nxt = source[i + 1] if i + 1 < len(source) else ""
        if state == "code":
            if ch == "/" and nxt == "*":
                out.extend("  ")
                i += 2
                state = "block"
                continue
            if ch == "/" and nxt == "/":
                out.extend("  ")
                i += 2
                state = "line"
                continue
            if ch == '"':
                out.append(" ")
                i += 1
                state = "string"
                continue
            if ch == "'":
                out.append(" ")
                i += 1
                state = "char"
                continue
            out.append(ch)
            i += 1
            continue
        if state == "block":
            if ch == "*" and nxt == "/":
                out.extend("  ")
                i += 2
                state = "code"
            else:
                out.append("\n" if ch == "\n" else " ")
                i += 1
            continue
        if state == "line":
            out.append("\n" if ch == "\n" else " ")
            i += 1
            if ch == "\n":
                state = "code"
            continue
        if ch == "\\" and i + 1 < len(source):
            out.extend("  ")
            i += 2
            continue
        if (state == "string" and ch == '"') or (state == "char" and ch == "'"):
            out.append(" ")
            i += 1
            state = "code"
        else:
            out.append("\n" if ch == "\n" else " ")
            i += 1
    return "".join(out)


def _argument_counts(source, callee):
    """Return top-level argument counts for every callee(...) occurrence."""
    clean = strip_comments_and_literals(source)
    counts = []
    for match in re.finditer(r"\b" + re.escape(callee) + r"\s*\(", clean):
        start = clean.find("(", match.start())
        depth = 1
        commas = 0
        saw_token = False
        i = start + 1
        while i < len(clean) and depth:
            ch = clean[i]
            if ch == "(":
                depth += 1
                saw_token = True
            elif ch == ")":
                depth -= 1
                if depth == 0:
                    break
            elif ch == "," and depth == 1:
                commas += 1
            elif depth == 1 and not ch.isspace():
                saw_token = True
            i += 1
        if depth != 0:
            counts.append(None)
        elif not saw_token:
            counts.append(0)
        else:
            counts.append(commas + 1)
    return counts


def validate_source(fn, source):
    """Return ABI errors for required direct callees in one reconstruction."""
    errors = []
    for callee in REQUIRED_CALLEES.get(fn, ()):
        signature = CALL_SIGNATURES[callee]
        counts = _argument_counts(source, callee)
        if not counts:
            errors.append(
                f"{callee}: missing declaration/call; expected "
                f"{signature.arg_words} arguments"
            )
            continue
        for occurrence, count in enumerate(counts, 1):
            if count != signature.arg_words:
                got = "unbalanced" if count is None else str(count)
                errors.append(
                    f"{callee} occurrence {occurrence}: got {got} arguments, "
                    f"expected {signature.arg_words}"
                )
    return errors
