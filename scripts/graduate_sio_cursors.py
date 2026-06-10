#!/usr/bin/env python3
"""Phase-1/2 helper: graduate sio_core.c functions that reference the TU-private
cursor statics (sSendCursor/sWriteCursor/sReadCursor/sRecvCursor), which the
generic graduate_exact_asm cannot, because extract_func_only drops the file-scope
statics. Here the cursors are bound as baseline_syms (data_sio_cursors.tsv) at the
exact JP addresses that coincide with sio_core.o(.bss); we just prepend the matching
`extern` decls to the function-only C so it compiles. verify-or-revert; make compare
is the sole oracle. NOT a git operation; caller stages explicitly.

Usage: scripts/graduate_sio_cursors.py <fn> [<fn> ...]
"""
import os, re, sys, subprocess, time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"

# PARALLEL-SAFE FRAGMENT (see graduate_exact_asm.py): unique per-run fragment, globbed
# by the build, so concurrent agents never collide on the shared exact_layer.tsv.
EXACT_LAYER = "layout/carved_rom.d/exact_layer.tsv"  # legacy shared file (read-only now)
FRAG = f"layout/carved_rom.d/graduated_sio_{os.getpid()}_{int(time.time())}.tsv"
CURSORS = ("sSendCursor", "sWriteCursor", "sReadCursor", "sRecvCursor")


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def funcmap():
    fm = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 5:
            fm[p[4]] = (int(p[0], 16), int(p[2]))  # name -> (jp_start, size)
    return fm


def grad_one(name, jp, size):
    asm = f"asm/{name}.s"
    gfrag = f"layout/carved_rom.d/gbadisasm_{name}.tsv"
    src = f"src/{name}.c"
    if os.path.exists(src):
        return "skip:src exists"
    snap = {p: (open(p).read() if os.path.exists(p) else None)
            for p in (asm, gfrag, FRAG, src)}

    ext = sh(f"python3 scripts/extract_func_only.py {US}/src/sio_core.c {name}")
    body = ext.stdout
    if name not in body or "{" not in body:
        return f"skip:extract failed"
    # prepend externs for any cursor the body references (and that the includes
    # don't already declare). u16 cursors; sReadCursor/sRecvCursor are u16[4].
    used = [c for c in CURSORS if re.search(r"\b" + c + r"\b", body)]
    decls = ""
    for c in used:
        decls += (f"extern u16 {c}[4];\n" if c in ("sReadCursor", "sRecvCursor")
                  else f"extern u16 {c};\n")
    lines = body.splitlines(keepends=True)
    li = max((i for i, l in enumerate(lines) if l.lstrip().startswith("#include")),
             default=-1)
    body = "".join(lines[:li + 1]) + "\n" + decls + "".join(lines[li + 1:])
    open(src, "w").write(body)

    # clear implicit-decl helpers (same trick as graduate_exact_asm)
    for _ in range(4):
        sh(f"rm -f src/{name}.o src/{name}.s")
        r = sh(f"make src/{name}.o")
        if os.path.exists(f"src/{name}.o"):
            break
        impl = set(re.findall(
            r"implicit declaration of function [`'\"]?(\w+)", r.stderr + r.stdout))
        if not impl:
            break
        externs = "".join(f"extern int {h}();\n" for h in sorted(impl))
        b = open(src).read().splitlines(keepends=True)
        li = max((i for i, l in enumerate(b) if l.lstrip().startswith("#include")),
                 default=-1)
        open(src, "w").write("".join(b[:li + 1]) + "\n" + externs + "".join(b[li + 1:]))
    sh(f"rm -f src/{name}.o src/{name}.s")

    # Carve the EXACT gbadisasm fragment byte range (incl. .align padding the layout
    # accounts for), NOT funcmap jp+size which can be short -> would shift the ROM.
    if os.path.exists(gfrag):
        grow = open(gfrag).readline().strip().split("\t")
        fstart, fend = int(grow[0], 16), int(grow[1], 16)
    else:
        fstart, fend = jp & 0xFFFFFF, (jp + size) & 0xFFFFFF
    with open(FRAG, "a") as f:
        f.write(f"{fstart:06X}\t{fend:06X}\t"
                f"src/{name}.o(.text)\t{name} (sio cursor; masked-tier graduated)\n")
    for p in (asm, gfrag):
        if os.path.exists(p):
            os.remove(p)

    sh("make layout")
    sh(f"rm -f src/{name}.o")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        sh(f"rm -f src/{name}.o src/{name}.s")
        return "ok"

    for p, c in snap.items():
        if c is None:
            if os.path.exists(p):
                os.remove(p)
        else:
            open(p, "w").write(c)
    sh(f"rm -f src/{name}.o src/{name}.s")
    sh("make layout")
    reason = "make compare RED"
    m = re.search(r"undefined reference to `(\w+)'", mc.stdout)
    if m:
        reason = f"undef {m.group(1)}"
    m = re.search(r"multiple definition of `(\w+)'", mc.stdout)
    if m:
        reason = f"multidef {m.group(1)}"
    return f"skip:{reason}"


def main():
    fm = funcmap()
    grad, skip = [], []
    for name in sys.argv[1:]:
        if name not in fm:
            skip.append((name, "not in funcmap"))
            continue
        jp, size = fm[name]
        r = grad_one(name, jp, size)
        if r == "ok":
            grad.append(name)
            print(f"[GRAD] {name}")
        else:
            skip.append((name, r[5:]))
            print(f"[skip] {name} {r[5:]}")
    print(f"\n=== graduated {len(grad)} / {len(sys.argv[1:])} ===")
    if grad:
        print("GRADUATED: " + ", ".join(grad))
        print(f"FRAGMENT: {FRAG} ({len(grad)} rows)")
    elif os.path.exists(FRAG) and os.path.getsize(FRAG) == 0:
        os.remove(FRAG)
    if skip:
        print("SKIPPED: " + "; ".join(f"{n}({r})" for n, r in skip))


if __name__ == "__main__":
    main()
