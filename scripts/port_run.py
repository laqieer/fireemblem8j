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


def port(name, exclude=(), runs=None):
    if f"src/{name}.o" in carved_objs():
        print(f"{name}: already has a carved run — skipping"); return False
    # Verified runs only (D2): each block byte-matches the JP ROM at its base.
    # `runs` may be pre-computed (e.g. by a parallel discovery pass — see
    # scripts/harvest_parallel.py) to skip the expensive find_runs here; otherwise
    # compute it once and reuse it across the largest-first fallback recursion.
    if runs is None:
        out = sh(f"python3 scripts/find_runs.py {name}").stdout
        runs = [(l.split()[0], l.split()[1], l.split()[2].split(","))
                for l in out.splitlines() if l.strip()]
    # Try runs largest-first; if a run masked-matches but can't be made byte-perfect
    # in the full build (e.g. it touches region-different EWRAM/data layout), fall
    # back to the next-largest verified run instead of abandoning the whole TU.
    # `exclude` carries the runs already tried-and-reverted this call chain.
    cand = [r for r in runs if tuple(r[2]) not in exclude]
    if not cand:
        if not exclude: print(f"{name}: no verified runs")
        return False
    start, end, funcs = max(cand, key=lambda r: len(r[2]))
    base = int(start, 16) - 0x08000000  # ROM-file offset (for indexing baserom)

    MANI = ["layout/carved_rom.tsv", "layout/carved_ram.tsv", "layout/baseline_syms.tsv"]
    snap = {p: open(p).read() for p in MANI}

    sub = sh(f"python3 scripts/extract_run.py {US}/{name}.c {' '.join(funcs)}").stdout
    open(f"src/{name}.c", "w").write(sub)
    obj = f"src/{name}.o"
    r = sh(f"make src/{name}.o")
    if not os.path.exists(obj):
        # Cross-TU callees with no prototype (defined in another TU, not in a
        # header) trip agbcc's -Wimplicit -Werror. Add a K&R extern for each
        # "implicit declaration of function X" and retry: the call's codegen
        # doesn't depend on the prototype (args are pushed per the call site), so
        # the .text bytes are unchanged; verify-or-revert guards anything wrong.
        impl = set(re.findall(r"implicit declaration of function [`'\"]?(\w+)", r.stderr + r.stdout))
        if impl:
            # Two kinds of implicit-decl: (1) a callee defined in ANOTHER TU -> a K&R
            # `extern int X()` at the top is enough (codegen is call-site only). (2) a
            # function defined LATER in THIS subset (forward reference, e.g. GmDataInit
            # calls GmPathsInit defined below) -> `extern int X()` would clash with the
            # real non-int return type, so emit the REAL prototype from the US source,
            # placed AFTER the #includes (it may reference header struct types).
            us_src = open(f"{US}/{name}.c").read()
            runset = set(funcs)
            externs, protos = [], []
            for f in sorted(impl):
                m = re.search(r"\n([A-Za-z_][\w \t\*\n]*?\b" + re.escape(f) + r"\s*\([^;{]*\))\s*\{", us_src)
                if f in runset and m:
                    protos.append(re.sub(r"\s+", " ", m.group(1).strip()) + ";")
                else:
                    externs.append(f"extern int {f}();")
            new = "".join(e + "\n" for e in externs) + sub
            if protos:
                ls = new.splitlines(keepends=True)
                li = max((i for i, l in enumerate(ls) if l.lstrip().startswith("#include")), default=len(externs) - 1)
                new = "".join(ls[:li+1]) + "\n" + "\n".join(protos) + "\n" + "".join(ls[li+1:])
            open(f"src/{name}.c", "w").write(new)
            sh(f"make src/{name}.o")
        if not os.path.exists(obj):
            print(f"{name}: subset compile failed"); os.remove(f"src/{name}.c"); return False

    # Drop file-scope data the run doesn't reference (the whole header is pulled
    # in, but unreferenced globals/arrays — e.g. proc scripts — would need
    # placement we can't resolve). A data symbol with no .text relocation is unused.
    # Loadable data sections whose UNREFERENCED file-scope globals must be trimmed
    # from the subset, else they're appended to the ROM and grow it (sha1 fails even
    # when .text is byte-perfect). EWRAM_OVERLAY sections (`ewram_overlay_N`) count:
    # extracting a few funcs still pulls in the file's overlay tables (e.g.
    # prep_unitselect's 0xB0 gPrepUnitTexts), and the run rarely references them.
    def is_trim_sec(s):
        return s in (".data", ".rodata", "ewram_data", ".bss", "bss", "sbss") or s.startswith("ewram_overlay")

    def data_syms_and_refs():
        ds = {}
        for l in sh(f"arm-none-eabi-objdump -t {obj}").stdout.splitlines():
            p = l.split()
            if len(p) >= 5 and p[0][0] in "0123456789abcdef" and is_trim_sec(p[-3]) and not p[-1].startswith(".") and p[-1] != p[-3]:
                ds[p[-1]] = p[-3]
        refd, refd_secs = set(), set()
        sec = None
        for l in sh(f"arm-none-eabi-objdump -r {obj}").stdout.splitlines():
            if "RELOCATION RECORDS FOR [" in l: sec = l.split("[")[1].split("]")[0]
            elif sec == ".text":
                p = l.split()
                if len(p) >= 3:
                    (refd_secs if p[2].startswith(".") else refd).add(p[2])
        return ds, refd, refd_secs

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

    ds, refd, refd_secs = data_syms_and_refs()
    # Drop a file-scope data symbol when its ENTIRE section is unreferenced by the
    # run's .text -- i.e. not named in a .text reloc AND no .text reloc targets its
    # section symbol. The section test (not the old name-occurrence heuristic) is
    # correct: a static accessed via its SECTION symbol (EWRAM_DATA `Table[i]` ->
    # ewram_data+off) keeps its section in refd_secs and is preserved, while a
    # dead self-referential table the run never touches (e.g. worldmap_status_ui's
    # 252-byte gHelpInfo help-box table, named 26x but with no .text ref) is
    # removed -- so its unresolved function pointers can't break the link. A
    # symbol in a referenced (carved) section is always kept, so carved data is
    # never altered; the verify-or-revert net guards anything this misjudges.
    src = open(f"src/{name}.c").read()
    cand = [s for s in ds if s not in refd and ds[s] not in refd_secs]
    # Remove a candidate only if cutting its definition eliminates EVERY reference
    # to its name -- i.e. all references were inside the definition (a dead
    # self-referential table like gHelpInfo). If the name still appears, it's used
    # by kept code/data, so keep it; this never breaks compilation. Iterate to a
    # fixpoint so removing one dead table can expose another it was the sole user of.
    removed, changed = [], True
    while changed:
        changed = False
        for s in cand:
            if s in removed:
                continue
            trimmed = remove_def(src, s)
            if not re.search(r"\b" + re.escape(s) + r"\b", trimmed):
                src, changed = trimmed, True
                removed.append(s)
    if removed:
        base_src = open(f"src/{name}.c").read()  # pre-trim source, known to compile
        open(f"src/{name}.c", "w").write(src)
        sh(f"rm -f {obj}"); sh(f"make src/{name}.o")
        if not os.path.exists(obj):
            # The batch trim corrupted the source — remove_def is a heuristic textual
            # cut that can mishandle a complex declaration (nested braces / multi-dim
            # arrays), e.g. bmbattle's sWeaponTriangleRules. Fall back to incremental
            # trimming: remove one candidate at a time and KEEP a removal only if it
            # still compiles, so a bad cut is rejected instead of killing the carve.
            src = base_src
            for s in removed:
                trimmed = remove_def(src, s)
                if re.search(r"\b" + re.escape(s) + r"\b", trimmed):
                    continue  # still referenced after the cut -> keep the symbol
                open(f"src/{name}.c", "w").write(trimmed)
                sh(f"rm -f {obj}"); sh(f"make src/{name}.o")
                if os.path.exists(obj):
                    src = trimmed            # cut was clean -> accept
                else:
                    open(f"src/{name}.c", "w").write(src)  # cut corrupted -> reject
            sh(f"rm -f {obj}"); sh(f"make src/{name}.o")
            if not os.path.exists(obj):
                print(f"{name}: subset compile failed"); os.remove(f"src/{name}.c"); return False

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
        # RAM section referenced via its SECTION symbol (.bss/ewram_data + addend):
        # place the whole section at JP RAM addr (NOLOAD), like the named case.
        if typ == "R_ARM_ABS32" and sym in (".bss", "ewram_data", "sbss", "bss"):
            addend = int.from_bytes(otext[off:off+4], "little")
            ram.setdefault(sym, int.from_bytes(jp[base+off:base+off+4], "little") - addend)
            continue
        # ROM data referenced via the section symbol (.rodata/.data + addend) —
        # the addend (offset into the section) is the pre-link value in our .text.
        if typ == "R_ARM_ABS32" and sym in (".rodata", ".data"):
            addend = int.from_bytes(otext[off:off+4], "little")
            romdata.setdefault(sym, int.from_bytes(jp[base+off:base+off+4], "little") - addend)
            continue
        if sym.startswith("."):
            continue
        ss = sym_sec.get(sym)
        if typ == "R_ARM_ABS32" and ss and ss[0] == "*COM*":
            # COMMON globals are independent (no shared section base — ss[1] is the
            # alignment, not an offset), so block placement is wrong AND collides:
            # different TUs' IWRAM globals are INTERLEAVED in 0x0300xxxx, so a whole
            # .bss/COMMON block over-claims and overlaps another carved object's
            # block. Instead place each referenced COMMON global at its exact JP
            # address as an absolute symbol; the linker's weak common yields to the
            # absolute definition, so no NOLOAD block is allocated and nothing overlaps.
            addend = int.from_bytes(otext[off:off+4], "little")
            new_syms[sym] = enc(int.from_bytes(jp[base+off:base+off+4], "little") - addend)
        elif ss and ss[0] in ("ewram_data", ".bss", "bss", "sbss"):
            ram.setdefault(ss[0], int.from_bytes(jp[base+off:base+off+4], "little") - ss[1])
        elif typ == "R_ARM_ABS32" and ss and ss[0] in (".data", ".rodata"):
            # a ROM data section the run references via a named symbol
            romdata.setdefault(ss[0], int.from_bytes(jp[base+off:base+off+4], "little") - ss[1])
        elif typ == "R_ARM_ABS32" and sym in undef:
            # Subtract the in-section addend (pre-link word in our .text): a `.word
            # sym` references the symbol as `sym + addend` (e.g. `&gOam[0x100]` ->
            # addend 0x400). The JP literal is sym_base + addend, so the SYMBOL's
            # value is jp_literal - addend; the linker re-adds the addend at link
            # time. Without this, an extern indexed at a non-zero offset (region-
            # different RAM globals like gOam) lands `addend` bytes off. Multiple
            # refs to the same sym all yield the same base, so last-write is safe.
            addend = int.from_bytes(otext[off:off+4], "little")
            new_syms[sym] = enc(int.from_bytes(jp[base+off:base+off+4], "little") - addend)
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

    if os.environ.get("PORTRUN_DEBUG"):
        print(f"  [dbg {name} run {start}..{end}] new_syms=" +
              ", ".join(f"{s}={a:08X}/{t}" for s, (a, t) in sorted(new_syms.items())))
        print(f"  [dbg] ram={ {s: f'{b:08X}' for s, b in ram.items()} } "
              f"romdata={ {s: f'{b:08X}' for s, b in romdata.items()} } undef={sorted(undef)}")
    have = have_syms()
    with open("layout/carved_rom.tsv", "a") as f:
        f.write(f"{base&0xFFFFFF:06X}\t{int(end,16)&0xFFFFFF:06X}\tsrc/{name}.o(.text)\t{name}(run): {', '.join(funcs[:3])}{'...' if len(funcs)>3 else ''}\n")
        for dbase, size, dsec in data_carves:
            f.write(f"{dbase:06X}\t{dbase+size:06X}\tsrc/{name}.o({dsec})\t{name} {dsec}\n")
    if ram:
        with open("layout/carved_ram.tsv", "a") as f:
            for s, b in ram.items():  # each RAM section at its own JP base
                region = "iwram" if (b >> 24) == 3 else "ewram"
                f.write(f"{b:08X}\t{region}\tsrc/{name}.o({s})\t{name} {s}\n")
    adds = [f"{s}\t{a:08X}\t{t}\t{name}" for s, (a, t) in new_syms.items() if s not in have]
    if adds:
        with open("layout/baseline_syms.tsv", "a") as f:
            f.write("\n".join(adds) + "\n")

    # Incremental build (no `make clean`): only the new src/<name>.o, the shrunk
    # incbin (asm/baserom.o), and the relink rebuild — ~0.3s vs ~13s for a full
    # `make clean` recompile of every carved object. Verified byte-identical; the
    # make-compare verify-or-revert below is the safety net regardless.
    sh("make layout")
    mc = sh("make compare")
    if "fireemblem8.gba: OK" in mc.stdout:
        print(f"{name}: OK — run {start}..{end} ({len(funcs)} fns, {len(adds)} new syms{', +ram' if ram else ''})")
        return True

    # Multiple-definition retry: a symbol this run's object DEFINES (its own
    # functions/proc-scripts) or one it references that an ALREADY-carved object
    # defines is also emitted in jp_syms.s from baseline_syms.tsv -> jp_syms.o and
    # the object doubly-define it (link error). The carved object is the real
    # provider, so drop those redundant baseline rows and rebuild. jp_syms is only
    # an absolute alias; a wrong address from the object's own definition is still
    # caught by the verify-or-revert net below. Loop: ld lists all dups per pass,
    # but removing some can surface the next (bounded, stops when no progress).
    dropped = 0
    for _ in range(8):
        dup = set(re.findall(r"multiple definition of [`']([\w]+)'", mc.stdout + mc.stderr))
        if not dup:
            break
        rows = list(open("layout/baseline_syms.tsv"))
        kept = [l for l in rows if l.startswith("#") or l.split("\t")[0] not in dup]
        if len(kept) == len(rows):
            break  # the dup isn't a baseline sym (both defs are real objects) -> can't fix here
        dropped += len(rows) - len(kept)
        open("layout/baseline_syms.tsv", "w").writelines(kept)
        sh("make layout")
        mc = sh("make compare")
        if "fireemblem8.gba: OK" in mc.stdout:
            print(f"{name}: OK — run {start}..{end} ({len(funcs)} fns, -{dropped} dup baseline syms)")
            return True
    if os.environ.get("PORTRUN_DEBUG"):
        if os.path.exists("fireemblem8.gba"):
            b = open("fireemblem8.gba", "rb").read()  # TRUE carve diff, before the remap fallback
            d = [i for i in range(min(len(b), len(jp))) if b[i] != jp[i]]
            print(f"  [pre-remap {name}] size built={len(b)} jp={len(jp)} (+{len(b)-len(jp)}); "
                  f"content-diff={len(d)} bytes" + (f", first @ {d[0]:#x}" if d else ""))
        errs = [l.strip() for l in (mc.stdout + mc.stderr).splitlines()
                if re.search(r"undefined reference|in function|multiple definition|overlap|"
                             r"relocation truncated|cannot find|No such|not in any|will not fit", l, re.I)
                and "arm-none-eabi-ld " not in l]
        if errs:
            print(f"  [make-err {name}] " + " | ".join(errs[:8])[:900])

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
    os.remove(f"src/{name}.c"); sh(f"rm -f src/{name}.o src/{name}.s"); sh("make layout")
    return port(name, exclude + (tuple(funcs),), runs)  # next-largest run (reuse discovery)


if __name__ == "__main__":
    ok = sum(port(n) for n in sys.argv[1:])
    sh("make clean")
    print(f"\nported {ok}/{len(sys.argv)-1} runs; build "
          + ("GREEN" if "OK" in sh("make compare").stdout else "RED"))
