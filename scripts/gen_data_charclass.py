#!/usr/bin/env python3
"""Generate src/data/data_characters.c + src/data/data_classes.c for FE8J.

The character & class data tables are region-DIFFERENT from fe8u (text IDs,
some base/growth stats, and all pointer targets differ), but the STRUCT LAYOUT
and the per-row *structure* (which fields are set, which classes carry a
_pU50 pointer, etc.) are identical. This decodes the JP ROM bytes through the
fe8u `struct CharacterData` / `struct ClassData` layouts and re-emits typed C,
re-using the symbolic constants (CHARACTER_*/CLASS_*/ITYPE_*/WPN_EXP_*/
UNIT_AFFIN_*/CA_*) exactly as the fe8u source does.

Pointer fields in gClassData resolve to JP symbols: 95 are already in
sym_jp.txt; the names of the rest are transferred from the fe8u class-data
source by per-class-index field correspondence and registered in
layout/baseline_syms.d/dataCharClass.tsv. Correspondence is validated by the
fact that the JP set of classes with a nonzero _pU50 byte-for-byte matches the
fe8u set.

`make compare` (sha1 of the whole ROM) is the oracle; this script is a
reproducible transcription, not a guess.

Usage:  python3 scripts/gen_data_charclass.py   # writes both src/data/*.c
"""
import os, re, struct, sys

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ROM = os.path.join(REPO, 'baserom.gba')
US = os.path.join(REPO, '..', '..', '..', 'fireemblem8u')  # reference (for pointer names)
# fall back to the canonical reference path when run outside a worktree
if not os.path.isdir(os.path.join(US, 'src')):
    US = '/home/laqieer/fireemblem8u'

CHAR_BASE, CHAR_COUNT, CHAR_SZ = 0x8582BC, 256, 0x34
CLASS_BASE, CLASS_COUNT, CLASS_SZ = 0x85B6BC, 127, 0x54


def parse_enum(path, prefix):
    out, cur = {}, 0
    for m in re.finditer(r'\b(' + prefix + r'\w+)\s*(?:=\s*([^,\n}]+))?', open(path).read()):
        n, v = m.group(1), m.group(2)
        if v is None:
            out[n] = cur; cur += 1
        else:
            try:
                ev = eval(v.strip(), {}, dict(out)); out[n] = ev; cur = ev + 1
            except Exception:
                pass
    return out


def inv(d):
    r = {}
    for k, v in d.items():
        r.setdefault(v, k)
    return r


def s8(b):
    return b - 256 if b >= 128 else b


INC = os.path.join(REPO, 'include')
chars = parse_enum(os.path.join(INC, 'constants/characters.h'), 'CHARACTER_')
classes = parse_enum(os.path.join(INC, 'constants/classes.h'), 'CLASS_')
affin = parse_enum(os.path.join(INC, 'bmunit.h'), 'UNIT_AFFIN_')
CHAR_BY_VAL, CLASS_BY_VAL, AFFIN_BY_VAL = inv(chars), inv(classes), inv(affin)

bm = open(os.path.join(INC, 'bmunit.h')).read()
CA_FLAGS = [(1 << int(m.group(2)), 'CA_' + m.group(1))
            for m in re.finditer(r'\bCA_(\w+)\s*=\s*\(1 << (\d+)\)', bm)]
flagmap = {n: b for b, n in CA_FLAGS}
CA_ALIAS = []
for m in re.finditer(r'\bCA_(\w+)\s*=\s*((?:CA_\w+\s*\|\s*)+CA_\w+)', bm):
    try:
        val = 0
        for n in re.findall(r'CA_\w+', m.group(2)):
            val |= flagmap[n]
        CA_ALIAS.append((val, 'CA_' + m.group(1)))
    except KeyError:
        pass

ITYPE = ['ITYPE_SWORD', 'ITYPE_LANCE', 'ITYPE_AXE', 'ITYPE_BOW', 'ITYPE_STAFF',
         'ITYPE_ANIMA', 'ITYPE_LIGHT', 'ITYPE_DARK']
WPN_EXP = {0: 'WPN_EXP_0', 1: 'WPN_EXP_E', 31: 'WPN_EXP_D', 71: 'WPN_EXP_C',
           121: 'WPN_EXP_B', 181: 'WPN_EXP_A', 251: 'WPN_EXP_S'}


def attr_expr(v):
    if v == 0:
        return None
    parts, rem = [], v
    for mask, name in sorted(CA_ALIAS, key=lambda x: -bin(x[0]).count('1')):
        if (rem & mask) == mask:
            parts.append(name); rem &= ~mask
    for bit, name in CA_FLAGS:
        if rem & bit:
            parts.append(name); rem &= ~bit
    if rem:
        parts.append(hex(rem))
    return ' | '.join(parts)


rom = open(ROM, 'rb').read()

# ---- sym_jp address->name ----
sym = {}
for line in open(os.path.join(REPO, 'sym_jp.txt')):
    m = re.match(r'(\w+)\s*=\s*(0x[0-9A-Fa-f]+);', line)
    if m:
        sym[int(m.group(2), 16)] = m.group(1)


def gen_characters():
    out = ['#include "global.h"', '#include "bmunit.h"', '#include "bmitem.h"',
           '#include "bmreliance.h"', '#include "constants/characters.h"',
           '#include "constants/classes.h"', '#include "constants/items.h"', '',
           'CONST_DATA struct CharacterData gCharacterData[] = {']
    for i in range(CHAR_COUNT):
        e = rom[CHAR_BASE + i*CHAR_SZ: CHAR_BASE + (i+1)*CHAR_SZ]
        g16 = lambda o: e[o] | (e[o+1] << 8)
        number = e[4]
        L = []
        f = lambda n, v: L.append('        .%s = %s,' % (n, v))
        if g16(0): f('nameTextId', '0x%x' % g16(0))
        if g16(2): f('descTextId', '0x%x' % g16(2))
        if number: f('number', CHAR_BY_VAL.get(number, '0x%x' % number))
        if e[5]: f('defaultClass', CLASS_BY_VAL.get(e[5], '0x%x' % e[5]))
        if g16(6): f('portraitId', '0x%x' % g16(6))
        if e[8]: f('miniPortrait', '0x%x' % e[8])
        if e[9]: f('affinity', AFFIN_BY_VAL.get(e[9], '0x%x' % e[9]))
        if e[10]: f('sort_order', '0x%x' % e[10])
        if s8(e[11]): f('baseLevel', '%d' % s8(e[11]))
        for nm, o in [('baseHP', 12), ('basePow', 13), ('baseSkl', 14), ('baseSpd', 15),
                      ('baseDef', 16), ('baseRes', 17), ('baseLck', 18), ('baseCon', 19)]:
            if s8(e[o]): f(nm, '%d' % s8(e[o]))
        ranks = list(e[20:28])
        if any(ranks):
            L.append('        .baseRanks = {')
            for j, rv in enumerate(ranks):
                if rv:
                    L.append('            [%s] = %s,' % (ITYPE[j], WPN_EXP.get(rv, '0x%x' % rv)))
            L.append('        },')
        for nm, o in [('growthHP', 28), ('growthPow', 29), ('growthSkl', 30), ('growthSpd', 31),
                      ('growthDef', 32), ('growthRes', 33), ('growthLck', 34)]:
            if e[o]: f(nm, '%d' % e[o])
        if e[35]: f('_u23', '0x%x' % e[35])
        if e[36]: f('_u24', '0x%x' % e[36])
        if e[37] or e[38]:
            L.append('        ._u25 = { 0x%x, 0x%x },' % (e[37], e[38]))
        if e[39]: f('_u27', '0x%x' % e[39])
        ax = attr_expr(struct.unpack('<I', e[40:44])[0])
        if ax: f('attributes', ax)
        psupp = struct.unpack('<I', e[44:48])[0]
        if psupp:
            assert psupp in sym, 'unknown pSupportData 0x%x' % psupp
            f('pSupportData', '&%s' % sym[psupp])
        if e[48]: f('visit_group', '0x%x' % e[48])
        assert not any(e[49:52]), 'nonzero pad entry %d' % i
        if not L:
            continue
        if number and number in CHAR_BY_VAL and chars[CHAR_BY_VAL[number]] - 1 == i:
            idx = '[%s - 1]' % CHAR_BY_VAL[number]
        elif i == CHAR_COUNT - 1:
            idx = '[0x%X - 1]' % CHAR_COUNT
        else:
            idx = '[%d]' % i
        out.append('    %s = {' % idx)
        out.extend(L)
        out.append('    },')
    out += ['};', '']
    return '\n'.join(out)


def resolve_class_ptrs():
    """Return {addr: name} for all gClassData pointer targets and a per-index
    field map, transferring fe8u source names by class-index correspondence."""
    src = open(os.path.join(US, 'src', 'data_classes.c')).read()
    entries = re.split(r'\n    \[', src)
    us = []
    for e in entries[1:]:
        mi = re.match(r'(CLASS_\w+) - 1\]', e)
        mi2 = re.match(r'(0x[0-9A-Fa-f]+) - 1\]', e)
        if mi: idx = classes[mi.group(1)] - 1
        elif mi2: idx = int(mi2.group(1), 16) - 1
        else: continue
        d = {}
        for key, pat in [('banim', r'\.pBattleAnimDef = (\w+)'),
                         ('avo', r'\.pTerrainAvoidLookup = (\w+)'),
                         ('def', r'\.pTerrainDefenseLookup = (\w+)'),
                         ('res', r'\.pTerrainResistanceLookup = (\w+)'),
                         ('_pU50', r'\._pU50 = &(\w+)')]:
            m = re.search(pat, e)
            d[key] = m.group(1) if m else None
        mv = re.search(r'\.pMovCostTable = \{\s*(\w+),\s*(\w+),\s*(\w+)', e)
        d['mov'] = mv.groups() if mv else None
        us.append((idx, d))
    addr2name = {}
    field_for_idx = {}
    for idx, d in sorted(us):
        e = rom[CLASS_BASE + idx*CLASS_SZ: CLASS_BASE + (idx+1)*CLASS_SZ]
        g = lambda o: struct.unpack('<I', e[o:o+4])[0]
        cand = []
        if d['banim']: cand.append((0x34, d['banim']))
        if d['mov']:
            for k in range(3): cand.append((0x38 + 4*k, d['mov'][k]))
        if d['avo']: cand.append((0x44, d['avo']))
        if d['def']: cand.append((0x48, d['def']))
        if d['res']: cand.append((0x4C, d['res']))
        if d['_pU50']: cand.append((0x50, d['_pU50']))
        for off, usname in cand:
            ad = g(off)
            if ad and ad not in addr2name:
                addr2name[ad] = sym.get(ad, usname)
        field_for_idx[idx] = {o: g(o) for o in (0x34, 0x38, 0x3C, 0x40, 0x44, 0x48, 0x4C, 0x50)}
    return addr2name, field_for_idx


def gen_classes():
    addr2name, _ = resolve_class_ptrs()

    def pname(addr):
        if addr == 0:
            return None
        assert addr in addr2name, 'unnamed class ptr 0x%x' % addr
        return addr2name[addr]

    out = ['#include "global.h"', '#include "bmunit.h"', '#include "bmitem.h"',
           '#include "ekrbattle.h"', '#include "constants/classes.h"', '',
           'CONST_DATA struct ClassData gClassData[] = {']
    for i in range(CLASS_COUNT):
        e = rom[CLASS_BASE + i*CLASS_SZ: CLASS_BASE + (i+1)*CLASS_SZ]
        g16 = lambda o: e[o] | (e[o+1] << 8)
        g32 = lambda o: struct.unpack('<I', e[o:o+4])[0]
        number = e[4]
        L = []
        f = lambda n, v: L.append('        .%s = %s,' % (n, v))
        if g16(0): f('nameTextId', '0x%x' % g16(0))
        if g16(2): f('descTextId', '0x%x' % g16(2))
        if number: f('number', CLASS_BY_VAL.get(number, '0x%x' % number))
        if e[5]: f('promotion', CLASS_BY_VAL.get(e[5], '0x%x' % e[5]))
        if e[6]: f('SMSId', '0x%x' % e[6])
        if e[7]: f('slowWalking', '0x%x' % e[7])
        if g16(8): f('defaultPortraitId', '0x%x' % g16(8))
        if e[0xA]: f('sort_order', '0x%x' % e[0xA])
        for nm, o in [('baseHP', 0xB), ('basePow', 0xC), ('baseSkl', 0xD), ('baseSpd', 0xE),
                      ('baseDef', 0xF), ('baseRes', 0x10), ('baseCon', 0x11), ('baseMov', 0x12)]:
            if s8(e[o]): f(nm, '%d' % s8(e[o]))
        for nm, o in [('maxHP', 0x13), ('maxPow', 0x14), ('maxSkl', 0x15), ('maxSpd', 0x16),
                      ('maxDef', 0x17), ('maxRes', 0x18), ('maxCon', 0x19)]:
            if s8(e[o]): f(nm, '%d' % s8(e[o]))
        if s8(e[0x1A]): f('classRelativePower', '%d' % s8(e[0x1A]))
        for nm, o in [('growthHP', 0x1B), ('growthPow', 0x1C), ('growthSkl', 0x1D),
                      ('growthSpd', 0x1E), ('growthDef', 0x1F), ('growthRes', 0x20),
                      ('growthLck', 0x21)]:
            if s8(e[o]): f(nm, '%d' % s8(e[o]))
        for nm, o in [('promotionHp', 0x22), ('promotionPow', 0x23), ('promotionSkl', 0x24),
                      ('promotionSpd', 0x25), ('promotionDef', 0x26), ('promotionRes', 0x27)]:
            if e[o]: f(nm, '%d' % e[o])
        ax = attr_expr(g32(0x28))
        if ax: f('attributes', ax)
        ranks = list(e[0x2C:0x34])
        if any(ranks):
            L.append('        .baseRanks = {')
            for j, rv in enumerate(ranks):
                if rv:
                    L.append('            [%s] = %s,' % (ITYPE[j], WPN_EXP.get(rv, '0x%x' % rv)))
            L.append('        },')
        banim = pname(g32(0x34))
        if banim: f('pBattleAnimDef', banim)
        mov = [g32(0x38 + 4*k) for k in range(3)]
        if any(mov):
            L.append('        .pMovCostTable = {')
            for m in mov:
                L.append('            %s,' % (pname(m) if m else 'NULL'))
            L.append('        },')
        if pname(g32(0x44)): f('pTerrainAvoidLookup', pname(g32(0x44)))
        if pname(g32(0x48)): f('pTerrainDefenseLookup', pname(g32(0x48)))
        if pname(g32(0x4C)): f('pTerrainResistanceLookup', pname(g32(0x4C)))
        if pname(g32(0x50)): f('_pU50', '&%s' % pname(g32(0x50)))
        if not L:
            continue
        if number and number in CLASS_BY_VAL and classes[CLASS_BY_VAL[number]] - 1 == i:
            idx = '[%s - 1]' % CLASS_BY_VAL[number]
        else:
            idx = '[%d]' % i
        out.append('    %s = {' % idx)
        out.extend(L)
        out.append('    },')
    out += ['};', '']
    return '\n'.join(out), addr2name


def baseline_defined():
    """Names already declared in layout/baseline_syms (monolith + fragments).
    sym_jp.txt is NOT fed to the linker, so membership there does not satisfy a
    reference -- only baseline_syms (-> asm/jp_syms.s) does."""
    defined = set()
    paths = [os.path.join(REPO, 'layout', 'baseline_syms.tsv')]
    d = os.path.join(REPO, 'layout', 'baseline_syms.d')
    if os.path.isdir(d):
        for fn in os.listdir(d):
            if fn.endswith('.tsv'):
                paths.append(os.path.join(d, fn))
    for p in paths:
        if not os.path.exists(p):
            continue
        for ln in open(p):
            ln = ln.strip()
            if ln and not ln.startswith('#'):
                defined.add(ln.split('\t')[0])
    return defined


def main():
    cdir = os.path.join(REPO, 'src', 'data')
    open(os.path.join(cdir, 'data_characters.c'), 'w').write(gen_characters())
    classes_c, addr2name = gen_classes()
    open(os.path.join(cdir, 'data_classes.c'), 'w').write(classes_c)
    name2addr = {n: a for a, n in addr2name.items()}
    defined = baseline_defined()
    missing = sorted((name2addr[n], n) for n in name2addr if n not in defined)
    print('wrote src/data/data_characters.c, src/data/data_classes.c')
    print('class pointer syms: %d total, %d need a baseline_syms entry'
          % (len(addr2name), len(missing)))
    if '--emit-baseline' in sys.argv:
        path = os.path.join(REPO, 'layout', 'baseline_syms.d', 'dataCharClass.tsv')
        with open(path, 'w') as f:
            f.write('# gClassData pointer targets (terrain/anim tables) not already in\n'
                    '# layout/baseline_syms; addresses are JP, bytes already incbinned.\n')
            for a, n in missing:
                f.write('%s\t%08X\tdata\n' % (n, a))
        print('wrote', path)


if __name__ == '__main__':
    main()
