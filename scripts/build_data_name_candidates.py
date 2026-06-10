#!/usr/bin/env python3
"""Build the authoritative DATA-residue naming candidate set (D38).

For every remaining single-label `data_<addr>` residue object (raw-ROM incbin gap),
recover its US symbol name(s) and emit a SPLIT spec (one or more named JP labels)
ONLY when the correspondence is authoritative. Tiers, in descending authority:

  start mapping:  the chunk START maps to a named US data symbol either DIRECTLY
                  (same JP addr is a US sym addr) or via the code-reference-derived
                  layout/addr_map.tsv with conflicts=0. The constant delta (us-jp)
                  is taken from that start.

  tiling:         the chunk total size EQUALS the span of the contiguous US object
                  run [us, us+size) (next US sym after the run is exactly size away).

  interior boundary authority (need ALL interior boundaries to pass ONE of):
    (a) addr_map  — the interior US addr maps back to jp=us_addr-delta, conflicts=0.
    (b) EventScr  — every boundary (incl. chunk start/end) is immediately preceded by
                    the event-script ENDA terminator word 0x00000120 (a real script
                    boundary, validated structurally — the format decode Copilot
                    recommended for fixed-format tables).

Names are quality-filtered: libc/internal symbols (leading '_', '.N' compiler temp
suffix, lowercase locale/heap state) are REJECTED — they are not honest ROM-object
names. Single-object chunks (run length 1) are emitted as a one-part split (rename).

Output: /tmp/data_name_spec.json (list of {start,end,parts:[[jp_addr,name],...]}),
consumed by scripts/split_data_residue.py.
"""
import bisect
import glob
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
BASE = 0x08000000
ENDA = bytes([0x20, 0x01, 0x00, 0x00])
US_SYMS = "/tmp/us_syms.tsv"


def bad_name(n):
    """Reject libc/compiler-internal names — not honest ROM-data symbols."""
    if n.startswith(("_", ".", "$")):
        return True
    if re.search(r"\.\d+$", n):          # lc_ctype.3, last_lc_ctype.4 — compiler temps
        return True
    if n[:1].islower() and "_" not in n[:4] and not n.startswith(("g", "s")):
        return True
    return False


def load():
    us_name, us_addrs = {}, set()
    for ln in open(US_SYMS):
        a, n = ln.rstrip("\n").split("\t")
        try:
            ai = int(a, 16)
        except ValueError:
            continue
        if BASE <= ai < BASE + 0x1000000:
            us_name.setdefault(ai, []).append(n)
            us_addrs.add(ai)
    us_sorted = sorted(us_addrs)
    jp2us, us2jp = {}, {}
    for ln in open("layout/addr_map.tsv"):
        if ln.startswith("#") or not ln.strip():
            continue
        p = ln.rstrip("\n").split("\t")
        try:
            us, jp, c = int(p[0], 16), int(p[1], 16), int(p[3])
        except (ValueError, IndexError):
            continue
        jp2us[jp] = (us, c)
        us2jp[us] = (jp, c)
    chunk = {}
    for f in glob.glob("layout/carved_rom.d/data_*.tsv"):
        for l in open(f):
            if l.startswith("#") or not l.strip():
                continue
            p = l.split("\t")
            if ".data.residue." in p[2]:
                chunk[int(p[0], 16) + BASE] = int(p[1], 16) + BASE
    return us_name, us_sorted, jp2us, us2jp, chunk


def good_first_name(names):
    """Pick the first non-internal US name, or None."""
    for n in names:
        if not bad_name(n):
            return n
    return None


def main():
    us_name, us_sorted, jp2us, us2jp, chunk = load()
    rom = open("baserom.gba", "rb").read()

    # remaining single-label residue files
    singles = []
    for f in glob.glob("asm/data_*.s"):
        t = open(f).read()
        if ".data.residue." not in t:
            continue
        gl = re.findall(r"^\s*\.global\s+(\S+)", t, re.M)
        if len(gl) == 1 and gl[0].startswith("data_"):
            singles.append(int(f.split("data_")[1].split(".")[0], 16))

    spec = []
    counts = {"single": 0, "eventscr": 0, "addrmap_multi": 0}
    for j in sorted(singles):
        if j not in chunk:
            continue
        e = chunk[j]
        size = e - j
        if j in us_name and good_first_name(us_name[j]):
            ua = j
        elif j in jp2us and jp2us[j][1] == 0 and jp2us[j][0] in us_name \
                and good_first_name(us_name[jp2us[j][0]]):
            ua = jp2us[j][0]
        else:
            continue
        delta = ua - j
        lo = bisect.bisect_left(us_sorted, ua)
        hi = bisect.bisect_left(us_sorted, ua + size)
        objs = us_sorted[lo:hi]
        if not objs or objs[0] != ua:
            continue
        nxt = us_sorted[hi] if hi < len(us_sorted) else None
        if not (nxt and nxt - ua == size):
            continue
        # collect part names; reject if any is internal
        parts = []
        bad = False
        for a in objs:
            nm = good_first_name(us_name[a])
            if not nm:
                bad = True
                break
            parts.append([a - delta, nm])
        if bad:
            continue
        if any(not (j <= p[0] < e) for p in parts):
            continue
        if [p[0] for p in parts] != sorted(p[0] for p in parts):
            continue

        if len(parts) == 1:
            spec.append({"start": j, "end": e, "parts": parts})
            counts["single"] += 1
            continue
        # multi: need interior boundary authority
        bounds = [p[0] for p in parts[1:]] + [e]
        all_addrmap = all(a in us2jp and us2jp[a][0] == a - delta and us2jp[a][1] == 0
                          for a in objs[1:])
        all_eventscr = (all(n.startswith("EventScr") for _, n in parts)
                        and all(rom[b - BASE - 4:b - BASE] == ENDA for b in bounds)
                        and rom[j - BASE - 4:j - BASE] == ENDA)
        # REDA: fixed 8-byte-stride reinforcement arrays. region-different bytes but
        # region-STABLE structure (unit counts identical JP<->US). Accept when every
        # boundary is 8-aligned AND every segment BETWEEN consecutive addr_map-confirmed
        # boundaries has identical JP/US total size (proven: redistributing entries
        # across arrays would be a game-design change FE8 does not make region-to-region).
        reda_ok = False
        if all(n.startswith("REDA") for _, n in parts) \
                and all((a - ua) % 8 == 0 for a in objs):
            confjp = [j]
            confus = [ua]
            for a in objs[1:]:
                if a in us2jp and us2jp[a][0] == a - delta and us2jp[a][1] == 0:
                    confjp.append(us2jp[a][0])
                    confus.append(a)
            confjp.append(e)
            confus.append(ua + size)
            reda_ok = all(confjp[i + 1] - confjp[i] == confus[i + 1] - confus[i]
                          for i in range(len(confjp) - 1))
        if all_addrmap:
            spec.append({"start": j, "end": e, "parts": parts})
            counts["addrmap_multi"] += 1
        elif all_eventscr:
            spec.append({"start": j, "end": e, "parts": parts})
            counts["eventscr"] += 1
        elif reda_ok:
            spec.append({"start": j, "end": e, "parts": parts})
            counts["reda"] = counts.get("reda", 0) + 1

    json.dump(spec, open("/tmp/data_name_spec.json", "w"), indent=1)
    total = sum(len(s["parts"]) for s in spec)
    print(f"candidates: {len(spec)} chunks, {total} names")
    print(f"  single-object renames        : {counts['single']}")
    print(f"  EventScr ENDA-validated splits: {counts['eventscr']}")
    print(f"  addr_map-confirmed splits     : {counts['addrmap_multi']}")
    print(f"  REDA stride-validated splits  : {counts.get('reda', 0)}")
    if "--show" in sys.argv:
        for s in spec:
            print(f"  0x{s['start']:08X} {len(s['parts'])}: "
                  + ", ".join(p[1] for p in s["parts"]))


if __name__ == "__main__":
    main()
