#!/usr/bin/env python3
"""Build the FE8J<->FE8U coddog region-SAME/DIFFERENT classification.

Survey action P0.3 (docs/gba-decomp-survey.md). coddog's `compare2` finds, for
each JP function it can read from the ELF, the single best-matching US function
by *instruction-stream* similarity (literal-pool / pointer operands normalized
out). This script turns one captured `compare2` run into:

  1. reference/maps/coddog_classification.tsv
       jp_addr  us_addr  jp_name  us_name  similarity  class  decompiled
     class is derived from coddog's similarity, which has a precise meaning:
       100.00%  -> exact byte-identical              -> region-SAME (exact)
       99.99%   -> opcode-stream identical, bytes     -> region-SAME (near:
                   differ (pointer/literal relocation)   pointer/literal-pool delta)
       >= near  -> small real instruction delta       -> NEAR-MATCH
       (absent) -> no US match above the run threshold -> REGION-DIFFERENT / no twin
     (coddog returns the sentinel 0.9999 exactly when edit-distance==0 but the
      raw bytes differ; that is the "relocation-only" region-same case.)

  2. Cross-check stats vs the two things we already know:
       - layout/us_jp_funcmap.tsv  (byte-match ground truth = region-same)
       - the gbadisasm region-different backlog (addresses still uncarved)

Inputs (paths relative to repo root unless given):
  --compare2 FILE   captured `coddog compare2 ... -t <thr>` stdout
  --jp-elf FILE     JP fireemblem8.elf  (for name->addr)
  --us-elf FILE     US fireemblem8.elf  (for name->addr)
  --funcmap FILE    layout/us_jp_funcmap.tsv
  --backlog FILE    gbadisasm `--list` addr<TAB>name dump (optional)
  --out FILE        output TSV

This is read-only analysis: it never touches a build input.
"""
import argparse
import os
import re
import subprocess
import sys

NM = os.environ.get("NM", "arm-none-eabi-nm")

PAIR_RE = re.compile(r"^(\S+) - (\S+) \(([0-9.]+)%\)\s*$")


def nm_name_addr(elf):
    """name -> function-entry address (8-hex, lower). First definition wins.

    Thumb function symbols carry the thumb bit (odd address) in some ELF symbol
    definitions and not in others; we clear bit 0 so addresses line up with the
    even function-entry addresses used by funcmap / gbadisasm backlog.
    """
    out = subprocess.run(
        [NM, "--defined-only", elf], capture_output=True, text=True, check=True
    ).stdout
    m = {}
    for line in out.splitlines():
        parts = line.split()
        if len(parts) == 3 and re.fullmatch(r"[0-9a-fA-F]+", parts[0]):
            a = int(parts[0], 16) & ~1  # clear thumb bit -> function entry
            m.setdefault(parts[2], "%08x" % a)
    return m


def parse_compare2(path):
    """Yield (jp_name, us_name, sim_float, section) for each matched pair.

    section is 'both' or 'only_us' (coddog's decompiled grouping headers).
    """
    section = "both"
    for line in open(path):
        if line.startswith("Decompiled in ") and " and " in line:
            section = "both"
            continue
        if line.startswith("Only decompiled in "):
            section = "only_us"
            continue
        if line.startswith("Decompiled in neither"):
            section = "neither"
            continue
        m = PAIR_RE.match(line)
        if m:
            yield m.group(1), m.group(2), float(m.group(3)), section


def classify(sim):
    if sim >= 100.0:
        return "region-same-exact"
    if sim >= 99.985:  # coddog's 0.9999 sentinel rounds to 99.99
        return "region-same-reloc"
    if sim >= 99.0:
        return "near-match"
    return "weak-near"


def load_funcmap(path):
    """jp_addr(lower hex) -> (us_addr, tier, name)."""
    fm = {}
    for line in open(path):
        if line.startswith("#") or not line.strip():
            continue
        f = line.rstrip("\n").split("\t")
        if len(f) >= 5:
            fm[f[0].lower()] = (f[1].lower(), f[3], f[4])
    return fm


def load_backlog(path):
    """set of region-different JP addresses (lower hex, no 0x)."""
    s = set()
    if not path or not os.path.exists(path):
        return s
    for line in open(path):
        f = line.rstrip("\n").split("\t")
        if f and re.fullmatch(r"[0-9A-Fa-f]{6,8}", f[0].strip()):
            s.add(f[0].strip().lower().lstrip("0").rjust(8, "0"))
    return s


def norm(a):
    return a.lower().lstrip("0").rjust(8, "0") if a else a


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--compare2", required=True)
    ap.add_argument("--jp-elf", required=True)
    ap.add_argument("--us-elf", required=True)
    ap.add_argument("--funcmap", required=True)
    ap.add_argument("--backlog", default=None)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    jp = nm_name_addr(args.jp_elf)
    us = nm_name_addr(args.us_elf)
    funcmap = load_funcmap(args.funcmap)
    backlog = load_backlog(args.backlog)

    rows = []
    for jp_name, us_name, sim, section in parse_compare2(args.compare2):
        ja = jp.get(jp_name, "")
        ua = us.get(us_name, "")
        rows.append(
            dict(
                jp_addr=ja,
                us_addr=ua,
                jp_name=jp_name,
                us_name=us_name,
                sim=sim,
                cls=classify(sim),
                decompiled=("both" if section == "both" else "us-only"),
                name_agree=(jp_name == us_name),
            )
        )

    # Append the gbadisasm region-different backlog as explicit region-different
    # rows so the TSV is a COMPLETE classification (matched + unmatched). These
    # functions are not in coddog's output because coddog cannot read uncarved
    # ABS/.set symbols (structural coverage gap), so they carry no coddog
    # similarity; the class is asserted from the gbadisasm backlog, not measured.
    backlog_names = {}
    if args.backlog and os.path.exists(args.backlog):
        for line in open(args.backlog):
            f = line.rstrip("\n").split("\t")
            if len(f) >= 2 and re.fullmatch(r"[0-9A-Fa-f]{6,8}", f[0].strip()):
                a = "%08x" % (int(f[0], 16) & ~1)
                backlog_names[a] = f[1].strip()
    matched_jp = set(norm(r["jp_addr"]) for r in rows if r["jp_addr"])
    for a, name in sorted(backlog_names.items()):
        if norm(a) in matched_jp:
            continue  # coddog already classified it (would be a conflict, logged)
        rows.append(
            dict(
                jp_addr=a,
                us_addr="",
                jp_name=name,
                us_name="",
                sim=float("nan"),
                cls="region-different",
                decompiled="no",
                name_agree=False,
            )
        )

    def sortkey(r):
        s = r["sim"]
        return (0 if s == s else 1, -(s if s == s else 0), r["jp_name"])

    rows.sort(key=sortkey)

    os.makedirs(os.path.dirname(args.out), exist_ok=True)
    with open(args.out, "w") as fh:
        fh.write("# FE8J<->FE8U coddog cross-binary classification (survey P0.3)\n")
        fh.write(
            "# coddog compare2 instruction-stream similarity; see "
            "docs/tools/coddog-classification.md\n"
        )
        fh.write(
            "# class: region-same-exact (100%, byte-identical) | "
            "region-same-reloc (99.99%, opcodes identical, pointer/literal delta) | "
            "near-match (99.0-99.98%) | weak-near (<99%) | "
            "region-different (gbadisasm backlog; coddog CANNOT read it, label "
            "asserted not measured, similarity=NA)\n"
        )
        fh.write(
            "jp_addr\tus_addr\tjp_name\tus_name\tsimilarity\tclass\tdecompiled\tname_agree\n"
        )
        for r in rows:
            sim = "NA" if r["sim"] != r["sim"] else "%.2f" % r["sim"]
            fh.write(
                "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\n"
                % (
                    r["jp_addr"], r["us_addr"], r["jp_name"], r["us_name"],
                    sim, r["cls"], r["decompiled"], r["name_agree"],
                )
            )

    # ---- cross-check stats -------------------------------------------------
    # Only rows coddog actually produced (exclude the appended region-different
    # backlog rows, which coddog never read).
    coddog_rows = [r for r in rows if r["cls"] != "region-different"]
    n = len(coddog_rows)
    by_cls = {}
    for r in rows:
        by_cls[r["cls"]] = by_cls.get(r["cls"], 0) + 1
    region_same = [r for r in coddog_rows if r["cls"].startswith("region-same")]
    name_agree = sum(1 for r in coddog_rows if r["name_agree"])

    # Funcmap agreement: of JP functions in BOTH coddog (region-same) and funcmap,
    # how often does coddog also say region-same? (it always will if present, but
    # we measure overlap + whether coddog's same-set is a superset).
    fm_jp_addrs = set(norm(a) for a in funcmap)
    coddog_same_addrs = set(norm(r["jp_addr"]) for r in region_same if r["jp_addr"])
    coddog_all_addrs = set(
        norm(r["jp_addr"]) for r in coddog_rows if r["jp_addr"]
    )

    in_both = fm_jp_addrs & coddog_same_addrs
    fm_not_in_coddog_same = fm_jp_addrs - coddog_same_addrs
    # NEW region-same surfaced by coddog that the byte-match funcmap MISSED:
    coddog_same_not_fm = coddog_same_addrs - fm_jp_addrs
    # Fair agreement: restrict to funcmap functions coddog could actually READ
    # (i.e. produced ANY match for). Functions coddog skipped (ABS .set symbols /
    # below min_len) are a coverage gap, not a disagreement.
    fm_readable = fm_jp_addrs & coddog_all_addrs
    fm_readable_same = fm_readable & coddog_same_addrs
    fm_unreadable = fm_jp_addrs - coddog_all_addrs

    # gbadisasm region-different backlog cross-check.
    # NOTE: the backlog functions live in the asm/baserom.s incbin gap as ABS
    # `.set name,addr+1` symbols (or no symbol at all), so coddog/objdiff does
    # NOT classify them as SymbolKind::Function and SKIPS them. So "coddog has no
    # match" here means "coddog never READ them", not "coddog analysed and judged
    # them region-different". Both agree on the LABEL (region-different) but
    # coddog adds no independent evidence for the uncarved backlog.
    backlog_in_coddog_same = backlog & coddog_same_addrs if backlog else set()
    backlog_in_coddog_any = backlog & coddog_all_addrs if backlog else set()
    backlog_absent = (backlog - coddog_all_addrs) if backlog else set()

    print("=== coddog classification summary ===")
    print(f"total matched JP functions (>= run threshold): {n}")
    for c in ("region-same-exact", "region-same-reloc", "near-match", "weak-near"):
        print(f"  {c:20s}: {by_cls.get(c,0)}")
    print(f"  region-same (exact+reloc) total: {len(region_same)}")
    print(f"  name agreement (jp_name == us_name): {name_agree}/{n} "
          f"({100.0*name_agree/n:.2f}%)")
    print()
    print("=== cross-check vs funcmap (byte-match ground truth) ===")
    print(f"funcmap JP functions: {len(fm_jp_addrs)}")
    print(f"coddog region-same JP functions: {len(coddog_same_addrs)}")
    print(f"in BOTH funcmap and coddog-region-same: {len(in_both)}")
    if fm_jp_addrs:
        print(f"RAW funcmap agreement (funcmap-same also coddog-same): "
              f"{len(in_both)}/{len(fm_jp_addrs)} "
              f"({100.0*len(in_both)/len(fm_jp_addrs):.2f}%)")
    print(f"funcmap funcs coddog could NOT read (ABS .set / below min_len): "
          f"{len(fm_unreadable)} -> coverage gap, NOT a disagreement")
    if fm_readable:
        print(f"FAIR funcmap agreement (of funcmap funcs coddog READ, "
              f"called region-same): {len(fm_readable_same)}/{len(fm_readable)} "
              f"({100.0*len(fm_readable_same)/len(fm_readable):.2f}%)")
    print(f"funcmap-same NOT in coddog-region-same (disagree+unreadable): "
          f"{len(fm_not_in_coddog_same)}")
    print(f"coddog-region-same NOT in funcmap (NEW carve targets coddog found): "
          f"{len(coddog_same_not_fm)}")
    print()
    if backlog:
        print("=== cross-check vs gbadisasm region-different backlog ===")
        print(f"gbadisasm backlog (uncarved, region-different addrs): {len(backlog)}")
        print(f"backlog addrs coddog can READ (real .text FUNC symbol): "
              f"{len(backlog_in_coddog_any)}")
        print(f"backlog addrs coddog calls REGION-SAME (would be a conflict): "
              f"{len(backlog_in_coddog_same)}")
        print(f"backlog addrs coddog produced NO match for: {len(backlog_absent)}")
        print("  -> coddog SKIPS uncarved funcs (ABS .set / no symbol), so the")
        print("     no-match is structural coverage, NOT independent confirmation.")
        if not backlog_in_coddog_same:
            print(f"  NO conflict: coddog never calls a backlog addr region-same. "
                  f"({len(backlog)}/{len(backlog)} consistent labels)")

    # The "coddog-region-same NOT in funcmap" set is almost entirely functions
    # already carved (in src/ as C) but simply absent from the narrower byte-match
    # funcmap, plus a couple of data-mislabeled-as-function false positives. It is
    # NOT a useful list of new work, so we do not emit it as a 600KB side file;
    # the marginal-value analysis is captured in docs/tools/coddog-classification.md.
    if backlog and backlog_in_coddog_same:
        with open(
            os.path.join(os.path.dirname(args.out), "coddog_backlog_conflicts.tsv"),
            "w",
        ) as fh:
            fh.write("# gbadisasm-region-different addrs that coddog calls "
                     "region-SAME (investigate)\n")
            fh.write("jp_addr\n")
            for a in sorted(backlog_in_coddog_same):
                fh.write(a + "\n")


if __name__ == "__main__":
    sys.exit(main())
