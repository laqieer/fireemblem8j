#!/usr/bin/env python3
"""Graduate TRIVIAL region-different descriptive-asm functions to matching C.

The gbadisasm pass dumped every unmatched JP function as descriptive asm without
ever trying to recompile it. The trivial ones recompile to byte-identical code:

  bx lr                       ->  void NAME(void) {}
  movs r0, #N ; bx lr         ->  int  NAME(void) { return N; }

Both are deterministic agbcc codegen (verified by `make compare`). This ADDS
matching-C functions (calcprogress axis 2). Names stay as-is (placeholder
sub_/nullsub_ — the JP real name is genuinely unknown for these dummy stubs;
the US decomp auto-names them the same way), so the named axis is unchanged.

SKIPS the libgcc/BIOS hand-asm region 0x080D6000..0x080DBFFF (svc wrappers etc.
that agbcc cannot emit) and anything not matching a known-trivial signature.

Safe: carves in sub-batches, runs `make compare` after each, and reverts the
whole sub-batch on any sha1 failure (so the build is never left broken).

Usage:
  scripts/carve_trivial_funcs.py --list        # print plan, carve nothing
  scripts/carve_trivial_funcs.py --limit N      # carve at most N functions
  scripts/carve_trivial_funcs.py --batch B      # make compare every B funcs (default 30)
  scripts/carve_trivial_funcs.py                # carve all eligible
"""
import os, re, sys, glob, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

BIOS_LO, BIOS_HI = 0x080D6000, 0x080DBFFF   # libgcc/BIOS hand-asm region -> skip


def body_of(name):
    """Stripped instruction list of asm/<name>.s, or None."""
    sf = f'asm/{name}.s'
    if not os.path.exists(sf):
        return None
    out, started = [], False
    for ln in open(sf):
        s = ln.strip()
        if re.match(rf'{re.escape(name)}:', s):
            started = True
            continue
        if not started or not s or s.startswith('@') or s.startswith('.'):
            continue
        out.append(re.sub(r'\s+', ' ', s))
    return out


_LD = {'ldrb': ('u8', 1), 'ldrh': ('u16', 2), 'ldr': ('u32', 4)}
_ST = {'strb': ('u8', 1), 'strh': ('u16', 2), 'str': ('u32', 4)}


def _idx(n, unit):
    """byte offset -> element index for a `type*` deref, or None if unaligned."""
    return n // unit if n % unit == 0 else None


_HDR = '#include "global.h"\n\n'


def c_for(name, body):
    """Return C source string for a recognised trivial body, else None.

    Deterministic agbcc codegen; `make compare` is still the oracle (auto-revert).
    """
    inner = _c_body(name, body)
    return _HDR + inner if inner else None


def _c_body(name, body):
    if body == ['bx lr']:
        return f'void {name}(void)\n{{\n}}\n'
    if len(body) == 2 and body[1] == 'bx lr':
        m = re.fullmatch(r'movs r0, #(0x[0-9a-fA-F]+|\d+)', body[0])
        if m:
            return f'int {name}(void)\n{{\n    return {m.group(1)};\n}}\n'
        # getter:  ld* r0, [r0, #N] ; bx lr   ->  T f(T *p){ return p[N/u]; }
        m = re.fullmatch(r'(ldrb|ldrh|ldr) r0, \[r0(?:, #(0x[0-9a-fA-F]+|\d+))?\]', body[0])
        if m:
            t, u = _LD[m.group(1)]
            n = int(m.group(2), 0) if m.group(2) else 0
            i = _idx(n, u)
            if i is not None:
                ret = 'u32' if t == 'u32' else 'int'
                return f'{ret} {name}({t} *p)\n{{\n    return p[{i}];\n}}\n'
    if len(body) == 2 and body[1] == 'bx lr':
        # setter:  st* r1, [r0, #N] ; bx lr   ->  void f(T *p, T v){ p[N/u] = v; }
        m = re.fullmatch(r'(strb|strh|str) r1, \[r0(?:, #(0x[0-9a-fA-F]+|\d+))?\]', body[0])
        if m:
            t, u = _ST[m.group(1)]
            n = int(m.group(2), 0) if m.group(2) else 0
            i = _idx(n, u)
            if i is not None:
                return f'void {name}({t} *p, {t} v)\n{{\n    p[{i}] = v;\n}}\n'
    if len(body) == 3 and body[0] == 'movs r1, #0' and body[2] == 'bx lr':
        # zero-store:  movs r1,#0 ; st* r1, [r0, #N] ; bx lr -> void f(T *p){ p[N/u]=0; }
        m = re.fullmatch(r'(strb|strh|str) r1, \[r0(?:, #(0x[0-9a-fA-F]+|\d+))?\]', body[1])
        if m:
            t, u = _ST[m.group(1)]
            n = int(m.group(2), 0) if m.group(2) else 0
            i = _idx(n, u)
            if i is not None:
                return f'void {name}({t} *p)\n{{\n    p[{i}] = 0;\n}}\n'
    return None


def eligible():
    """(addr_hex, name, frag_path) for every trivial still-asm gbadisasm func."""
    out = []
    for frag in sorted(glob.glob('layout/carved_rom.d/gbadisasm_*.tsv')):
        lines = open(frag).read().splitlines()
        if len(lines) != 1:
            continue                       # only clean one-function fragments
        p = lines[0].split('\t')
        if len(p) < 3:
            continue
        try:
            a = int(p[0], 16)
        except ValueError:
            continue
        if BIOS_LO <= 0x08000000 + a <= BIOS_HI:
            continue
        m = re.search(r'\.text\.(\w+)', p[2]) or re.search(r'asm/(\w+)\.o', p[2])
        if not m:
            continue
        name = m.group(1)
        b = body_of(name)
        if b is None:
            continue
        if c_for(name, b) is not None:
            out.append((p[0], name, frag, b))
    out.sort()
    return out


def sh(c):
    return subprocess.run(c, shell=True, capture_output=True, text=True)


def make_compare():
    r = sh('make compare')
    return 'fireemblem8.gba: OK' in (r.stdout + r.stderr)


TSV = 'layout/carved_rom.d/trivial_funcs.tsv'


def carve_one(addr, name, frag, body):
    """Write C, add layout row, remove asm placement+source. Returns rollback tuple."""
    cfile = f'src/{name}.c'
    open(cfile, 'w').write(c_for(name, body))
    end = open(frag).read().split('\t')[1]   # true end addr (col 1 of the fragment)
    with open(TSV, 'a') as f:
        f.write(f'{addr}\t{end}\tsrc/{name}.o(.text)\ttrivial_funcs(run): {name}\n')
    sh(f'git rm -q "{frag}" "asm/{name}.s"')
    return cfile, frag, name


def revert(carved, tsv_snapshot):
    """Restore exactly to the pre-chunk state (snapshot-based, not line-matching)."""
    open(TSV, 'w').write(tsv_snapshot)        # exact pre-chunk TSV
    for cfile, frag, name in carved:
        if os.path.exists(cfile):
            os.remove(cfile)
        sh(f'git checkout HEAD -- "{frag}" "asm/{name}.s"')


def main():
    args = sys.argv[1:]
    limit = next((int(args[i+1]) for i, a in enumerate(args) if a == '--limit'), None)
    batch = next((int(args[i+1]) for i, a in enumerate(args) if a == '--batch'), 30)
    plan = eligible()
    if limit:
        plan = plan[:limit]
    print(f"eligible trivial funcs: {len(plan)}")
    if '--list' in args:
        for addr, name, frag, body in plan:
            print(f"  {addr}  {name:22s}  {' ; '.join(body)}")
        return
    if not os.path.exists(TSV):
        open(TSV, 'w').close()
    done, failed = 0, []
    for i in range(0, len(plan), batch):
        chunk = plan[i:i+batch]
        snap = open(TSV).read()               # exact TSV before this chunk
        carved = [carve_one(*c) for c in chunk]
        if make_compare():
            done += len(carved)
            print(f"  [{done}/{len(plan)}] sub-batch OK ({len(carved)} funcs)")
        else:
            print(f"  sub-batch FAILED at {i}; bisecting...")
            revert(carved, snap)
            # bisect one-by-one to salvage the good ones
            for c in chunk:
                s1 = open(TSV).read()
                cc = [carve_one(*c)]
                if make_compare():
                    done += 1
                else:
                    revert(cc, s1)
                    failed.append(c[1])
            print(f"  [{done}/{len(plan)}] after bisect; {len(failed)} failed so far")
    print(f"DONE: carved {done}, failed {len(failed)}")
    if failed:
        print("  failed:", ' '.join(failed[:30]))


if __name__ == '__main__':
    main()
