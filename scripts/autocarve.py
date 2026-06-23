#!/usr/bin/env python3
"""autocarve.py <FunctionName> [<FunctionName> ...]

Mechanical carve harness for the 0-alias jp_syms vein. For each candidate:
  1. carve_recipe -> range + US file + US includes + US body
  2. write src/<F>.c = (US includes that EXIST in fe8j include/) + US body
  3. wire layout: git rm asm/sub_<addr>.s + gbadisasm tsv; add handdecomp carved_rom row + drop row
  4. gen_layout; build; if compile-fail -> REVERT (report COMPILE)
  5. build ROM; byte-diff the function's range:
        0           -> MATCH   (keep)
        1..8        -> NEARMISS (keep, print diffing bytes for const-diff/reg-alloc triage)
        >8          -> REGIONDIFF (revert)
Each candidate is carved+built ALONE (no batch layout-shift false-negative).
NOT a git op; caller stages/commits the survivors. make compare is the oracle.
"""
import sys, os, re, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)


def sh(cmd):
    return subprocess.run(cmd, shell=True, capture_output=True, text=True).stdout


def recipe(name):
    out = subprocess.run([sys.executable, "scripts/carve_recipe.py", name],
                         capture_output=True, text=True).stdout
    if "!!" in out and "not in baseline" in out:
        return None
    rng = re.search(r"carve range:\s*([0-9A-Fa-f]+)\s+([0-9A-Fa-f]+)", out)
    inc = re.search(r"US includes:\s*(.*)", out)
    body = re.search(r"---- US body ----\n(.*?)\n---- JP", out, re.S)
    de = re.search(r"DEAD-END pre-screen.*?:\s*(\w+)", out)
    if not (rng and body) or "(def body not extracted" in (body.group(1) if body else ""):
        return None
    incs = re.findall(r'#include "([^"]+)"', inc.group(1)) if inc else []
    return {
        "start": rng.group(1).upper(), "end": rng.group(2).upper(),
        "includes": incs, "body": body.group(1),
        "deadend": (de.group(1) if de else "no") == "YES",
    }


def addr_of(name):
    out = subprocess.run([sys.executable, "scripts/carve_recipe.py", name],
                         capture_output=True, text=True).stdout
    m = re.search(r"\(sub_([0-9A-Fa-f]+)\)", out)
    return m.group(1).upper() if m else None


def existing_includes(incs):
    keep = []
    for h in incs:
        if h.startswith("src/") or h.startswith("constants/"):
            # constants/ live under include/constants -- keep if present
            if h.startswith("constants/") and os.path.exists(f"include/{h}"):
                keep.append(h)
            continue
        if os.path.exists(f"include/{h}"):
            keep.append(h)
    # always lead with global.h
    if "global.h" not in keep:
        keep.insert(0, "global.h")
    # de-dup preserving order
    seen, out = set(), []
    for h in keep:
        if h not in seen:
            seen.add(h); out.append(h)
    return out


def carve(name, r, addr):
    src = f"src/{name}.c"
    with open(src, "w") as f:
        for h in existing_includes(r["includes"]):
            f.write(f'#include "{h}"\n')
        f.write("\n" + r["body"].rstrip() + "\n")
    sh(f"git rm -q asm/sub_{addr}.s layout/carved_rom.d/gbadisasm_sub_{addr}.tsv 2>/dev/null")
    with open(f"layout/carved_rom.d/handdecomp_{name}.tsv", "w") as f:
        f.write(f"{r['start']}\t{r['end']}\tsrc/{name}.o(.text)\thanddecomp: {name} (autocarve)\n")
    with open(f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv", "w") as f:
        f.write(name + "\n")


def revert(name, addr):
    sh(f"git checkout HEAD -- asm/sub_{addr}.s layout/carved_rom.d/gbadisasm_sub_{addr}.tsv 2>/dev/null")
    for p in (f"src/{name}.c", f"src/{name}.o",
              f"layout/carved_rom.d/handdecomp_{name}.tsv",
              f"layout/baseline_syms_drop.d/handdecomp_{name}.tsv"):
        if os.path.exists(p):
            os.remove(p)


def diff_range(start, end):
    s, e = int(start, 16), int(end, 16)
    mine = open("fireemblem8.gba", "rb").read()
    base = open("baserom.gba", "rb").read()
    bad = [i for i in range(s, e) if mine[i] != base[i]]
    return bad, e - s


def defined_syms():
    """All symbols DEFINED by the current (last-built) ELF — used to skip the slow
    relink for candidates whose undefined refs won't resolve (LINK-fail)."""
    s = set()
    for ln in sh("arm-none-eabi-nm fireemblem8.elf 2>/dev/null").splitlines():
        p = ln.split()
        if len(p) >= 3 and p[1] not in ("U", "u", "w", "v"):
            s.add(p[2])
    return s


def main():
    names = sys.argv[1:]
    results = []
    DEFINED = defined_syms()  # parse once; fast LINK-fail pre-filter
    for name in names:
        r = recipe(name)
        if not r:
            print(f"[skip ] {name}: no clean US body/range"); continue
        if r["deadend"] and not os.environ.get("AUTOCARVE_NODEADEND"):
            print(f"[skip ] {name}: DEAD-END pre-screen (sign-ext)"); continue
        addr = addr_of(name)
        if not addr:
            print(f"[skip ] {name}: no sub addr"); continue
        carve(name, r, addr)
        # FAST PRE-FILTER (no full relink): compile just this .o, then check its
        # undefined symbols all resolve in the last build. Skips the ~60s ROM relink
        # for COMPILE/LINK fails (typically ~half a batch).
        sh(f"rm -f src/{name}.o; make src/{name}.o >/dev/null 2>&1")
        nm = sh(f"arm-none-eabi-nm src/{name}.o 2>/dev/null | grep -E ' (T|t) {name}'")
        if not nm.strip():
            print(f"[COMPILE] {name}: did not compile -> revert")
            revert(name, addr)
            results.append((name, "COMPILE")); continue
        und = [ln.split()[-1] for ln in sh(f"arm-none-eabi-nm -u src/{name}.o 2>/dev/null").splitlines() if ln.strip()]
        missing = [u for u in und if u not in DEFINED]
        if missing:
            print(f"[LINK ] {name}: unresolved {missing[:4]} -> revert")
            revert(name, addr)
            results.append((name, "LINK")); continue
        # passers only: now do the slow relink + byte-diff
        subprocess.run([sys.executable, "scripts/gen_layout.py"], capture_output=True)
        sh("rm -f fireemblem8.gba; make -k >/dev/null 2>&1")
        if not os.path.exists("fireemblem8.gba"):
            print(f"[LINK ] {name}: ROM did not build -> revert")
            revert(name, addr)
            subprocess.run([sys.executable, "scripts/gen_layout.py"], capture_output=True)
            results.append((name, "LINK")); continue
        bad, size = diff_range(r["start"], r["end"])
        n = len(bad)
        if n == 0:
            print(f"[MATCH] {name}: 0/{size}  KEEP")
            results.append((name, "MATCH"))
        elif n <= 8:
            head = bad[0]
            mine = open("fireemblem8.gba", "rb").read(); base = open("baserom.gba", "rb").read()
            ctx = " ".join(f"{i-int(r['start'],16):#x}:{mine[i]:#04x}->{base[i]:#04x}" for i in bad[:6])
            print(f"[NEAR ] {name}: {n}/{size}  KEEP+FLAG (const/reg-alloc?) {ctx}")
            results.append((name, f"NEAR{n}"))
        else:
            print(f"[REGION] {name}: {n}/{size} -> revert")
            revert(name, addr)
            subprocess.run([sys.executable, "scripts/gen_layout.py"], capture_output=True)
            results.append((name, "REGION"))
    sh("rm -f fireemblem8.gba; make compare >/dev/null 2>&1")
    keep = [n for n, s in results if s == "MATCH" or s.startswith("NEAR")]
    print("\n=== SUMMARY ===")
    print("MATCH/NEAR kept:", ", ".join(keep) if keep else "(none)")
    print("reverted:", ", ".join(n for n, s in results if s in ("COMPILE", "REGION", "LINK")) or "(none)")


if __name__ == "__main__":
    main()
