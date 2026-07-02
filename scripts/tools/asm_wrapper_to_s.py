#!/usr/bin/env python3
"""asm_wrapper_to_s.py — convert meaningless `__asm__`-wrapper C files to real `.s`.

Some carve waves produced `src/data/**/*.c` that only wrap inline `__asm__("...")`
with pure assembly directives (.section/.global/.short/.byte/.4byte/.asciz) — they
are not real C. This tool detects such pure-`__asm__` wrapper `.c` files and rewrites
each as a real `.s` assembly source (built via SRC_S_OBJECTS), byte-for-byte
equivalent (cpp never expands inside `__asm__` string literals; these files use no
`.incbin`, no CPP macros, and raw `.byte` for SJIS, so there is no cpp/iconv step to
preserve). See docs/decisions.md (D336).

A file is a "pure wrapper" iff, after stripping comments and `#include` lines and
removing every `__asm__(...);` block, nothing but whitespace remains. Files with any
real C (structs, arrays, `INCBIN_U*`, functions) are left untouched.

Usage:
    # list wrappers (default: scan src/data/**/*.c, dry run)
    scripts/tools/asm_wrapper_to_s.py --list
    # convert specific files
    scripts/tools/asm_wrapper_to_s.py src/data/foo/foo.c ...
    # convert all detected wrappers, write .s, and (optionally) rewire git + .gitignore
    scripts/tools/asm_wrapper_to_s.py --all [--git]

`--git` runs `git rm <c>` / `git add <s>` and appends the needed `!<path>` negations
to .gitignore (the ignore rule `src/data/**/*.s` normally drops agbcc intermediates;
committed real-source .s need explicit negations). Always `make compare` afterwards.
Every generated `.s` is pre-verified to assemble when `arm-none-eabi-as` is available.
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def is_wrapper(path):
    """True if `path` is a .c that only wraps inline __asm__ (no real C)."""
    try:
        s = open(path, encoding="utf-8", errors="replace").read()
    except OSError:
        return False
    s = re.sub(r"/\*.*?\*/", "", s, flags=re.DOTALL)      # block comments
    s = re.sub(r"//[^\n]*", "", s)                          # line comments
    s = re.sub(r"^\s*#\s*include[^\n]*$", "", s, flags=re.MULTILINE)  # includes
    if "__asm__" not in s:
        return False
    rest = re.sub(r"__asm__\s*\(.*?\)\s*;", "", s, flags=re.DOTALL)   # asm blocks
    return rest.strip() == ""


def _unescape(s):
    """Decode the C string escapes these wrappers use (all ASCII: \\t \\n \\" \\\\)."""
    out = []
    i = 0
    m = {"t": "\t", "n": "\n", "r": "\r", '"': '"', "\\": "\\", "'": "'", "0": "\0"}
    while i < len(s):
        if s[i] == "\\" and i + 1 < len(s):
            out.append(m.get(s[i + 1], s[i + 1]))
            i += 2
        else:
            out.append(s[i])
            i += 1
    return "".join(out)


def convert_text(text):
    """Char-level scan (string/comment aware) → the equivalent .s text.

    Robust against inline `/* ... */` comments between/after __asm__ blocks (a naive
    regex mangled those, leaving raw \\t/\\n escapes in the output)."""
    out = []
    i, n = 0, len(text)
    while i < n:
        m = re.match(r"__asm__\s*\(", text[i:])
        if m:
            i += m.end()
            parts = []
            while i < n:
                c = text[i]
                if c == '"':
                    j = i + 1
                    buf = []
                    while j < n:
                        if text[j] == "\\" and j + 1 < n:
                            buf.append(text[j]); buf.append(text[j + 1]); j += 2
                        elif text[j] == '"':
                            break
                        else:
                            buf.append(text[j]); j += 1
                    parts.append("".join(buf))
                    i = j + 1
                elif c == ")":
                    i += 1
                    m2 = re.match(r"\s*;", text[i:])
                    if m2:
                        i += m2.end()
                    break
                elif c == "/" and i + 1 < n and text[i + 1] == "*":
                    e = text.find("*/", i + 2); i = (e + 2) if e >= 0 else n
                elif c == "/" and i + 1 < n and text[i + 1] == "/":
                    e = text.find("\n", i); i = e if e >= 0 else n
                else:
                    i += 1
            out.append(_unescape("".join(parts)).rstrip("\n"))
            continue
        if text[i] == "/" and i + 1 < n and text[i + 1] == "*":
            e = text.find("*/", i + 2)
            out.append(text[i:(e + 2) if e >= 0 else n].strip())
            i = (e + 2) if e >= 0 else n
            continue
        if text[i] == "#" or (text[i] == "/" and i + 1 < n and text[i + 1] == "/"):
            e = text.find("\n", i); i = e if e >= 0 else n
            continue
        i += 1
    return "\n".join(x for x in out if x.strip()) + "\n"


def find_wrappers():
    files = subprocess.run(
        ["git", "ls-files", "src/data/**/*.c"], cwd=ROOT, capture_output=True, text=True
    ).stdout.split()
    return [f for f in files if is_wrapper(os.path.join(ROOT, f))]


def assemble_ok(spath):
    try:
        r = subprocess.run(
            ["arm-none-eabi-as", "-mcpu=arm7tdmi", "-mthumb-interwork",
             "-I", "include", "-I", ".", "-g", spath, "-o", "/dev/null"],
            cwd=ROOT, capture_output=True, text=True)
        return r.returncode == 0, r.stderr
    except FileNotFoundError:
        return True, "(arm-none-eabi-as not found; skipped assemble check)"


def convert_files(cpaths, do_git):
    negations = []
    for c in cpaths:
        cabs = c if os.path.isabs(c) else os.path.join(ROOT, c)
        s = cabs[:-2] + ".s"
        open(s, "w").write(convert_text(open(cabs).read()))
        ok, err = assemble_ok(s)
        if not ok:
            sys.stderr.write("ASSEMBLE FAILED for %s:\n%s\n" % (s, err))
            return 1
        rel = os.path.relpath(s, ROOT)
        negations.append(rel)
        if do_git:
            subprocess.run(["git", "rm", "-q", os.path.relpath(cabs, ROOT)], cwd=ROOT)
            subprocess.run(["git", "add", rel], cwd=ROOT)
    if do_git and negations:
        gi = os.path.join(ROOT, ".gitignore")
        with open(gi, "a") as f:
            f.write("\n# asm_wrapper_to_s.py: committed real-source .s (no .c twin),"
                    " negated past src/data/**/*.s\n")
            for p in sorted(negations):
                f.write("!" + p + "\n")
        subprocess.run(["git", "add", ".gitignore"], cwd=ROOT)
    print("converted %d file(s)%s. Run `make compare` + `make shiftcheck`."
          % (len(cpaths), " (git rewired + .gitignore negations added)" if do_git else ""))
    return 0


def main():
    args = sys.argv[1:]
    if "--list" in args:
        for f in find_wrappers():
            print(f)
        return 0
    if "--all" in args:
        return convert_files(find_wrappers(), do_git="--git" in args)
    files = [a for a in args if not a.startswith("--")]
    if not files:
        sys.stderr.write(__doc__)
        return 2
    return convert_files(files, do_git="--git" in args)


if __name__ == "__main__":
    sys.exit(main())
