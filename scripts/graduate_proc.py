#!/usr/bin/env python3
"""Graduate proc-accessor functions (the ProcScr-naming lever, automated).

Many small region-different functions are pure proc-script accessors: their only
bl targets are Proc_* (Find/End/EndEach/Start*/Goto) and they reference ONE proc
script / proc-pointer global by a fixed JP address. The blocker is that the data
symbol (ProcScr_*/gProcScr_*/gpProc*) isn't named at the JP address. Name it (a
byte-neutral label) and the function's US body compiles byte-exact (the bl + .word
resolve at link). Each carve advances BOTH axes (function -> matching-C, script ->
named).

Per candidate: extract_func_only the US body (drops file-scope data, keeps
includes), parse the proc-script symbol it references, map it to the asm literal
address, add it to baseline_syms, declare it `extern struct ProcCmd S[]` (or use
the US extern). Then wire-all -> build-once -> byte-check -> revert mismatches
(also unwinding the names of reverted funcs). make compare is the oracle.

Usage:
  scripts/graduate_proc.py --list
  scripts/graduate_proc.py [--max-bytes B] [--limit N]
"""
import re, os, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
FRAG = "layout/carved_rom.d/graduate_proc.tsv"
SYMS = "layout/baseline_syms.tsv"
PROC_CALLS = ("Proc_Find", "Proc_End", "Proc_EndEach", "Proc_Start",
              "Proc_StartBlocking", "Proc_Goto", "Proc_StartBlockingHeader")


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def jp_alias():
    a = {}
    for ln in open("asm/jp_syms.s"):
        m = re.search(r"\.set\s+(\w+),\s*0x([0-9A-Fa-f]+)\s*\+\s*1", ln)
        if m:
            a[int(m.group(2), 16)] = m.group(1)
    return a


def us_def(name):
    """(file, full-body-text) of the US function definition, or (None,None)."""
    r = sh(f'grep -rlE "^[A-Za-z].*\\b{name}\\b\\s*\\(" {US}/src/*.c')
    uf = r.stdout.split("\n")[0]
    if not uf:
        return None, None
    out, started, depth = [], False, 0
    for ln in open(uf):
        if not started and re.match(rf"^[A-Za-z].*\b{name}\b\s*\(", ln):
            started = True
        if started:
            out.append(ln.rstrip())
            depth += ln.count("{") - ln.count("}")
            if "{" in "".join(out) and depth <= 0:
                break
    return uf, "\n".join(out)


def candidates(maxb):
    alias = jp_alias()
    out = []
    for frag in sorted(glob.glob("layout/carved_rom.d/gbadisasm_*.tsv")):
        L = open(frag).read().splitlines()
        if len(L) != 1:
            continue
        p = L[0].split("\t")
        if len(p) < 3:
            continue
        try:
            a, b = int(p[0], 16), int(p[1], 16)
        except ValueError:
            continue
        if (b - a) > maxb:
            continue
        nm = alias.get(0x08000000 + a)
        om = re.search(r"(asm/\w+)", p[2])
        if not nm or not om:
            continue
        asm = open(om.group(1) + ".s").read()
        bls = re.findall(r"bl (\w+)", asm)
        if not bls or any(not x.startswith("Proc_") for x in bls):
            continue
        addrs = re.findall(r"=0x([0-9A-Fa-f]+)", asm)
        # the proc-script/global literal(s): ROM (08xxxxxx) or EWRAM (0201/0203)
        scrs = [int(x, 16) for x in addrs]
        if not scrs:
            continue
        out.append((p[0], p[1], nm, frag, om.group(1) + ".s", scrs))
    out.sort(key=lambda r: int(r[1], 16) - int(r[0], 16))
    return out


def proc_symbol(body):
    """The proc-script/global symbol the US body looks up (first Proc_* lookup arg
    that is a global identifier, not a local/number)."""
    for call in ("Proc_Find", "Proc_EndEach", "Proc_End", "Proc_StartBlocking",
                 "Proc_Start", "Proc_StartBlockingHeader"):
        m = re.search(rf"{call}\(\s*([A-Za-z_]\w*)", body)
        if m and m.group(1) not in ("proc", "parent", "NULL"):
            return m.group(1)
    return None


_DEFINED = None
def named_addr(sym):
    """Address a symbol is ALREADY defined at (baseline_syms or jp_syms), else None."""
    global _DEFINED
    if _DEFINED is None:
        _DEFINED = {}
        for ln in open(SYMS):
            c = ln.split("\t")
            if len(c) >= 2:
                try:
                    _DEFINED[c[0]] = int(c[1], 16)
                except ValueError:
                    pass
        for ln in open("asm/jp_syms.s"):
            m = re.search(r"\.set\s+(\w+),\s*0x([0-9A-Fa-f]+)", ln)
            if m:
                _DEFINED.setdefault(m.group(1), int(m.group(2), 16))
    return _DEFINED.get(sym)


def main():
    args = sys.argv[1:]
    maxb = next((int(args[i + 1]) for i, a in enumerate(args) if a == "--max-bytes"), 60)
    limit = next((int(args[i + 1]) for i, a in enumerate(args) if a == "--limit"), None)
    cands = candidates(maxb)
    if limit:
        cands = cands[:limit]
    plan = []
    for a0, a1, nm, frag, asmf, scrs in cands:
        uf, body = us_def(nm)
        if not body or body.count(";") > 5:
            continue
        sym = proc_symbol(body)
        if not sym:
            continue
        # the script address: prefer the ROM-region literal (08xxxxxx)
        rom = [s for s in scrs if 0x08000000 <= s < 0x09000000]
        ew = [s for s in scrs if 0x02000000 <= s < 0x04000000]
        addr = (rom or ew or scrs)[0]
        existing = named_addr(sym)
        if existing is not None and existing != addr:
            continue   # symbol already placed elsewhere -> skip (avoid conflict)
        plan.append((a0, a1, nm, frag, asmf, sym, addr, uf, body))
    print(f"proc-accessor candidates (<= {maxb}B): {len(plan)}")
    if "--list" in args:
        for a0, a1, nm, frag, asmf, sym, addr, uf, body in plan:
            print(f"  {nm:32s} {sym}@{addr:08X} ({os.path.basename(uf)})")
        return
    if not os.path.exists(FRAG):
        open(FRAG, "w").close()
    added_syms, wired = [], []
    for a0, a1, nm, frag, asmf, sym, addr, uf, body in plan:
        # 1) name the script (if not already)
        if named_addr(sym) is None:
            with open(SYMS, "a") as f:
                f.write(f"{sym}\t{addr:08X}\tdata\tproc script ({nm})\n")
            added_syms.append(sym)
        # 2) C = extract_func_only US body + extern decl for the script
        c = sh(f'python3 scripts/extract_func_only.py "{uf}" "{nm}"').stdout
        if nm not in c:
            continue
        if sym not in c.split("\n", 1)[0] and f"{sym}[" not in c:
            c = c.replace('#include "global.h"',
                          f'#include "global.h"\nextern struct ProcCmd {sym}[];', 1)
        open(f"src/{nm}.c", "w").write(c)
        if os.path.exists(f"src/{nm}.o"):
            os.remove(f"src/{nm}.o")
        sh(f"make src/{nm}.o")
        if not os.path.exists(f"src/{nm}.o"):
            os.remove(f"src/{nm}.c")
            continue
        # pure-.text only: extra sections (.data/.rodata/.bss) place bytes OUTSIDE
        # the checked [a0,a1) range, so the all-wired byte-check would miss that diff.
        if any(re.search(r"\s(\.(?:data|rodata|bss)\S*)\s+([0-9a-f]+)", ln) and
               int(re.search(r"\s\.(?:data|rodata|bss)\S*\s+([0-9a-f]+)", ln).group(1), 16) > 0
               for ln in sh(f"arm-none-eabi-objdump -h src/{nm}.o").stdout.splitlines()):
            os.remove(f"src/{nm}.o"); os.remove(f"src/{nm}.c")
            continue
        with open(FRAG, "a") as f:
            f.write(f"{a0}\t{a1}\tsrc/{nm}.o(.text)\tgraduate_proc(run): {nm}\n")
        open(f"layout/baseline_syms_drop.d/graduate_proc_{nm}.tsv", "w").write(nm + "\n")
        sh(f'git rm -q "{frag}" "{asmf}"')
        wired.append((a0, a1, nm, frag, asmf, sym))
    print(f"compiled+wired: {len(wired)}")
    if not wired:
        return
    # build once, byte-check, revert mismatches
    r = sh("make fireemblem8.gba 2>&1")
    if not os.path.exists("fireemblem8.gba") or "Error" in (r.stdout + r.stderr).split("fireemblem8.gba", 1)[-1][:200]:
        print("build failed; reverting all")
        revert_all(wired, added_syms)
        return
    rom = open("fireemblem8.gba", "rb").read()
    base = open("baserom.gba", "rb").read()
    kept = 0
    for a0, a1, nm, frag, asmf, sym in list(wired):
        o, e = int(a0, 16), int(a1, 16)
        if rom[o:e] == base[o:e]:
            kept += 1
        else:
            unwire(nm, frag, asmf)
            wired.remove((a0, a1, nm, frag, asmf, sym))
    print(f"byte-check: kept {kept}, reverted {len(plan)-kept if False else ''}")
    if sh("make compare").stdout.find("fireemblem8.gba: OK") < 0 and \
       "fireemblem8.gba: OK" not in sh("make compare").stderr:
        print("make compare FAILED after byte-check; reverting all")
        revert_all(wired, added_syms)
        return
    print(f"DONE: graduated {kept}. COLD-verify + commit.")


def unwire(nm, frag, asmf):
    lines = [l for l in open(FRAG) if f"(run): {nm}\n" != l[-(len(nm) + 8):]]
    open(FRAG, "w").writelines(lines)
    for pth in (f"src/{nm}.c", f"src/{nm}.o", f"layout/baseline_syms_drop.d/graduate_proc_{nm}.tsv"):
        if os.path.exists(pth):
            os.remove(pth)
    sh(f'git checkout HEAD -- "{frag}" "{asmf}"')


def revert_all(wired, added_syms):
    for a0, a1, nm, frag, asmf, sym in wired:
        unwire(nm, frag, asmf)
    # remove the proc-script names we added
    if added_syms:
        keep = [l for l in open(SYMS) if l.split("\t")[0] not in added_syms]
        open(SYMS, "w").writelines(keep)


if __name__ == "__main__":
    main()
