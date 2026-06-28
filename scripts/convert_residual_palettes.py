#!/usr/bin/env python3
"""Convert residual palette blobs (data/residual/*pal*.bin INCBIN'd by a live
src/data/*.c) into editable fe8u-form palette sources, byte-exact.

Classification (RGB555 bit-15):
  * If ANY 16-bit word has bit-15 set  -> .agbpal (raw RGB555, committed source,
    INCBIN'd directly; gbagfx drops bit-15 so it could not round-trip a .pal).
  * Else                               -> .pal (JASC, editable; the build rebuilds
    the .gbapal from it via the Makefile %.gbapal: %.pal rule).

Per palette:
  - locate the live INCBIN site (the src/.c that INCBINs data/residual/<name>.bin),
  - choose <dir> = first non-reuse graphics dir already used by that .c, else
    graphics/banim/pal for banim_pal_*, else graphics/misc,
  - .pal:   gbagfx extract -> rewrite JASC with the REAL numColors (gbagfx pads
            >16-color palettes to 256 on read; we truncate) -> VERIFY
            gbagfx <pal> -> <gbapal> == original .bin -> repoint INCBIN to
            "<dir>/<name>.gbapal" -> git rm the .bin.
  - .agbpal: cp .bin -> <dir>/<name>.agbpal (identical bytes) -> repoint INCBIN to
            "<dir>/<name>.agbpal" (direct) -> git rm the .bin.

Anything that is not a real palette (>256 colors, odd byte count) or that fails
the round-trip is SKIPPED (left as .bin) and recorded.

Usage: scripts/convert_residual_palettes.py            # do the conversion
       scripts/convert_residual_palettes.py --dry-run  # plan only (JSON)
"""
import os, re, sys, json, shutil, subprocess, tempfile

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RES = os.path.join(ROOT, 'data', 'residual')
GBAGFX = os.path.join(ROOT, 'tools', 'gbagfx', 'gbagfx')
os.chdir(ROOT)


def sh(args):
    return subprocess.run(args, check=True, capture_output=True, text=True)


def incbin_site(name):
    """(cfile, lineno0, full_line) for the live .c that INCBINs the .bin, else None."""
    try:
        out = subprocess.check_output(
            ['grep', '-rln', 'residual/%s.bin' % re.escape(name), 'src/'],
            text=True).strip().split('\n')
    except subprocess.CalledProcessError:
        return None
    out = [x for x in out if x]
    if not out:
        return None
    cf = out[0]
    lines = open(cf, encoding='utf-8', errors='surrogateescape').read().split('\n')
    for i, l in enumerate(lines):
        if ('residual/%s.bin' % name) in l:
            return (cf, i, l)
    return None


def sibling_dirs(cf):
    dirs = []
    for l in open(cf, encoding='utf-8', errors='surrogateescape'):
        for m in re.finditer(r'INCBIN_\w+\("(graphics/[^"]+)"\)', l):
            d = os.path.dirname(m.group(1))
            if '/reuse' not in d and d not in dirs:
                dirs.append(d)
    return dirs


def choose_dir(cf, name):
    sib = sibling_dirs(cf)
    if sib:
        return sib[0]
    if name.startswith('banim_pal_'):
        return 'graphics/banim/pal'
    return 'graphics/misc'


def classify(b):
    return any(((b[i] | (b[i + 1] << 8)) & 0x8000) for i in range(0, len(b) - 1, 2))


def extract_pal(bin_path, dst_pal):
    """gbagfx-extract + truncate to real numColors; returns the written .pal path."""
    b = open(bin_path, 'rb').read()
    n = len(b) // 2
    with tempfile.TemporaryDirectory() as td:
        gp = os.path.join(td, 'in.gbapal')
        full = os.path.join(td, 'full.pal')
        shutil.copy(bin_path, gp)
        sh([GBAGFX, gp, full])
        lines = open(full, 'rb').read().split(b'\r\n')
        # lines: [JASC-PAL, 0100, numColors, color0, color1, ...]
        out = [b'JASC-PAL', b'0100', str(n).encode()] + lines[3:3 + n]
        data = b'\r\n'.join(out) + b'\r\n'
    os.makedirs(os.path.dirname(dst_pal), exist_ok=True)
    open(dst_pal, 'wb').write(data)
    return n


def verify_pal_roundtrip(pal_path, orig_bin):
    with tempfile.TemporaryDirectory() as td:
        rt = os.path.join(td, 'rt.gbapal')
        sh([GBAGFX, pal_path, rt])
        return open(rt, 'rb').read() == open(orig_bin, 'rb').read()


def repoint(cf, lineno, name, new_incbin_path):
    lines = open(cf, encoding='utf-8', errors='surrogateescape').read().split('\n')
    old = lines[lineno]
    new = old.replace('data/residual/%s.bin' % name, new_incbin_path)
    assert new != old, 'no change in %s:%d' % (cf, lineno)
    lines[lineno] = new
    open(cf, 'w', encoding='utf-8', errors='surrogateescape').write('\n'.join(lines))


def build_plan():
    pal_bins = sorted(f for f in os.listdir(RES) if f.endswith('.bin') and 'pal' in f.lower())
    plan = []
    for fb in pal_bins:
        name = fb[:-4]
        bin_path = os.path.join(RES, fb)
        b = open(bin_path, 'rb').read()
        site = incbin_site(name)
        rec = dict(name=name, size=len(b), ncolors=len(b) // 2)
        if site is None:
            rec.update(action='skip', reason='no live INCBIN site')
            plan.append(rec); continue
        cf, ln, line = site
        rec.update(cf=cf, ln=ln)
        if len(b) % 2 != 0:
            rec.update(action='skip', reason='odd byte count (not RGB555)')
            plan.append(rec); continue
        high = classify(b)
        d = choose_dir(cf, name)
        if high:
            rec.update(action='agbpal', dir=d,
                       dst=os.path.join(d, name + '.agbpal'),
                       incbin='%s/%s.agbpal' % (d, name))
        else:
            if rec['ncolors'] > 256:
                rec.update(action='skip',
                           reason='%d colors > 256 JASC max (not a palette)' % rec['ncolors'])
                plan.append(rec); continue
            rec.update(action='pal', dir=d,
                       dst=os.path.join(d, name + '.pal'),
                       incbin='%s/%s.gbapal' % (d, name))
        plan.append(rec)
    return plan


def main():
    dry = '--dry-run' in sys.argv
    plan = build_plan()
    if dry:
        print(json.dumps(plan, indent=1))
        return
    done_pal, done_agbpal, skipped = [], [], []
    for rec in plan:
        name = rec['name']
        if rec['action'] == 'skip':
            skipped.append(dict(name=name, reason=rec['reason']))
            continue
        bin_path = os.path.join(RES, name + '.bin')
        if rec['action'] == 'agbpal':
            os.makedirs(rec['dir'], exist_ok=True)
            shutil.copy(bin_path, rec['dst'])
            assert open(rec['dst'], 'rb').read() == open(bin_path, 'rb').read()
            repoint(rec['cf'], rec['ln'], name, rec['incbin'])
            sh(['git', 'rm', '-q', '--', 'data/residual/%s.bin' % name])
            done_agbpal.append(name)
        else:  # pal
            try:
                extract_pal(bin_path, rec['dst'])
                if not verify_pal_roundtrip(rec['dst'], bin_path):
                    os.remove(rec['dst'])
                    skipped.append(dict(name=name, reason='gbagfx .pal round-trip mismatch'))
                    continue
            except Exception as e:
                if os.path.exists(rec['dst']):
                    os.remove(rec['dst'])
                skipped.append(dict(name=name, reason='extract/verify error: %s' % e))
                continue
            repoint(rec['cf'], rec['ln'], name, rec['incbin'])
            sh(['git', 'rm', '-q', '--', 'data/residual/%s.bin' % name])
            done_pal.append(name)
    print(json.dumps(dict(pal=done_pal, agbpal=done_agbpal, skipped=skipped,
                          n_pal=len(done_pal), n_agbpal=len(done_agbpal),
                          n_skipped=len(skipped)), indent=1))


if __name__ == '__main__':
    main()
