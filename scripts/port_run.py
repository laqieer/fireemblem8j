#!/usr/bin/env python3
"""Port the largest matching run of a US translation unit (decision D1).

Pipeline: locate_funcs -> pick the largest run -> extract_run into src/<name>.c
(subset of just that run's functions) -> compile -> resolve every external ref at
the run's known JP base (data literals + decoded BL targets + EWRAM_DATA
placement) -> apply manifest rows (deduped) -> make layout -> make compare.
Reverts surgically if the build isn't byte-perfect. Region-different functions
and other runs stay in the incbin baseline.

Usage: scripts/port_run.py <name> [<name> ...]
"""
import subprocess, sys, os, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u/src"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def have_syms():
    return {l.split("\t")[0] for l in open("layout/baseline_syms.tsv")
            if l.strip() and not l.startswith("#")}


def carved_objs():
    return {m.group(1) for m in (re.search(r"(src/\S+\.o)\(", l) for l in open("layout/carved_rom.tsv")) if m}


def port(name):
    if f"src/{name}.o" in carved_objs():
        print(f"{name}: already has a carved run — skipping"); return False
    # Verified runs only (D2): each block byte-matches the JP ROM at its base.
    out = sh(f"python3 scripts/find_runs.py {name}").stdout
    runs = [(l.split()[0], l.split()[1], l.split()[2].split(","))
            for l in out.splitlines() if l.strip()]
    if not runs:
        print(f"{name}: no verified runs"); return False
    start, end, funcs = max(runs, key=lambda r: len(r[2]))
    base = int(start, 16) - 0x08000000  # ROM-file offset (for indexing baserom)

    MANI = ["layout/carved_rom.tsv", "layout/carved_ram.tsv", "layout/baseline_syms.tsv"]
    snap = {p: open(p).read() for p in MANI}

    sub = sh(f"python3 scripts/extract_run.py {US}/{name}.c {' '.join(funcs)}").stdout
    open(f"src/{name}.c", "w").write(sub)
    sh(f"make src/{name}.o")
    obj = f"src/{name}.o"
    if not os.path.exists(obj):
        print(f"{name}: subset compile failed"); os.remove(f"src/{name}.c"); return False

    # Drop file-scope data the run doesn't reference (the whole header is pulled
    # in, but unreferenced globals/arrays — e.g. proc scripts — would need
    # placement we can't resolve). A data symbol with no .text relocation is unused.
    def data_syms_and_refs():
        ds = {}
        for l in sh(f"arm-none-eabi-objdump -t {obj}").stdout.splitlines():
            p = l.split()
            if len(p) >= 5 and p[0][0] in "0123456789abcdef" and p[-3] in (".data", ".rodata", "ewram_data") and not p[-1].startswith(".") and p[-1] != p[-3]:
                ds[p[-1]] = p[-3]
        refd = set()
        sec = None
        for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
            if "RELOCATION RECORDS FOR [" in l: sec = l.split("[")[1].split("]")[0]
            elif sec == ".text":
                p = l.split()
                if len(p) >= 3 and not p[2].startswith("."): refd.add(p[2])
        return ds, refd

    def remove_def(text, sym):
        i = text.find(sym)
        while i != -1:
            after = text[i+len(sym):i+len(sym)+40].lstrip()
            if after[:1] in ("[", "=", ";"):
                cands = [text.rfind(";", 0, i), text.rfind("}", 0, i), text.rfind("\n\n", 0, i)]
                cut = max(cands)
                start = cut + (2 if text[cut:cut+2] == "\n\n" else 1) if cut >= 0 else 0
                j, depth = i + len(sym), 0
                while j < len(text):
                    if text[j] == "{": depth += 1
                    elif text[j] == "}": depth -= 1
                    elif text[j] == ";" and depth == 0:
                        return text[:start] + text[j+1:]
                    j += 1
            i = text.find(sym, i + 1)
        return text

    ds, refd = data_syms_and_refs()
    # A static referenced via its SECTION symbol (e.g. EWRAM_DATA `Table[i]` ->
    # ewram_data+offset) won't appear in .text relocs by name, so also keep any
    # symbol whose name is used (>1 occurrence = definition + at least one use)
    # in the run source. Only definition-only symbols are truly unreferenced.
    src = open(f"src/{name}.c").read()
    unref = [s for s in ds if s not in refd and len(re.findall(r"\b" + re.escape(s) + r"\b", src)) <= 1]
    if unref:
        for s in unref:
            src = remove_def(src, s)
        open(f"src/{name}.c", "w").write(src)
        sh(f"rm -f {obj}"); sh(f"make src/{name}.o")
        if not os.path.exists(obj):
            print(f"{name}: compile failed after trimming {unref}"); os.remove(f"src/{name}.c"); return False

    jp = open("baserom.gba", "rb").read()
    fmap = {}
    for l in open("layout/us_jp_funcmap.tsv"):
        if not l.startswith("#"):
            c = l.split("\t"); fmap[c[4].strip()] = int(c[0], 16)

    def bl(o):
        h1 = jp[base+o] | (jp[base+o+1] << 8); h2 = jp[base+o+2] | (jp[base+o+3] << 8)
        v = ((h1 & 0x7ff) << 12) | ((h2 & 0x7ff) << 1)
        return 0x08000000 + base + o + 4 + (v - 0x800000 if v & 0x400000 else v)

    # symbol -> section (for EWRAM_DATA/.bss placement)
    sym_sec = {}
    for l in sh(f"arm-none-eabi-objdump -t {obj}").stdout.splitlines():
        p = l.split()
        if len(p) >= 5 and p[0][0] in "0123456789abcdef":
            sym_sec[p[-1]] = (p[-3], int(p[0], 16))
    undef = set(sh(f"arm-none-eabi-nm -u {obj}").stdout.split()) - {"U"}

    secsize = {}
    for l in sh(f"arm-none-eabi-size -A {obj}").stdout.splitlines():
        p = l.split()
        if len(p) == 3 and p[1].isdigit():
            secsize[p[0]] = int(p[1])
    otext = subprocess.run(["arm-none-eabi-objcopy", "-O", "binary", "-j", ".text", obj, "/dev/stdout"],
                           capture_output=True).stdout  # subset .text (addends live here pre-link)

    def enc(v):  # exact JP pointer value -> (addr, type) for gen_layout
        return (v & ~1, "thumb") if v & 1 else (v, "data")

    new_syms, ram, romdata = {}, {}, {}
    sec = None
    for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
        if "RELOCATION RECORDS FOR [" in l:
            sec = l.split("[")[1].split("]")[0]; continue
        p = l.split()
        if sec != ".text" or len(p) < 3 or not all(ch in "0123456789abcdef" for ch in p[0]):
            continue
        off, typ, sym = int(p[0], 16), p[1], p[2]
        # ROM data referenced via the section symbol (.rodata/.data + addend) —
        # the addend (offset into the section) is the pre-link value in our .text.
        if typ == "R_ARM_ABS32" and sym in (".rodata", ".data"):
            addend = int.from_bytes(otext[off:off+4], "little")
            romdata.setdefault(sym, int.from_bytes(jp[base+off:base+off+4], "little") - addend)
            continue
        if sym.startswith("."):
            continue
        ss = sym_sec.get(sym)
        if ss and ss[0] in ("ewram_data", ".bss", "bss", "sbss", "*COM*"):
            ram.setdefault(ss[0], int.from_bytes(jp[base+off:base+off+4], "little") - ss[1])
        elif typ == "R_ARM_ABS32" and ss and ss[0] in (".data", ".rodata"):
            # a ROM data section the run references via a named symbol
            romdata.setdefault(ss[0], int.from_bytes(jp[base+off:base+off+4], "little") - ss[1])
        elif typ == "R_ARM_ABS32" and sym in undef:
            new_syms[sym] = enc(int.from_bytes(jp[base+off:base+off+4], "little"))
        elif typ == "R_ARM_THM_CALL" and sym in undef:
            new_syms[sym] = (fmap.get(sym) or (bl(off) & ~1), "thumb")

    # resolve internal pointer relocations of each carved ROM data section
    data_carves = []
    for dsec, dbase in romdata.items():
        size = secsize.get(dsec, 0)
        if not size:
            continue
        data_carves.append((dbase - 0x08000000, size, dsec))
        cur = None
        for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
            if "RELOCATION RECORDS FOR [" in l:
                cur = l.split("[")[1].split("]")[0]; continue
            p = l.split()
            if cur != dsec or len(p) < 3 or not all(ch in "0123456789abcdef" for ch in p[0]):
                continue
            off, typ, sym = int(p[0], 16), p[1], p[2]
            if typ == "R_ARM_ABS32" and sym in undef:
                new_syms.setdefault(sym, enc(int.from_bytes(
                    jp[dbase - 0x08000000 + off:dbase - 0x08000000 + off + 4], "little")))

    have = have_syms()
    with open("layout/carved_rom.tsv", "a") as f:
        f.write(f"{base&0xFFFFFF:06X}\t{int(end,16)&0xFFFFFF:06X}\tsrc/{name}.o(.text)\t{name}(run): {', '.join(funcs[:3])}{'...' if len(funcs)>3 else ''}\n")
        for dbase, size, dsec in data_carves:
            f.write(f"{dbase:06X}\t{dbase+size:06X}\tsrc/{name}.o({dsec})\t{name} {dsec}\n")
    if ram:
        b = min(ram.values()); region = "iwram" if (b >> 24) == 3 else "ewram"
        specs = " ".join(f"src/{name}.o({s})" for s in ram)
        with open("layout/carved_ram.tsv", "a") as f:
            f.write(f"{b:08X}\t{region}\t{specs}\t{name}\n")
    adds = [f"{s}\t{a:08X}\t{t}\t{name}" for s, (a, t) in new_syms.items() if s not in have]
    if adds:
        with open("layout/baseline_syms.tsv", "a") as f:
            f.write("\n".join(adds) + "\n")

    sh("make layout"); sh("make clean")
    if "fireemblem8.gba: OK" in sh("make compare").stdout:
        print(f"{name}: OK — run {start}..{end} ({len(funcs)} fns, {len(adds)} new syms{', +ram' if ram else ''})")
        return True

    # Fallback: raw-hex message-id tables (US `{0x534,0x510,...}` not yet MSG_*)
    # are region-different data. Remap in-source ids to JP per layout/msg_map.tsv
    # and retry; the verify-or-revert net keeps any bad remap from landing.
    import re as _re
    mm = {}
    for l in open("layout/msg_map.tsv"):
        if not l.startswith("#"):
            u, j = (int(x, 16) for x in l.split("\t")[:2])
            if u != j: mm[u] = j
    # Also remap raw-hex ADDRESS literals (hardcoded US pointers in the source —
    # graphics/window/data tables) to their JP address via addr_map. Only entries
    # that actually moved; msg_map wins ties. Verify-or-revert keeps bad remaps out.
    for l in open("layout/addr_map.tsv"):
        if not l.startswith("#"):
            u, j = (int(x, 16) for x in l.split("\t")[:2])
            if u != j: mm.setdefault(u, j)
    src = open(f"src/{name}.c").read()
    new = _re.sub(r"0x[0-9A-Fa-f]+",
                  lambda m: f"0x{mm[int(m.group(0),16)]:X}" if int(m.group(0), 16) in mm else m.group(0),
                  src)
    if new != src:
        open(f"src/{name}.c", "w").write(new)
        sh("make clean")
        if "fireemblem8.gba: OK" in sh("make compare").stdout:
            print(f"{name}: OK (msg-id remapped) — run {start}..{end} ({len(funcs)} fns)")
            return True

    print(f"{name}: FAILED make compare — reverting")
    if os.environ.get("PORTRUN_DEBUG"):
        sh("make fireemblem8.gba")
    if os.environ.get("PORTRUN_DEBUG") and os.path.exists("fireemblem8.gba"):
        b = open("fireemblem8.gba", "rb").read()
        d = [i for i in range(min(len(b), len(jp))) if b[i] != jp[i]]
        if d:
            print(f"  diff: {len(d)} bytes, first @ {d[0]:#x} (run .text {0x08000000+base:#x}..{end}; "
                  f"romdata {[(hex(0x08000000+x),hex(s)) for x,s,_ in data_carves]})")
    for p, c in snap.items():
        open(p, "w").write(c)
    os.remove(f"src/{name}.c"); sh("make layout")
    return False


if __name__ == "__main__":
    ok = sum(port(n) for n in sys.argv[1:])
    sh("make clean")
    print(f"\nported {ok}/{len(sys.argv)-1} runs; build "
          + ("GREEN" if "OK" in sh("make compare").stdout else "RED"))
