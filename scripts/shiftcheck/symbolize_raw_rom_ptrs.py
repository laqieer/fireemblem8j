#!/usr/bin/env python3
"""Rewrite raw absolute ROM-pointer literals into relocatable symbolic refs.

Companion transform to scan_raw_rom_ptrs.py. Raw `.4byte 0x08XXXXXX` pointer
literals hidden in opaque `__asm__` data blobs / hand-written asm carry NO
relocation, so under the +0x40000 shifted-ROM re-link they stay stale (point at
the vanilla, unshifted target) -> the engine reads garbage (issue #143: battle
animation sprites vanish). Replacing the raw hex with `Symbol` / `Symbol + N`
keeps `make compare` byte-identical (the assembler emits the same value) while
producing an R_ARM_ABS32 the shifted re-link tracks.

Byte-exact rules (matching ld's behaviour):
  * exact  : val == GLOBAL symbol start          -> `Sym`
  * thumb  : val odd, val-1 == GLOBAL sym start   -> `Sym + 1` (NOTYPE/OBJECT)
             (for a FUNC symbol ld re-ORs the Thumb bit -> emit bare `Sym`)
  * mid    : nearest preceding GLOBAL sym `S`     -> `S` (off 0) / `S + 0xOFF`
             Only applied in gated contexts (see CONFIG) because a raw ROM-range
             `.4byte` in a data blob may be packed non-pointer data (e.g. two
             OAM half-words 0x08110810) that must stay raw. A FUNC symbol with a
             non-zero addend is NEVER emitted (ld would OR the Thumb bit -> off
             by one); such a site is left raw and reported.

Cross-object LOCAL symbols (e.g. `frames.16`, `sObj_RainParticle1`) are not
referenceable from another translation unit, so they are handled via the mid
path (nearest preceding GLOBAL + offset), never by their local name.

Usage:
  scripts/shiftcheck/symbolize_raw_rom_ptrs.py            # dry-run report
  scripts/shiftcheck/symbolize_raw_rom_ptrs.py --apply    # rewrite files
  scripts/shiftcheck/symbolize_raw_rom_ptrs.py --apply --file asm/sub_80C05C8.s
Idempotent: symbolic operands are already non-hex, so re-runs are no-ops.
"""
import argparse
import bisect
import os
import re
import subprocess
import sys

ROM_LO = 0x08000000
ROM_HI = 0x0A000000
ROM_BASE_PIN = 0x08000000  # ROM header base: pinned under shift, never relocate.

# Per-file policy. `mid` selects which nearest-global mid-symbol values may be
# rewritten (packed non-pointer data must be left raw):
#   'pool'          literal pool of an RE'd function: every ROM .4byte is an
#                   address load -> symbolize all mids.
#   ('region',lo,hi) only symbolize mids whose value is in [lo, hi).
#   None            never symbolize mids (exact/thumb only).
CONFIG = {
    "src/data/frontier_df4_banim_b/frontier_df4_banim_b.c":
        {"mid": ("region", 0x08600000, 0x08F00000), "mid_max_off": 0x1000,
         # Confirmed genuine sheet/frame pointers below the anim-data region
         # (efxop config fields) that the region gate would otherwise leave raw.
         "mid_extra": {0x080E4C34}},
    "src/data/frontier_df4_uistuff/frontier_df4_uistuff.c":
        {"mid": ("region", 0x085C5E00, 0x085C5E60), "mid_max_off": 0x100},
    "src/data/gap_0001B9B0/gap_0001B9B0.s": {"mid": None},
    "src/data/rom_header_080000C0/rom_header_080000C0.s": {"mid": None},
    "asm/sub_80C05C8.s": {"mid": "pool"},
}

LIT_RE = re.compile(r"\.(?:4byte|word|long)\b", re.IGNORECASE)
HEX_RE = re.compile(r"0x0[89A-Fa-f][0-9A-Fa-f]{6}\b")


def load_globals(elf):
    out = subprocess.check_output(
        ["arm-none-eabi-readelf", "-sW", elf], text=True, errors="replace")
    g = {}
    for line in out.splitlines():
        p = line.split()
        if len(p) < 8 or not p[0].endswith(":"):
            continue
        try:
            val = int(p[1], 16)
        except ValueError:
            continue
        typ, bind, name = p[3], p[4], p[7]
        if typ not in ("FUNC", "OBJECT", "NOTYPE") or bind != "GLOBAL":
            continue
        if not name or name.startswith("$") or name == ".gcc2_compiled.":
            continue
        if not (ROM_LO <= val < ROM_HI):
            continue
        prio = {"FUNC": 3, "OBJECT": 2, "NOTYPE": 1}[typ]
        cur = g.get(val)
        if cur is None or prio > cur[2]:
            g[val] = (name, typ, prio)
    syms = {a: (n, t) for a, (n, t, _) in g.items()}
    return syms, sorted(syms)


def symbolize(val, syms, addrs, cfg):
    """Return (replacement_str, kind) or (None, reason) if it must stay raw."""
    if val == ROM_BASE_PIN:
        return None, "rombase-pinned"
    # exact global
    if val in syms:
        name, typ = syms[val]
        return name, "exact"
    # thumb global (val-1 is symbol start)
    if (val & 1) and (val - 1) in syms:
        name, typ = syms[val - 1]
        if typ == "FUNC":
            return name, "thumb-func"
        return "%s + 1" % name, "thumb"
    # mid: nearest preceding global
    mid = cfg.get("mid")
    if mid is None:
        return None, "mid-disabled"
    i = bisect.bisect_right(addrs, val) - 1
    if i < 0:
        return None, "no-preceding-sym"
    s = addrs[i]
    nxt = addrs[i + 1] if i + 1 < len(addrs) else ROM_HI
    if not (s < val < nxt):
        return None, "not-in-span"
    off = val - s
    name, typ = syms[s]
    if typ == "FUNC" and off != 0:
        return None, "func-nonzero-addend"
    # gate by policy
    if val in cfg.get("mid_extra", ()):
        pass
    elif mid == "pool":
        pass
    elif isinstance(mid, tuple) and mid[0] == "region":
        if not (mid[1] <= val < mid[2]):
            return None, "outside-region"
        if off > cfg.get("mid_max_off", 0x1000):
            return None, "offset-too-large"
    else:
        return None, "policy"
    return "%s + 0x%X" % (name, off), "mid"


def process_line(line, syms, addrs, cfg, stats):
    if not LIT_RE.search(line):
        return line
    # split operand region from an asm '@' comment (keep the comment intact)
    at = line.find("@", line.find(".") )
    if at != -1:
        operand, comment = line[:at], line[at:]
    else:
        operand, comment = line, ""

    def repl(m):
        val = int(m.group(0), 16)
        if not (ROM_LO <= val < ROM_HI):
            return m.group(0)
        rep, kind = symbolize(val, syms, addrs, cfg)
        if rep is None:
            stats.setdefault("skip:" + kind, 0)
            stats["skip:" + kind] += 1
            return m.group(0)
        stats.setdefault("fix:" + kind, 0)
        stats["fix:" + kind] += 1
        return rep

    operand = HEX_RE.sub(repl, operand)
    return operand + comment


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", default="fireemblem8.elf")
    ap.add_argument("--apply", action="store_true", help="write changes")
    ap.add_argument("--file", action="append", dest="files",
                    help="limit to these files (default: all in CONFIG)")
    args = ap.parse_args()
    root = subprocess.check_output(
        ["git", "rev-parse", "--show-toplevel"], text=True).strip()
    os.chdir(root)
    if not os.path.exists(args.elf):
        sys.stderr.write("error: %s missing (run make compare)\n" % args.elf)
        return 2
    syms, addrs = load_globals(args.elf)
    files = args.files or list(CONFIG)
    grand = {}
    for f in files:
        cfg = CONFIG.get(f)
        if cfg is None:
            sys.stderr.write("warning: %s not in CONFIG, skipping\n" % f)
            continue
        with open(f, encoding="utf-8", errors="replace") as fh:
            lines = fh.readlines()
        stats = {}
        new = [process_line(ln, syms, addrs, cfg, stats) for ln in lines]
        for k, v in stats.items():
            grand[k] = grand.get(k, 0) + v
        changed = new != lines
        print("%-58s %s%s" % (os.path.basename(f),
              {k: v for k, v in sorted(stats.items())},
              "" if changed else "  (no change)"))
        if args.apply and changed:
            with open(f, "w", encoding="utf-8") as fh:
                fh.writelines(new)
    print("\nTOTAL:", {k: v for k, v in sorted(grand.items())})
    print("mode:", "APPLIED" if args.apply else "dry-run (use --apply)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
