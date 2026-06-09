#!/usr/bin/env python3
"""Build reference/maps/ram_us_jp.tsv : US<->JP RAM correspondence map.

Two sources, unioned and deduped by us_symbol:
  (A) FEBuilder ROM defs (GPL-3.0): workmemory_* fields whose value is an
      EWRAM/IWRAM address (0x02xxxxxx / 0x03xxxxxx). US value from ROMFE8U.cs,
      JP value from ROMFE8JP.cs (they differ). Factual addresses only; no GPL
      comment text is copied.
  (B) US decomp .bss/.data symbols from `arm-none-eabi-nm` over the US ELF that
      land in the RAM range. These give NAMED US RAM addresses (gPlaySt, ...).

jp_addr derivation (never assume jp==us):
  1. FEBuilder JP value when the entry is a FEBuilder field, OR when a nm symbol's
     US addr exactly equals a FEBuilder US addr (cross-reference -> use that
     FEBuilder JP addr). This is the highest-confidence link.
  2. else layout/addr_map.tsv  us_addr -> jp_addr  (project vote map).
  3. else "<us_addr>?" with region ASSUMED-same (UNVERIFIED).

region:
  same     jp_addr == us_addr (no relocation between regions).
  diff     jp_addr != us_addr and derived from FEBuilder or addr_map (verified
           relocation).
  unverified  .bss with no FEBuilder/addr_map evidence (no ROM bytes to compare).
"""
import os
import re
import subprocess

HERE = os.path.dirname(os.path.abspath(__file__))
JP_CS = "/home/laqieer/FEBuilderGBA/FEBuilderGBA.Core/ROMFE8JP.cs"
US_CS = "/home/laqieer/FEBuilderGBA/FEBuilderGBA.Core/ROMFE8U.cs"
US_ELF = "/home/laqieer/fireemblem8u/fireemblem8.elf"
ADDR_MAP = "/home/laqieer/fireemblem8j/layout/addr_map.tsv"
OUT = os.path.join(HERE, "ram_us_jp.tsv")

RAM_RE = re.compile(r"^0[23][0-9A-Fa-f]{6}$")
# matches:  name = 0xVALUE;   (captures name, value)
FIELD_RE = re.compile(r"^\s*([A-Za-z_][A-Za-z0-9_]*)\s*=\s*(0x0[23][0-9A-Fa-f]{6})\s*;")


def norm(addr):
    """Normalize a hex address (with/without 0x) to 8 upper-case digits, 0x-prefixed."""
    a = addr.lower().replace("0x", "")
    return "0x" + a.upper().zfill(8)


def parse_cs(path):
    """field_name -> normalized 0x02/0x03 address (line number kept for source)."""
    out = {}
    with open(path, encoding="utf-8-sig") as f:
        for ln, line in enumerate(f, 1):
            m = FIELD_RE.match(line)
            if not m:
                continue
            name, val = m.group(1), m.group(2)
            out[name] = (norm(val), ln)
    return out


def load_addr_map(path):
    """US 0x... -> (JP 0x..., conflicts) (RAM range only).

    addr_map is upper-case, no 0x prefix: us_addr<TAB>jp_addr<TAB>votes<TAB>conflicts.
    conflicts>0 means the project vote map saw disagreeing mappings -> lower confidence.
    """
    m = {}
    with open(path, encoding="utf-8") as f:
        for line in f:
            if line.startswith("#"):
                continue
            parts = line.rstrip("\n").split("\t")
            if len(parts) < 2:
                continue
            us, jp = parts[0].strip(), parts[1].strip()
            conflicts = int(parts[3]) if len(parts) >= 4 and parts[3].strip() else 0
            if RAM_RE.match(us):
                m[norm(us)] = (norm(jp), conflicts)
    return m


def load_nm(elf):
    """List of (addr0x, kind, symbol) for 0x02/0x03 bss/data symbols, sorted by addr."""
    out = []
    res = subprocess.run(
        ["arm-none-eabi-nm", "-n", elf], capture_output=True, text=True, check=True
    )
    for line in res.stdout.splitlines():
        parts = line.split()
        if len(parts) != 3:
            continue
        addr, kind, sym = parts
        if kind not in "bBdD":
            continue
        if not RAM_RE.match(addr):
            continue
        out.append((norm(addr), kind, sym))
    return out


def main():
    jp_fields = parse_cs(JP_CS)
    us_fields = parse_cs(US_CS)
    addr_map = load_addr_map(ADDR_MAP)
    nm = load_nm(US_ELF)

    # FEBuilder US-addr -> JP-addr, for cross-referencing nm symbols.
    feb_us_to_jp = {}
    for name, (us_addr, _) in us_fields.items():
        if name in jp_fields:
            feb_us_to_jp[us_addr] = jp_fields[name][0]

    rows = []          # (us_symbol, us_addr, jp_addr, region, kind, source)
    seen = set()       # us_symbol dedup

    # ---- Source A: FEBuilder fields (field name == us_symbol) ----
    for name in sorted(us_fields):
        if name not in jp_fields:
            continue  # require both regions
        us_addr, us_ln = us_fields[name]
        jp_addr, _ = jp_fields[name]
        region = "same" if jp_addr == us_addr else "diff"
        src = f"ROMFE8U.cs:{us_ln}/ROMFE8JP.cs:{jp_fields[name][1]} febuilder-ram"
        rows.append((name, us_addr, jp_addr, region, "feb", src))
        seen.add(name)

    # ---- Source B: US decomp nm symbols ----
    for addr, kind, sym in nm:
        usym = sym
        if usym in seen:
            # disambiguate colliding local statics by address (no-dup rule)
            usym = f"{sym}@{addr[2:]}"
            if usym in seen:
                continue
        # derive jp_addr by confidence cascade
        if addr in feb_us_to_jp:
            jp_addr = feb_us_to_jp[addr]
            region = "same" if jp_addr == addr else "diff"
            src = f"us-decomp-nm febuilder-xref kind={kind}"
        elif addr in addr_map:
            jp_addr, conflicts = addr_map[addr]
            region = "same" if jp_addr == addr else "diff"
            note = f"addr_map(conflicts={conflicts})" if conflicts else "addr_map"
            src = f"us-decomp-nm {note} kind={kind}"
        else:
            jp_addr = addr + "?"  # ASSUMED same; flagged unverified
            region = "ASSUMED-same (UNVERIFIED)"
            src = f"us-decomp-nm no-evidence kind={kind}"
        rows.append((usym, addr, jp_addr, region, kind, src))
        seen.add(usym)

    # stable sort by us_addr then symbol
    rows.sort(key=lambda r: (r[1], r[0]))

    with open(OUT, "w", encoding="utf-8") as f:
        f.write("# US<->JP RAM (EWRAM/IWRAM) correspondence map.\n")
        f.write("# Addresses sourced from FEBuilderGBA ROM defs (GPL-3.0, "
                "factual addresses only; no GPL comment text copied) and from the\n")
        f.write("# fireemblem8u US decomp ELF symbol table (arm-none-eabi-nm).\n")
        f.write("# jp_addr derived from FEBuilder JP value, then layout/addr_map.tsv; "
                "'?' + UNVERIFIED where neither had evidence.\n")
        f.write("# region: same(jp==us) | diff(verified relocation) | "
                "ASSUMED-same (UNVERIFIED).\n")
        f.write("us_symbol\tus_addr\tjp_addr\tregion\tkind\tsource\n")
        for usym, us_addr, jp_addr, region, kind, src in rows:
            f.write(f"{usym}\t{us_addr}\t{jp_addr}\t{region}\t{kind}\t{src}\n")

    data_rows = [r for r in rows]
    diff_rows = [r for r in data_rows if r[3] == "diff"]
    same_rows = [r for r in data_rows if r[3] == "same"]
    unv_rows = [r for r in data_rows if r[3].startswith("ASSUMED")]
    print(f"wrote {OUT}: {len(data_rows)} rows "
          f"(feb={len(us_fields)} same={len(same_rows)} diff={len(diff_rows)} "
          f"unverified={len(unv_rows)})")


if __name__ == "__main__":
    main()
