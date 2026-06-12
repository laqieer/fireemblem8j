#!/usr/bin/env python3
"""Constant-diff carver for the FAR matching-C tail (D81; the D79/D80 finding).

The decomp-permuter pilot (D79) proved that the small-FAR matching-C tail is
DOMINATED by JP DATA-CONSTANT diffs, not codegen-shape: the US-compiled function
differs from the JP ROM bytes ONLY in constant immediates / literal-pool words
(msg-IDs like US 0x8A3 vs JP 0x843, Proc_Goto jump indices, string/table
indices). The permuter cannot guess constants, but these are MECHANICALLY
carveable.

Per FAR function (`make compare` is the SOLE oracle -- verify-or-revert):
  1. JP range from funclib_us_jp.tsv (jp_addr -> next known boundary).
  2. extract_func_only US <tu>.c <fn> -> the function alone (no file-scope data).
  3. compile isolated -> US .text bytes + objdump relocs + objdump disasm.
  4. align vs JP bytes; classify each byte-diff:
       - reloc offset (BL operand / pc-rel literal pointer) -> IGNORE (perm2's job;
         the linker resolves it once carved at the JP address).
       - LEN (standalone length != JP range) -> ABORT (structurally region-diff).
       - constant-immediate / literal-pool-word -> CANDIDATE.
       - a diff inside a real instruction opcode (not its immediate field) -> ABORT
         (true codegen FAR -> permuter / hand-decomp).
  5. If ALL non-reloc diffs are constant-candidates, DERIVE the JP constant value
     (literal-pool word: read the JP 4-byte word; inline movs #imm8 [+ lsls #sh]:
     decode the JP immediate/shift) and SUBSTITUTE the JP value for the US value in
     the C source (rewrite the matching C literal). Recompile isolated; require
     byte-EXACT vs the JP range (the real gate -- the classifier only proposes; the
     bytes decide). If exact, carve: src/<fn>.c + carved_rom.d/constdiff_<fn>.tsv,
     swap any gbadisasm asm/sub_<addr>.s, drop colliding baseline binds.

Stages many functions, then the CALLER (or --verify) runs ONE `make compare`.
verify-or-revert keeps the build green. Never `git add -A`.

Usage:
  scripts/const_diff_carve.py --list [--min N --max N]   # FAR candidates by size
  scripts/const_diff_carve.py <fn> [<fn> ...] [--verify]  # carve named funcs
  scripts/const_diff_carve.py --batch K [--min N --max N] [--verify]
"""
import os, re, sys, subprocess, glob, bisect, shutil

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"
CPP = shutil.which("arm-none-eabi-cpp") or "cpp"
AGBCC = "tools/agbcc/bin/agbcc"
OBJDUMP = "arm-none-eabi-objdump"
RD_TSV = "layout/nofuncmap_region_different.tsv"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def load_funclib():
    d = {}
    for ln in open("reference/maps/funclib_us_jp.tsv"):
        if ln.startswith("#") or ln.startswith("jp_addr"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 3 and p[2]:
            try:
                d[p[2]] = int(p[0], 16)
            except ValueError:
                pass
    return d


def load_boundaries():
    addrs = set()
    for ln in open("sym_jp.txt"):
        m = re.match(r"\s*\w+\s*=\s*0x([0-9A-Fa-f]+)\s*;", ln)
        if m:
            addrs.add(int(m.group(1), 16))
    for ln in open("reference/maps/funclib_us_jp.tsv"):
        if ln.startswith("#") or ln.startswith("jp_addr"):
            continue
        try:
            addrs.add(int(ln.split("\t")[0], 16))
        except (ValueError, IndexError):
            pass
    return sorted(addrs)


def find_tu(name):
    for ln in open(RD_TSV):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 4 and p[2] == name:
            return p[3], int(p[1])
    return None, None


def jp_range(name, funclib, bounds):
    jp = funclib.get(name)
    if jp is None:
        return None, None
    i = bisect.bisect_right(bounds, jp)
    jp_end = bounds[i] if i < len(bounds) else jp + 4
    return jp & 0xFFFFFF, jp_end & 0xFFFFFF


def compile_func(cpath):
    """Compile src/<fn>.c isolated. Return (text_bytes, err, reloc_text, disasm)."""
    base = cpath[:-2]
    obj, asm, binf = base + ".cd.o", base + ".cd.s", base + ".cd.bin"
    p1 = sh(f"{CPP} -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef {cpath}")
    if p1.returncode != 0:
        return None, "cpp", "", ""
    p2 = subprocess.run(["iconv", "-f", "UTF-8", "-t", "CP932"],
                        input=p1.stdout.encode(), capture_output=True)
    p3 = subprocess.run([AGBCC, "-mthumb-interwork", "-Wimplicit", "-Wparentheses",
                         "-Werror", "-O2", "-fhex-asm", "-o", asm],
                        input=p2.stdout, capture_output=True)
    if p3.returncode != 0:
        return None, "agbcc", "", ""
    open(asm, "a").write("\t.text\n\t.align 2, 0\n")
    p4 = sh(f"arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . {asm} -o {obj}")
    if p4.returncode != 0:
        return None, "as", "", ""
    sh(f"arm-none-eabi-objcopy -O binary -j .text {obj} {binf}")
    data = open(binf, "rb").read() if os.path.exists(binf) else b""
    relocs = sh(f"{OBJDUMP} -r {obj}").stdout
    disasm = sh(f"{OBJDUMP} -d {obj}").stdout
    for p in (obj, asm, binf):
        if os.path.exists(p):
            os.unlink(p)
    return data, "", relocs, disasm


def reloc_offsets(relocs):
    offs = set()
    for m in re.finditer(r"^\s*([0-9a-f]+)\s+R_ARM", relocs, re.M):
        o = int(m.group(1), 16)
        for k in range(4):
            offs.add(o + k)
    return offs


def parse_disasm(disasm):
    """Map byte-offset -> instruction. Returns (insns, owner): insns[start] =
    (width, mnemonic, raw_hex); owner[byte] = (start, width, mnem)."""
    insns = {}
    for ln in disasm.splitlines():
        m = re.match(r"\s*([0-9a-f]+):\s+([0-9a-f]+(?: [0-9a-f]+)*)\s{2,}(.*)$", ln)
        if not m:
            continue
        off = int(m.group(1), 16)
        raw = m.group(2).replace(" ", "")
        mnem = m.group(3).strip()
        width = len(raw) // 2
        insns[off] = (width, mnem, raw)
    owner = {}
    for start, (width, mnem, raw) in insns.items():
        for k in range(width):
            owner[start + k] = (start, width, mnem)
    return insns, owner


def decode_thumb_imm(raw_hex, mnem):
    """For a 2-byte Thumb instruction, return (imm_value, kind) or (None,None).
    Handles MOV/CMP/ADD/SUB #imm8 and LSL/LSR/ASR #shift immediate."""
    if len(raw_hex) != 4:
        return None, None
    v = int(raw_hex, 16)
    if (v >> 13) == 0b001:  # MOV/CMP/ADD/SUB immediate
        op = (v >> 11) & 0b11
        imm8 = v & 0xFF
        return imm8, {0: "mov", 1: "cmp", 2: "add", 3: "sub"}[op]
    if (v >> 13) == 0b000 and ((v >> 11) & 0b11) != 0b11:  # shift-by-immediate
        op = (v >> 11) & 0b11
        sh5 = (v >> 6) & 0x1F
        return sh5, {0: "lsl", 1: "lsr", 2: "asr"}[op]
    return None, None


def classify_diffs(g, target, reloc_offs, insns, owner):
    """Return (status, candidates). status 'OK' iff every non-reloc body byte is a
    constant immediate / literal-pool word; 'NEAR' if pure reloc; else
    'ABORT:<reason>'. candidates: token dicts for value derivation."""
    n = len(target)
    diffs = [i for i in range(n) if g[i] != target[i]]
    body = [d for d in diffs if d not in reloc_offs]
    if not body:
        return "NEAR", []
    groups = {}
    for d in body:
        ow = owner.get(d)
        if ow is None:
            return f"ABORT:noinsn@{d:04X}", []
        groups.setdefault(ow[0], set()).add(d)
    cands = []
    for start, offs in sorted(groups.items()):
        width, mnem, raw = insns[start]
        us_word = int.from_bytes(g[start:start + width], "little")
        jp_word = int.from_bytes(target[start:start + width], "little")
        if width == 4 and mnem.startswith(".word"):
            cands.append({"kind": "word", "off": start, "width": 4,
                          "us": us_word, "jp": jp_word, "mnem": mnem})
            continue
        if width == 2:
            us_imm, us_k = decode_thumb_imm(raw, mnem)
            jp_imm, jp_k = decode_thumb_imm(f"{jp_word:04x}", mnem)
            if us_imm is None or jp_imm is None or us_k != jp_k:
                return f"ABORT:codegen@{start:04X}({mnem})", []
            cands.append({"kind": "imm", "off": start, "width": 2, "ikind": us_k,
                          "us": us_imm, "jp": jp_imm, "mnem": mnem})
            continue
        return f"ABORT:wide@{start:04X}({mnem})", []
    return "OK", cands


def derive_const_pairs(cands, g, target, insns, owner):
    """Produce (us_value, jp_value) source-level substitutions. Handles literal-
    pool words, lone inline movs/cmp/add #imm8, and movs #imm8;lsls #sh shifted
    constants (agbcc small-constant loader). Returns (pairs, ok)."""
    pairs = []
    consumed = set()
    for c in sorted(cands, key=lambda x: x["off"]):
        if c["off"] in consumed:
            continue
        if c["kind"] == "word":
            pairs.append((c["us"], c["jp"]))
            consumed.add(c["off"])
            continue
        if c["ikind"] == "mov":
            nxt_off = c["off"] + 2
            nxt = insns.get(nxt_off)
            if nxt and nxt[0] == 2:
                us_sh, us_shk = decode_thumb_imm(nxt[2], nxt[1])
                jp_raw = f"{int.from_bytes(target[nxt_off:nxt_off+2],'little'):04x}"
                jp_sh, jp_shk = decode_thumb_imm(jp_raw, nxt[1])
                if us_shk == "lsl" and jp_shk == "lsl":
                    pairs.append((c["us"] << us_sh, c["jp"] << jp_sh))
                    consumed.add(c["off"]); consumed.add(nxt_off)
                    continue
            pairs.append((c["us"], c["jp"]))
            consumed.add(c["off"])
            continue
        # cmp/add/sub immediate
        pairs.append((c["us"], c["jp"]))
        consumed.add(c["off"])
    return pairs, True


def substitute_in_c(ctext, pairs):
    """Replace each US constant value with the JP value in the C source. Tries hex
    (0x...) then decimal. Returns (new_text, n_subs) or (None,0) if any US value
    has no visible literal to rewrite."""
    out = ctext
    total = 0
    for us_val, jp_val in pairs:
        if us_val == jp_val:
            continue
        subbed = 0
        hexstr = f"{us_val:x}"
        pat_hex = re.compile(r"0[xX]0*" + hexstr + r"\b", re.I)
        out2, k = pat_hex.subn(lambda m: f"0x{jp_val:X}", out)
        if k:
            out = out2; subbed += k
        if not subbed:
            pat_dec = re.compile(r"(?<![\w.])" + str(us_val) + r"(?![\w.xX])")
            out2, k = pat_dec.subn(lambda m: str(jp_val), out)
            if k:
                out = out2; subbed += k
        total += subbed
        if not subbed:
            return None, 0
    return out, total


def existing_asm_carve(s):
    """Return (asm_path, frag_path, drop_path, label) for a gbadisasm sub_ carve
    starting at JP offset s, else (None, None, None, None)."""
    for f in glob.glob("layout/carved_rom.d/gbadisasm_*.tsv"):
        line = open(f).readline().strip().split("\t")
        if len(line) < 3:
            continue
        try:
            if int(line[0], 16) == s:
                label = os.path.basename(f)[len("gbadisasm_"):-4]
                asm = f"asm/{label}.s"
                drop = f"layout/baseline_syms_drop.d/gbadisasm_{label}.tsv"
                return (asm if os.path.exists(asm) else None, f,
                        drop if os.path.exists(drop) else None, label)
        except ValueError:
            pass
    return (None, None, None, None)


def load_baseline_binds():
    binds = set()
    files = ["layout/baseline_syms.tsv"] + glob.glob("layout/baseline_syms.d/*.tsv")
    for fp in files:
        if not os.path.exists(fp):
            continue
        for ln in open(fp):
            if ln.startswith("#") or not ln.strip():
                continue
            binds.add(ln.split("\t")[0].strip())
    for fp in glob.glob("layout/baseline_syms_drop.d/*.tsv"):
        for ln in open(fp):
            binds.discard(ln.strip())
    return binds


def stage_one(name, funclib, bounds, rom, stash):
    tu, usize = find_tu(name)
    if not tu:
        return "NOTU", None
    if not os.path.exists(f"{US}/src/{tu}.c"):
        return "NOTUFILE", None
    s, e = jp_range(name, funclib, bounds)
    if s is None:
        return "NOADDR", None
    cpath = f"src/{name}.c"
    ext = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu}.c {name}")
    if name not in ext.stdout or "{" not in ext.stdout:
        return "NOEXTRACT", None
    base_ctext = ext.stdout
    open(cpath, "w").write(base_ctext)
    got, err, relocs, disasm = compile_func(cpath)
    if got is None:
        os.unlink(cpath)
        return f"CF:{err}", None
    target = rom[s:e]
    n = len(target)
    if len(got) != n:
        os.unlink(cpath)
        return f"LEN {len(got)}!={n}", None
    g = got[:n]
    roffs = reloc_offsets(relocs)
    insns, owner = parse_disasm(disasm)
    status, cands = classify_diffs(g, target, roffs, insns, owner)
    if status == "NEAR":
        os.unlink(cpath)
        return "NEAR(use-perm2)", None
    if status != "OK":
        os.unlink(cpath)
        return status, None
    pairs, ok = derive_const_pairs(cands, g, target, insns, owner)
    if not ok or not pairs:
        os.unlink(cpath)
        return "ABORT:noderive", None
    new_ctext, nsub = substitute_in_c(base_ctext, pairs)
    if new_ctext is None:
        os.unlink(cpath)
        return f"ABORT:nolit{[(hex(a),hex(b)) for a,b in pairs if a!=b]}", None
    open(cpath, "w").write(new_ctext)
    got2, err2, relocs2, _ = compile_func(cpath)
    if got2 is None:
        os.unlink(cpath)
        return f"CF2:{err2}", None
    if len(got2) != n:
        os.unlink(cpath)
        return f"LEN2 {len(got2)}!={n}", None
    g2 = got2[:n]
    roffs2 = reloc_offsets(relocs2)
    diffs2 = [i for i in range(n) if g2[i] != target[i] and i not in roffs2]
    if diffs2:
        os.unlink(cpath)
        return (f"NOMATCH(resid {len(diffs2)}body @ "
                f"{[f'{d:04X}' for d in diffs2[:4]]}; "
                f"pairs={[(hex(a),hex(b)) for a,b in pairs if a!=b]})"), None
    asm, frag, drop, label = existing_asm_carve(s)
    if frag:
        os.makedirs("/tmp/constdiff_stash", exist_ok=True)
        bak = f"/tmp/constdiff_stash/{os.path.basename(frag)}"
        shutil.move(frag, bak)
        stash.append(("frag", frag, bak))
        if asm:
            abak = f"/tmp/constdiff_stash/{os.path.basename(asm)}"
            shutil.move(asm, abak)
            stash.append(("asm", asm, abak))
        if drop:
            dbak = f"/tmp/constdiff_stash/gbadisasm_{label}_drop.tsv"
            shutil.move(drop, dbak)
            stash.append(("drop", drop, dbak))
    row = (f"{s:06X}\t{e:06X}\tsrc/{name}.o(.text)\t"
           f"{name} (const-diff: JP-constant substituted -> matching C; "
           f"pairs={[(hex(a),hex(b)) for a,b in pairs if a!=b]})\n")
    fragpath = f"layout/carved_rom.d/constdiff_{name}.tsv"
    open(fragpath, "w").write(row)
    stash.append(("newfrag", fragpath, None))
    stash.append(("newsrc", cpath, None))
    return "CARVE", (s, e, pairs)


def revert(name):
    fp = f"layout/carved_rom.d/constdiff_{name}.tsv"
    vma = None
    if os.path.exists(fp):
        try:
            vma = (int(open(fp).readline().split("\t")[0], 16)) | 0x08000000
        except (ValueError, IndexError):
            pass
    for p in (f"src/{name}.c", fp):
        if os.path.exists(p):
            os.unlink(p)
    if vma is not None:
        sub = f"sub_{vma:X}"
        for orig, bak in (
            (f"layout/carved_rom.d/gbadisasm_{sub}.tsv",
             f"/tmp/constdiff_stash/gbadisasm_{sub}.tsv"),
            (f"asm/{sub}.s", f"/tmp/constdiff_stash/{sub}.s"),
            (f"layout/baseline_syms_drop.d/gbadisasm_{sub}.tsv",
             f"/tmp/constdiff_stash/gbadisasm_{sub}_drop.tsv"),
        ):
            if os.path.exists(bak) and not os.path.exists(orig):
                shutil.move(bak, orig)
    dl = "layout/baseline_syms_drop.d/constdiff_auto.tsv"
    if os.path.exists(dl):
        lines = [l for l in open(dl) if l.strip() != name]
        open(dl, "w").writelines(lines)


def collect_far(mn, mx):
    out = []
    for ln in open(RD_TSV):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) < 4:
            continue
        sz = int(p[1])
        if mn <= sz <= mx:
            out.append((p[2], sz))
    out.sort(key=lambda x: x[1])
    return [n for n, _ in out]


def main():
    args = sys.argv[1:]
    mn, mx, batch, verify, listing = 0, 1 << 30, 0, False, False
    if "--min" in args:
        i = args.index("--min"); mn = int(args[i + 1]); del args[i:i + 2]
    if "--max" in args:
        i = args.index("--max"); mx = int(args[i + 1]); del args[i:i + 2]
    if "--batch" in args:
        i = args.index("--batch"); batch = int(args[i + 1]); del args[i:i + 2]
    if "--verify" in args:
        verify = True; args.remove("--verify")
    if "--list" in args:
        listing = True; args.remove("--list")
    explicit = [a for a in args if not a.startswith("--")]

    funclib = load_funclib()
    bounds = load_boundaries()
    rom = open("baserom.gba", "rb").read()
    names = explicit if explicit else collect_far(mn, mx)

    if listing:
        for n in names[:batch or len(names)]:
            print(n)
        return

    stash = []
    carved = []
    for name in names:
        if os.path.exists(f"src/{name}.c"):
            continue
        res, info = stage_one(name, funclib, bounds, rom, stash)
        if res == "CARVE":
            carved.append(name)
            print(f"[CARVE] {name}  jp={info[0]:06X}..{info[1]:06X}  "
                  f"pairs={[(hex(a),hex(b)) for a,b in info[2] if a!=b]}")
        else:
            print(f"[skip {res[:70]}] {name}")
        if batch and len(carved) >= batch:
            break

    print(f"\nstaged {len(carved)} const-diff carves")
    if not carved:
        return

    binds = load_baseline_binds()
    drop_names = [n for n in carved if n in binds]
    if drop_names:
        os.makedirs("layout/baseline_syms_drop.d", exist_ok=True)
        with open("layout/baseline_syms_drop.d/constdiff_auto.tsv", "a") as f:
            for n in drop_names:
                f.write(n + "\n")
        print(f"auto-dropped {len(drop_names)} colliding baseline binds: {drop_names}")

    if not verify:
        print("staged; run `make layout && make compare`. To self-correct, re-run with --verify")
        return

    kept = list(carved)
    for attempt in range(8):
        sh("rm -f src/*.s; rm -f fireemblem8.elf fireemblem8.gba")
        lay = sh("make layout 2>&1")
        laylog = lay.stdout + lay.stderr
        if "overlap/order error" in laylog or "Error 1" in laylog:
            m = re.search(r"overlap/order error at 0x([0-9a-f]+)", laylog)
            if m:
                addr = int(m.group(1), 16)
                victim = None
                for n in kept:
                    fp = f"layout/carved_rom.d/constdiff_{n}.tsv"
                    if not os.path.exists(fp):
                        continue
                    pp = open(fp).readline().split("\t")
                    if int(pp[0], 16) <= addr < int(pp[1], 16) or int(pp[0], 16) == addr:
                        victim = n
                        break
                if victim:
                    print(f"attempt {attempt}: layout overlap at {addr:06X} -> revert {victim}")
                    revert(victim)
                    kept.remove(victim)
                    continue
            print("LAYOUT ERROR (unhandled):", laylog[-400:])
            return
        sh("rm -f src/*.s")
        c = sh("make compare 2>&1")
        log = c.stdout + c.stderr
        if "fireemblem8.gba: OK" in log:
            print(f"OK: {len(kept)} const-diff carves graduated (attempt {attempt})")
            return
        bad = set()
        for m in re.finditer(r"src/(\w+)\.c:\d+.*undefined reference", log):
            bad.add(m.group(1))
        for m in re.finditer(r"src/(\w+)\.o:.*multiple definition of `(\w+)'", log):
            owner, sym = m.group(1), m.group(2)
            if owner != sym:
                bad.add(owner)
        if not bad and os.path.exists("fireemblem8.gba"):
            built = open("fireemblem8.gba", "rb").read()
            for n in kept:
                fp = f"layout/carved_rom.d/constdiff_{n}.tsv"
                if not os.path.exists(fp):
                    continue
                pp = open(fp).readline().split("\t")
                s2, e2 = int(pp[0], 16), int(pp[1], 16)
                if rom[s2:e2] != built[s2:e2]:
                    bad.add(n)
        if not bad:
            print("RED but no offender identified:", log[-600:])
            return
        print(f"attempt {attempt}: reverting {len(bad)} offenders: {sorted(bad)}")
        for n in bad:
            revert(n)
            if n in kept:
                kept.remove(n)
        if not kept:
            print("all reverted; nothing graduated")
            return
    print("exhausted retries")


if __name__ == "__main__":
    main()
