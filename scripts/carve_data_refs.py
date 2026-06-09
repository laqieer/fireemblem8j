#!/usr/bin/env python3
"""Carve region-different data by reading its JP address from funcmap-aligned code refs.

Generalises the msg_data carve. A region-different data object is referenced by a function
via a literal holding its address. For a US->JP funcmap-mapped function the two bodies are
byte-identical except wildcarded pointer literals, so the literal at offset k in the US
function and the literal at offset k in the JP function reference the SAME object — one
gives its US address, the other its JP address. Scan every mapped function's literal pool:
where the US literal is a known US data symbol's address and the JP literal differs, record
{symbol: jp_addr}. RECURSE: every discovered object is itself a US<->JP aligned region whose
pointer literals reach MORE region-different objects, so re-scan each one and cascade.

Sizing (the recursion's correctness crux): two deterministic passes.
  PASS 1 builds the ACCEPTED OBJECT set — word-aligned jp+us, known US size, region-different
         prefix, not already carved/owned. (Word-alignment rejects Thumb code pointers and
         spurious literal matches; the recursion otherwise discovers many non-object pointers.)
  PASS 2 sizes each object as ``min(us_size, next_accepted_object_jp - jw, next_carved_start
         - jw)``. The hard end is the next REAL object/carve, so a carve never runs into an
         adjacent object; us_size caps fixed-layout structs (whose JP layout == US) to their
         true size. Overlaps are resolved HERE, before emit — never discovered via a link error.

Legitimacy (D10): each object's JP address is READ FROM THE ROM'S OWN CODE via the verified
funcmap alignment, bounded by the next identified object — a verified location, not a guess.
`make compare` is the oracle. Region-same objects are skipped (the relocation harvesters own
them). NO `.align`; atomic write. Carved rows go to a PER-TASK layout fragment
(layout/carved_rom.d/data_refs_recursive.tsv), never the shared monolith, so this carve can
run concurrently with other carves with no merge conflict (scripts/parallel/layout_frag.py).

Usage: scripts/carve_data_refs.py [--min BYTES]   (default --min 64)
Then: make layout && make compare  (revert asm/*.s + the fragment on any miss).
"""
import subprocess, sys, os, re, struct

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
US = "/home/laqieer/fireemblem8u"
US_ELF = f"{US}/fireemblem8.elf"
US_BIN = "/tmp/us.bin"


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def main():
    args = sys.argv[1:]
    min_b = 64
    if "--min" in args:
        i = args.index("--min"); min_b = int(args[i+1]); del args[i:i+2]
    if not os.path.exists(US_BIN):
        sh(f"arm-none-eabi-objcopy -O binary {US_ELF} {US_BIN}")
    us = open(US_BIN, "rb").read()
    jp = open("baserom.gba", "rb").read()

    # all US symbols: addr -> name (first/canonical), addr -> size
    name_at, size_at = {}, {}
    for l in sh(f"arm-none-eabi-nm --print-size {US_ELF}").stdout.splitlines():
        p = l.split()
        if len(p) == 4:
            a = int(p[0], 16); size_at[a] = int(p[1], 16); name_at.setdefault(a, p[3])
        elif len(p) == 3:
            name_at.setdefault(int(p[0], 16), p[2])

    # sorted US symbol addresses -> a size-less symbol's extent = gap to the next symbol
    us_addrs = sorted(name_at)
    import bisect as _bis

    def us_extent(a):
        if a in size_at and size_at[a]:
            return size_at[a]
        i = _bis.bisect_right(us_addrs, a)
        return us_addrs[i] - a if i < len(us_addrs) else 0

    # funcmap: (jp_addr, us_addr, size)
    fmap = []
    for l in open("layout/us_jp_funcmap.tsv"):
        if l.startswith("#"):
            continue
        p = l.rstrip("\n").split("\t")
        if len(p) >= 3:
            fmap.append((int(p[0], 16), int(p[1], 16), int(p[2])))

    # This carve's identity. Its outputs (the carved_rom fragment + asm/dat_*_ref.s) are
    # EXCLUDED from the "already carved / already defined" sets below, so a re-run re-derives the
    # FULL object set from scratch and overwrites its own fragment idempotently — rather than
    # treating last run's output as occupied and shrinking the result. Other tasks' fragments
    # ARE included, so the cascade never re-carves or overlaps an object another agent claimed.
    TASK = "data_refs_recursive"
    OUR_FRAG = os.path.join("layout", "carved_rom.d", TASK + ".tsv")
    # own_asm = ONLY the asm THIS task previously emitted (the objects OUR fragment references),
    # NOT every dat_*_ref.s in asm/. Listing all of them wrongly claimed the MONOLITH carve's .s
    # (same dat_*_ref naming) as ours, so the reaper (`own_asm - emitted`, below) deleted them and
    # left dangling layout rows -- builds locally (stale .o survives make clean) but breaks CI's
    # fresh-checkout link with `ld: cannot find asm/X.o`.
    own_asm = set()
    if os.path.exists(OUR_FRAG):
        for l in open(OUR_FRAG):
            m = re.search(r"asm/(dat_\S+?_ref)\.o\(", l)
            if m:
                own_asm.add(m.group(1) + ".s")

    # Carved set = monolith manifest + every OTHER per-task fragment (not ours).
    sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "parallel"))
    import layout_frag
    own_frag_rows = set()
    if os.path.exists(OUR_FRAG):
        for l in open(OUR_FRAG):
            if l.strip() and not l.lstrip().startswith("#"):
                own_frag_rows.add(l.rstrip("\n"))
    carved = []
    for l in layout_frag.read_all("carved_rom"):
        if l in own_frag_rows:          # skip our own previous output -> idempotent re-run
            continue
        p = l.split("\t")
        carved.append((int(p[0], 16) + 0x08000000, int(p[1], 16) + 0x08000000))

    # symbols already defined by existing carves (asm/*.s labels) — never redefine them, EXCEPT
    # our own previous run's asm (excluded so a re-run can re-emit the same symbols).
    already = set()
    for f in os.listdir("asm"):
        if f.endswith(".s") and f not in own_asm:    # exclude our own prior output
            for l in open(os.path.join("asm", f)):
                m = re.match(r"\s*\.global\s+(\w+)", l)
                if m:
                    already.add(m.group(1))

    def is_carved(lo, hi):
        return any(not (hi <= cl or lo >= ch) for cl, ch in carved)

    # Walk each US<->JP aligned region's words; a pointer literal that DIFFERS US<->JP names a
    # region-different object (US word names it, JP word = JP addr). Seed = funcmap functions;
    # RECURSE into every discovered object (a table whose pointers reach graphics).
    found = {}   # us_data_addr -> jp_data_addr (None = inconsistent -> dropped)
    queue = []

    def scan_region(us_start, jp_start, size):
        uo = us_start - 0x08000000; jo = jp_start - 0x08000000
        if uo < 0 or jo < 0:
            return
        for k in range(0, size - 3, 4):
            if uo + k + 4 > len(us) or jo + k + 4 > len(jp):
                break
            uw = struct.unpack_from("<I", us, uo + k)[0]
            if not (0x08000000 <= uw < 0x09000000) or uw not in name_at:
                continue
            jw = struct.unpack_from("<I", jp, jo + k)[0]
            if not (0x08000000 <= jw < 0x09000000) or jw == uw:
                continue
            if uw not in found:
                found[uw] = jw; queue.append(uw)
            elif found[uw] != jw:
                found[uw] = None

    for jp_fn, us_fn, size in fmap:
        scan_region(us_fn, jp_fn, size)
    seen = set()
    while queue:
        uw = queue.pop()
        if uw in seen or found.get(uw) is None:
            continue
        seen.add(uw)
        sz = us_extent(uw)
        if 0 < sz <= 0x8000:          # scan tables/structs; skip huge blobs (raw graphics)
            scan_region(uw, found[uw], sz)

    refs = sorted((jw, ua) for ua, jw in found.items() if jw is not None)
    if not refs:
        print("no funcmap-aligned region-different data references found")
        return

    import bisect

    # --- PASS 1: build the ACCEPTED OBJECT set ----------------------------------------------
    # An accepted object is a (jp_addr, us_addr, name) discovered above that is a real,
    # carveable region-different data object. Recursion finds many literals; only a subset are
    # genuine object starts. Filters (all deterministic, no reliance on a later link error):
    #   * 4-alignment of BOTH jp and us addresses — a data object is word-aligned; an odd/
    #     unaligned target is a Thumb code pointer or a spurious literal match, not data.
    #   * a KNOWN US size (us_extent>0). A size-less symbol's extent is only "gap to the next
    #     US symbol", which in the shifted JP layout is not a reliable JP object size, so such
    #     candidates are skipped rather than mis-sized.
    #   * the name is not already owned by an existing carve (asm/*.s label) or this run.
    #   * the jp_addr is not inside an already-carved range.
    #   * the object is genuinely region-different (its first bytes differ US<->JP); region-same
    #     objects are owned by the relocation harvesters, not this carver.
    # First US name wins per jp_addr (two literals can name the same object); first jp_addr wins
    # per name. The result is sorted by jp_addr so PASS 2 can size by the NEXT accepted object.
    by_jp = {}
    for jw, ua in refs:
        if (jw & 3) or (ua & 3):              # data objects are word-aligned; reject Thumb/spurious
            continue
        nm = name_at[ua]
        if nm in already:                     # never redefine a symbol an existing carve owns
            continue
        if is_carved(jw, jw + 1):             # jp_addr already inside a carved range
            continue
        if us_extent(ua) <= 0:                # unknown US size -> unreliable JP sizing, skip
            continue
        if jw not in by_jp:                   # two US names -> one JP addr: keep first
            by_jp[jw] = (ua, nm, us_extent(ua))

    objs, nmseen = [], set()
    for jw in sorted(by_jp):
        ua, nm, us_sz = by_jp[jw]
        if nm in nmseen:                      # first jp_addr wins per name
            continue
        nmseen.add(nm)
        uo = ua - 0x08000000; jo = jw - 0x08000000
        w = min(64, us_sz)
        if jo < 0 or jo + w > len(jp):
            continue
        if us[uo:uo+w] == jp[jo:jo+w]:        # region-same prefix -> not ours
            continue
        objs.append((jw, nm, us_sz, ua))
    objs.sort()
    if not objs:
        print("no carveable funcmap code-ref region-different data")
        return

    # --- PASS 2: size each object as min(us_size, hard end), absorbing interior pointers -----
    # Each object O may claim up to its full us_size. A LATER accepted object whose JP start
    # falls strictly INSIDE [O.start, O.start + us_size) is an interior pointer/alias into the
    # SAME logical asset (the recursion surfaces pointers to sub-fields, not just object starts);
    # it is ABSORBED by O — neither emitted separately nor used as a truncating boundary — so O
    # gets its exact JP size instead of being clipped at a sub-field. The hard end is then the
    # first accepted object starting AT OR AFTER O.start + us_size, OR the next already-carved
    # range start, whichever is first — so a carve still never runs into a genuinely-distinct
    # adjacent object. All bounds are computed BEFORE emit: overlaps are resolved here, never via
    # a link error. (objs is address-sorted; carved_starts gives the next carved-range start.)
    carved_starts = sorted(c[0] for c in carved)
    rom_end = len(jp) + 0x08000000
    made, new_rows, asm_pending, drop = [], [], [], set()
    i, nobj = 0, len(objs)
    while i < nobj:
        jw, nm, us_sz, ua = objs[i]
        want_end = jw + us_sz
        j = i + 1
        while j < nobj and objs[j][0] < want_end:   # absorb interior pointers/aliases
            j += 1
        hard = want_end
        if j < nobj:                                # first non-interior object after us extent
            hard = min(hard, objs[j][0])
        ci = bisect.bisect_right(carved_starts, jw)
        if ci < len(carved_starts):
            hard = min(hard, carved_starts[ci])
        size = min(us_sz, hard - jw)
        i = j                                       # interiors consumed; resume at next object
        if size < min_b:
            continue
        jl, jh = jw, jw + size
        if jh - 0x08000000 > len(jp) or is_carved(jl, jh):   # belt-and-braces overlap guard
            continue
        base = "dat_" + re.sub(r"\W", "_", nm) + "_ref"
        body = [f'\t.section .rodata.{base}, "a", %progbits',
                f'@ {nm}: region-different data, JP 0x{jl:08x} read from funcmap-aligned code literal (US 0x{ua:08x}); incbin baserom.gba',
                f'\t.global {nm}', f'{nm}:',
                f'\t.incbin "baserom.gba", 0x{jl-0x08000000:X}, 0x{size:X}']
        asm_pending.append((base, "\n".join(body) + "\n"))
        new_rows.append(f"{jl&0xFFFFFF:06X}\t{jh&0xFFFFFF:06X}\tasm/{base}.o(.rodata.{base})\t{nm} region-diff (funcmap code-ref, {size} B)\n")
        drop.add(nm); made.append((nm, jl, size))

    if not made:
        print("no carveable funcmap code-ref region-different data")
        return

    # Self-overlap assertion: PASS 2 sizing already guarantees this, but verify deterministically
    # so a regression can never silently emit overlapping sections (gen_layout would then fail).
    em = sorted(made, key=lambda m: m[1])
    for a, b in zip(em, em[1:]):
        if b[1] < a[1] + a[2]:
            sys.exit(f"INTERNAL: overlap {a[0]} 0x{a[1]:08x}+{a[2]} into {b[0]} 0x{b[1]:08x}")

    # Remove any of OUR previous-run asm files that this run no longer emits, so a re-run leaves
    # no orphaned dat_*_ref.o (which would otherwise stay in the build and double-define a symbol
    # or carve a now-stale range). Only our own files are touched; other carves' asm is untouched.
    emitted = {base + ".s" for base, _ in asm_pending}
    for f in own_asm - emitted:
        try:
            os.remove(os.path.join("asm", f))
        except OSError:
            pass
    for base, txt in asm_pending:
        open(f"asm/{base}.s", "w").write(txt)

    # Parallel-safe layout write: carved_rom rows go to THIS task's fragment (gen_layout reads
    # monolith + every fragment), NOT the shared monolith, so concurrent carves never conflict.
    os.makedirs(os.path.dirname(OUR_FRAG), exist_ok=True)
    with open(OUR_FRAG, "w") as f:
        f.write("# carve_data_refs.py recursive region-different data (parallel-safe fragment)\n")
        f.writelines(sorted(new_rows, key=lambda l: int(l.split("\t")[0], 16)))

    # baseline_syms: a carved symbol must NOT also live in the baseline shim (duplicate def).
    # gen_layout has no per-fragment removal, so dropping a baseline sym requires editing the
    # shared monolith — only do so when there is an ACTUAL collision (here typically none), to
    # avoid a needless monolith write that would conflict with a concurrent carve.
    bsyms = set()
    for l in open("layout/baseline_syms.tsv"):
        if l.strip() and not l.startswith("#"):
            bsyms.add(l.split("\t")[0])
    collide = drop & bsyms
    if collide:
        kept = [l for l in open("layout/baseline_syms.tsv")
                if not (l.strip() and not l.startswith("#") and l.split("\t")[0] in collide)]
        open("layout/baseline_syms.tsv", "w").writelines(kept)
        print(f"dropped {len(collide)} baseline_syms now owned by this carve: {sorted(collide)}")

    tot = sum(m[2] for m in made)
    print(f"carved {len(made)} region-different objects via funcmap code refs, "
          f"{tot} bytes ({tot//1024}KB) -> {OUR_FRAG}:")
    for nm, jl, size in sorted(made, key=lambda m: -m[2])[:20]:
        print(f"  {nm:40s} JP 0x{jl:08x} {size:7d} B")


if __name__ == "__main__":
    main()
