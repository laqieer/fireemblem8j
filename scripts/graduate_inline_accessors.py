#!/usr/bin/env python3
"""Phase-1/2 helper: graduate funcmap gbadisasm functions that INLINE a small
`inline` data accessor (GetUnit/GetClassData/GetCharacterData/...). The generic
graduate_exact_asm cannot, because extract_func_only emits only the target
function body, so the accessor compiles to an out-of-line CALL instead of being
inlined -- different bytes than the JP ROM (which inlined it at -O2). The fix:
prepend the accessor's US `inline` body as `extern inline` (GNU89: inlined at
call sites, NEVER emits a standalone copy -> no multiple-definition with the
accessor's own already-carved object). The accessor's data globals
(gUnitLookup/gClassData/gCharacterData) must already be named/placed (gClassData
carved this session; gUnitLookup via GetUnit.o; gCharacterData via its _ref.s).

verify-or-revert; `make compare` is the sole oracle. NOT a git op; caller stages.

Usage:
  scripts/graduate_inline_accessors.py <US_TU> <fn> [<fn> ...]
  scripts/graduate_inline_accessors.py --tu <US_TU>        # all masked-tier fns of the TU
"""
import os, re, sys, subprocess, glob, time

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
US = "/home/laqieer/fireemblem8u"

# PARALLEL-SAFE FRAGMENT (see graduate_exact_asm.py): each run writes its own unique
# `layout/carved_rom.d/graduated_<scope>.tsv` (globbed by the build) instead of all
# runs appending to the shared exact_layer.tsv, so concurrent agents never collide.
EXACT_LAYER = "layout/carved_rom.d/exact_layer.tsv"  # legacy shared file (read-only now)
FRAG = EXACT_LAYER  # default; set per-run in main()


def frag_path_for(scope):
    tag = re.sub(r"[^\w.-]", "_", scope)
    return f"layout/carved_rom.d/graduated_inacc_{tag}_{os.getpid()}_{int(time.time())}.tsv"

# name -> `extern inline` body. Only accessors whose data globals are already
# named/placed in the JP build. Add more as their globals get carved.
ACCESSORS = {
    "GetUnit": """extern inline struct Unit* GetUnit(int id) {
    return gUnitLookup[id & 0xFF];
}
""",
    "GetClassData": """extern inline const struct ClassData* GetClassData(int classId) {
    if (classId < 1)
        return NULL;

    return gClassData + (classId - 1);
}
""",
    "GetCharacterData": """extern inline const struct CharacterData* GetCharacterData(int charId) {
    if (charId < 1)
        return NULL;

    return gCharacterData + (charId - 1);
}
""",
    # GetTrap returns &sTrapPool[id]; sTrapPool is a TU-private EWRAM static bound
    # as baseline_syms (data_bmtrick_trappool.tsv, JP 0x0203A610). Prepend both the
    # extern array decl and the inline accessor so the body inlines + resolves.
    "GetTrap": """extern struct Trap sTrapPool[TRAP_MAX_COUNT];
extern inline struct Trap* GetTrap(int id) {
    return sTrapPool + id;
}
""",
    # bmitem.c `inline` accessors: the JP item-stat/attribute getters INLINE these at
    # -O2 (literal pool = gItemData 0x0885E068, already named via dat_gItemData_ref.s),
    # so extract_func_only's out-of-line call diverges. Prepend as extern inline.
    # ITEM_INDEX(x)=(x)&0xFF; gItemData declared in bmitem.h (always included).
    "GetItemData": """extern inline const struct ItemData* GetItemData(int itemIndex) {
    return gItemData + itemIndex;
}
""",
    "GetItemStatBonuses": """extern inline const struct ItemStatBonuses* GetItemStatBonuses(int item) {
    return GetItemData(ITEM_INDEX(item))->pStatBonuses;
}
""",
    "GetItemAttributes": """extern inline int GetItemAttributes(int item) {
    return GetItemData(ITEM_INDEX(item))->attributes;
}
""",
    "GetItemIndex": """extern inline int GetItemIndex(int item) {
    return ITEM_INDEX(item);
}
""",
    "GetItemMaxUses": """extern inline int GetItemMaxUses(int item) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return GetItemData(ITEM_INDEX(item))->maxUses;
}
""",
    "GetItemUses": """extern inline int GetItemUses(int item) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return ITEM_USES(item);
}
""",
    "GetItemType": """extern inline int GetItemType(int item) {
    if (!item)
        return 0xFF;

    return GetItemData(ITEM_INDEX(item))->weaponType;
}
""",
    "GetItemMinRange": """extern inline int GetItemMinRange(int item) {
    return GetItemData(ITEM_INDEX(item))->encodedRange >> 4;
}
""",
    "GetItemMaxRange": """extern inline int GetItemMaxRange(int item) {
    return GetItemData(ITEM_INDEX(item))->encodedRange & 0xF;
}
""",
    "GetItemEncodedRange": """extern inline int GetItemEncodedRange(int item) {
    return GetItemData(ITEM_INDEX(item))->encodedRange;
}
""",
    "GetItemEffectiveness": """extern inline const u8* GetItemEffectiveness(int item) {
    return GetItemData(ITEM_INDEX(item))->pEffectiveness;
}
""",
    "GetItemRequiredExp": """extern inline int GetItemRequiredExp(int item) {
    return GetItemData(ITEM_INDEX(item))->weaponRank;
}
""",
    "GetItemUseEffect": """extern inline int GetItemUseEffect(int item) {
    return GetItemData(ITEM_INDEX(item))->useEffectId;
}
""",
}

# Transitive inline deps: if the body uses accessor K, also prepend ACCESSORS[v] for
# v in DEPS[K] (ordered: dependency first). E.g. GetItemStatBonuses inlines GetItemData.
DEPS = {
    "GetItemStatBonuses": ["GetItemData"],
    "GetItemAttributes": ["GetItemData"],
    "GetItemMaxUses": ["GetItemData", "GetItemAttributes"],
    "GetItemUses": ["GetItemAttributes"],
    "GetItemType": ["GetItemData"],
    "GetItemMinRange": ["GetItemData"],
    "GetItemMaxRange": ["GetItemData"],
    "GetItemEncodedRange": ["GetItemData"],
    "GetItemEffectiveness": ["GetItemData"],
    "GetItemRequiredExp": ["GetItemData"],
    "GetItemUseEffect": ["GetItemData"],
}


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def funcmap():
    fm = {}
    for ln in open("layout/us_jp_funcmap.tsv"):
        if ln.startswith("#"):
            continue
        p = ln.rstrip("\n").split("\t")
        if len(p) >= 5:
            fm[p[4]] = (int(p[0], 16), int(p[2]), p[3])  # name -> (jp, size, tier)
    return fm


def gbadisasm_names():
    out = set()
    for f in glob.glob("layout/carved_rom.d/gbadisasm_*.tsv"):
        out.add(os.path.basename(f)[len("gbadisasm_"):-4])
    return out


def grad_one(tu, name, jp, size):
    asm = f"asm/{name}.s"
    gfrag = f"layout/carved_rom.d/gbadisasm_{name}.tsv"
    src = f"src/{name}.c"
    if os.path.exists(src):
        return "skip:src exists"
    if not os.path.exists(gfrag):
        return "skip:no gbadisasm fragment"
    snap = {p: (open(p).read() if os.path.exists(p) else None)
            for p in (asm, gfrag, FRAG, src)}

    ext = sh(f"python3 scripts/extract_func_only.py {US}/src/{tu}.c {name}")
    body = ext.stdout
    if name not in body or "{" not in body:
        return "skip:extract failed"

    # prepend `extern inline` bodies for any accessor the function references
    # (transitively: GetUnitFromCharId uses GetUnit; some use GetClassData via
    #  GetUnit->pClassData, but only literal call-syntax matters for the prepend).
    referenced = [a for a in ACCESSORS if re.search(r"\b" + a + r"\(", body)]
    # GetCharacterData is reached through unit->pCharacterData, not a call; only
    # prepend accessors actually called by name in the body.
    # Pull in transitive inline deps (each dependency emitted BEFORE its user so the C
    # is well-formed), de-duped, preserving order. DFS over DEPS so multi-level chains
    # resolve (GetItemMaxUses -> GetItemAttributes -> GetItemData).
    used = []

    def add(a):
        if a in used:
            return
        for dep in DEPS.get(a, []):
            add(dep)
        if a not in used:
            used.append(a)

    for a in referenced:
        add(a)
    decls = "".join(ACCESSORS[a] for a in used)
    if not decls:
        return "skip:no inline accessor referenced"
    lines = body.splitlines(keepends=True)
    li = max((i for i, l in enumerate(lines) if l.lstrip().startswith("#include")),
             default=-1)
    body = "".join(lines[:li + 1]) + "\n" + decls + "".join(lines[li + 1:])
    open(src, "w").write(body)

    # clear cascading implicit-decl helpers (same trick as graduate_exact_asm)
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

    # IMPORTANT: carve over the EXACT byte range the gbadisasm fragment occupied
    # (start..end incl. any .align padding the layout already accounts for), NOT
    # funcmap jp+size -- the funcmap size can be 2 bytes short of the padded region,
    # which would leave a gap and shift the ROM (make compare RED). Read the fragment.
    grow = open(gfrag).readline().strip().split("\t")
    fstart, fend = int(grow[0], 16), int(grow[1], 16)
    with open(FRAG, "a") as f:
        f.write(f"{fstart:06X}\t{fend:06X}\t"
                f"src/{name}.o(.text)\t{name} (masked-tier graduated; "
                f"extern inline {'/'.join(used)})\n")
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
    global FRAG
    args = sys.argv[1:]
    fm = funcmap()
    gb = gbadisasm_names()
    if args and args[0] == "--tu":
        tu = args[1]
        # all masked-tier gbadisasm fns of this TU (need US map fn->tu)
        names = []
        tu_cur, tu_end = None, 0
        want = {}
        for ln in open(f"{US}/fireemblem8.map"):
            m = re.match(r"\s+\.text\s+0x([0-9a-f]+)\s+0x([0-9a-f]+)\s+src/([\w-]+)\.o", ln)
            if m:
                tu_cur = m.group(3); tu_end = int(m.group(1), 16) + int(m.group(2), 16)
            m2 = re.match(r"\s+0x([0-9a-f]+)\s+(\w+)\s*$", ln)
            if m2 and int(m2.group(1), 16) < tu_end and tu_cur == tu:
                want[m2.group(2)] = True
        names = [n for n in want if n in gb and n in fm and fm[n][2] == "masked"]
    else:
        tu = args[0]
        names = args[1:]

    # PARALLEL-SAFE: unique per-run fragment, scoped by TU.
    FRAG = frag_path_for(tu)

    grad, skip = [], []
    for name in names:
        if name not in fm:
            skip.append((name, "not in funcmap"))
            continue
        jp, size, _ = fm[name]
        r = grad_one(tu, name, jp, size)
        if r == "ok":
            grad.append(name)
            print(f"[GRAD] {name}")
        else:
            skip.append((name, r[5:]))
            print(f"[skip] {name} {r[5:]}")
    print(f"\n=== graduated {len(grad)} / {len(names)} ===")
    if grad:
        print("GRADUATED: " + ", ".join(grad))
        print(f"FRAGMENT: {FRAG} ({len(grad)} rows)")
    elif os.path.exists(FRAG) and os.path.getsize(FRAG) == 0:
        os.remove(FRAG)
    if skip:
        print("SKIPPED: " + "; ".join(f"{n}({r})" for n, r in skip))


if __name__ == "__main__":
    main()
