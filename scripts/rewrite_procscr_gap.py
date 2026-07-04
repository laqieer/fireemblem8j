#!/usr/bin/env python3
"""rewrite_procscr_gap.py -- #148 in-place gap rewriter for asm-sourced proc blobs.

For a frontier-data .c whose proc scripts already live as inline symbolized
`.4byte` `__asm__` blob sections (an earlier shiftability pass turned every ROM
pointer into a relocatable symbol), this regenerates ONE OR MORE gap sections,
carving each named proc in the worklist into an in-place typed
`struct ProcCmd NAME[]` (same `.data.<file>.<gap>` section) while leaving all
surrounding data words + `.global` labels as `.4byte` asm.

Because every contribution stays in the SAME section and is emitted in source
order, GNU as concatenates them byte-for-byte in place -- the layout row for the
gap is unchanged and `make compare` (sha1) is the only oracle.

Usage:
    python3 scripts/rewrite_procscr_gap.py <file.c> <sectionbase> <worklist.tsv> \
        --nm /tmp/nm.txt --gaps gap1 gap2 ...
      sectionbase e.g. .data.frontier_df4_banim_a
      worklist.tsv cols: name  0xADDR  gapN   (only rows whose gap is requested)
Prints the collected referenced-symbol set (for extern emission) to stdout.
"""
import argparse
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import depoint_procscr as dp

ROM = 0x08000000


def numval(t):
    t = t.strip()
    return int(t, 0) if re.fullmatch(r'0x[0-9A-Fa-f]+|\d+', t) else None


def decode_proc(words, wi, syms):
    """Decode a ProcCmd table starting at words[wi]. Return (end_addr, body, refs, ok)."""
    body = []
    refs = {}
    k = wi
    ok = False
    while k + 1 < len(words):
        w0, w1 = words[k], words[k + 1]
        if w0['size'] != 4 or w1['size'] != 4:
            break
        v0 = numval(w0['text'])
        if v0 is None:
            break
        op16 = v0 & 0xFFFF
        if op16 not in dp.OPCODES:
            break
        op = v0 & 0xFF
        imm = (v0 >> 16) & 0xFFFF
        macro, kind = dp.OPCODES[op16]
        v1 = numval(w1['text'])
        if v1 is None:
            optext = dp.csym(w1['text'])
        else:
            optext, _ = dp.resolve(v1, kind or 'data', syms)
        ident = dp.extract_ident(optext)
        if ident is not None:
            is_func = kind in ('func', 'func_arg')
            if refs.get(ident) != 'func':
                refs[ident] = 'func' if is_func else 'data'
        if kind is None:
            line = macro if v1 in (0, None) else "{ 0x%02X, 0x%04X, %s }" % (op, imm, optext)
        elif kind == 'imm':
            line = "%s(0x%X)" % (macro, imm)
        elif kind == 'func_arg':
            line = "%s(%s, 0x%X)" % (macro, optext, imm)
        else:
            line = "%s(%s)" % (macro, optext)
        body.append(line)
        k += 2
        if op16 == 0x00:
            ok = True
            break
    end = words[k - 1]['addr'] + words[k - 1]['size'] if k > wi else words[wi]['addr']
    return end, body, refs, ok


def find_block(lines, secbase, gap):
    """Return (block_start_idx, block_end_idx) for the __asm__ block of this gap."""
    needle = '.section ' + secbase + '.' + gap + ','
    for i, l in enumerate(lines):
        if needle in l:
            j = i
            while j > 0 and '__asm__(' not in lines[j]:
                j -= 1
            k = i
            while k < len(lines) and lines[k].strip() != ');':
                k += 1
            return j, k
    return None, None


def parse_block(lines, bs, be, secbase):
    tokens = []
    addr = None
    base = None
    for i in range(bs, be + 1):
        l = lines[i]
        if '.section' in l or '__asm__(' in l or l.strip() == ');':
            continue
        mg = re.search(r'\.global\s+(\w+)', l)
        if mg:
            tokens.append({'t': 'global', 'name': mg.group(1)})
            continue
        ml = re.match(r'\s*"(\w+):\\n"', l)
        if ml:
            name = ml.group(1)
            m2 = re.search(r'_([0-9A-Fa-f]{5,8})$', name)
            if base is None and m2:
                base = ROM + int(m2.group(1), 16)
                addr = base
            tokens.append({'t': 'label', 'name': name, 'addr': addr})
            continue
        mi = dp.ITEM_RE.search(l)
        if mi:
            kind, operand = mi.group(1), mi.group(2).strip()
            esize = {'4byte': 4, 'short': 2, 'byte': 1}.get(kind)
            if esize is None:
                tokens.append({'t': 'raw', 'line': l})
                continue
            for tok in operand.split(','):
                tok = tok.strip()
                if not tok:
                    continue
                tokens.append({'t': 'word', 'text': tok, 'addr': addr, 'size': esize})
                addr += esize
            continue
    return tokens, base


def regen(tokens, secbase, gap, procs, syms):
    sec_line = '"\t.section ' + secbase + '.' + gap + ', \\"aw\\", %progbits\\n"'
    words = [t for t in tokens if t['t'] == 'word']
    addr2wi = {t['addr']: k for k, t in enumerate(words)}
    ranges = {}
    allrefs = {}
    for name, start in sorted(procs, key=lambda x: x[1]):
        wi = addr2wi.get(start)
        if wi is None:
            sys.stderr.write("WARN %s @ 0x%X not word-aligned; SKIP\n" % (name, start))
            continue
        end, body, refs, ok = decode_proc(words, wi, syms)
        if not ok:
            sys.stderr.write("WARN %s @ 0x%X no clean PROC_END; SKIP\n" % (name, start))
            continue
        ranges[start] = (start, end, name, body)
        for kk, vv in refs.items():
            allrefs[kk] = 'func' if (vv == 'func' or allrefs.get(kk) == 'func') else 'data'
    starts = set(ranges)
    covered = set()
    for s, (s2, e, n, b) in ranges.items():
        a = s
        while a < e:
            covered.add(a)
            a += 4

    out = []
    asm_open = [False]
    wordbuf = []

    def flush_wordbuf():
        i = 0
        while i < len(wordbuf):
            sz = wordbuf[i][1]
            run = []
            while i < len(wordbuf) and wordbuf[i][1] == sz and len(run) < 6:
                run.append(wordbuf[i][0])
                i += 1
            dirn = {4: '.4byte', 2: '.short', 1: '.byte'}[sz]
            out.append('"\t%s %s\\n"' % (dirn, ', '.join(run)))
        wordbuf.clear()

    def ensure_asm():
        if not asm_open[0]:
            out.append('__asm__(')
            out.append(sec_line)
            asm_open[0] = True

    def close_asm():
        if asm_open[0]:
            flush_wordbuf()
            out.append(');')
            asm_open[0] = False

    skip_until = None
    for t in tokens:
        if t['t'] == 'word':
            a = t['addr']
            if skip_until is not None and a < skip_until:
                continue
            if a in starts:
                flush_wordbuf()
                close_asm()
                s, e, n, body = ranges[a]
                out.append('struct ProcCmd %s[] __attribute__((section("%s.%s"))) = {'
                           % (n, secbase, gap))
                for j in range(0, len(body), 4):
                    out.append('    ' + ', '.join(body[j:j + 4]) + ',')
                out.append('};')
                skip_until = e
                continue
            ensure_asm()
            wordbuf.append((t['text'], t['size']))
        elif t['t'] in ('global', 'label'):
            la = t.get('addr')
            if t['t'] == 'label' and la is not None and la in covered and la not in starts:
                sys.stderr.write("WARN label %s @ 0x%X inside carved proc; DROP\n" % (t['name'], la))
                continue
            if t['t'] == 'global':
                # look ahead is hard; emit global only if its label survives.
                pass
            ensure_asm()
            flush_wordbuf()
            if t['t'] == 'global':
                out.append('"\t.global %s\\n"' % t['name'])
            else:
                out.append('"%s:\\n"' % t['name'])
        elif t['t'] == 'raw':
            ensure_asm()
            flush_wordbuf()
            out.append(t['line'])
    close_asm()
    return out, allrefs, starts


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('cfile')
    ap.add_argument('secbase')
    ap.add_argument('worklist')
    ap.add_argument('--nm', default='/tmp/nm.txt')
    ap.add_argument('--gaps', nargs='+', required=True)
    args = ap.parse_args()
    syms = dp.load_nm(args.nm)

    wl = {}
    for ln in open(args.worklist):
        p = ln.split()
        if len(p) < 3:
            continue
        wl.setdefault(p[2], []).append((p[0], int(p[1], 16)))

    lines = open(args.cfile).read().split('\n')
    all_refs = {}
    all_starts = set()
    carved = 0
    for gap in args.gaps:
        procs = wl.get(gap, [])
        if not procs:
            sys.stderr.write("no procs for %s\n" % gap)
            continue
        bs, be = find_block(lines, args.secbase, gap)
        if bs is None:
            sys.stderr.write("block for %s not found\n" % gap)
            continue
        tokens, base = parse_block(lines, bs, be, args.secbase)
        newblk, refs, starts = regen(tokens, args.secbase, gap, procs, syms)
        lines = lines[:bs] + newblk + lines[be + 1:]
        for kk, vv in refs.items():
            all_refs[kk] = 'func' if (vv == 'func' or all_refs.get(kk) == 'func') else 'data'
        all_starts |= starts
        carved += len(starts)
        sys.stderr.write("%s: carved %d procs\n" % (gap, len(starts)))

    open(args.cfile, 'w').write('\n'.join(lines))
    sys.stderr.write("TOTAL carved %d procs\n" % carved)
    # emit refs for extern handling
    for name in sorted(all_refs):
        print("%s\t%s" % (all_refs[name], name))


if __name__ == '__main__':
    main()
