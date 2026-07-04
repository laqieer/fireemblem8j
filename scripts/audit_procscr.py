#!/usr/bin/env python3
"""audit_procscr.py -- #148 proc-script completeness audit.

Answers: are all fe8u proc scripts (struct ProcCmd tables) SPLIT into their own
named symbol AND DECOMPILED to typed struct ProcCmd[] in fe8j, WITHOUT hardcoded
raw pointer values? Reports every fe8u proc script's fe8j status and, for the ones
that still need work, the containing object (from fireemblem8.map) so the bulk
carve can be partitioned.

Read-only. Usage:
    FE8U=../fireemblem8u python3 scripts/audit_procscr.py [--md]

Status classes per fe8u ProcScr_*/gProcScr_* name:
  TYPED    -- `struct ProcCmd NAME[]` exists in fe8j src/ (decompiled + split).
  RAWHEX   -- TYPED but the table still contains `(ProcFunc)0x08..` casts
              (decompiled but pointers not symbolized -> not shiftable).
  OPAQUE   -- only a baseline `.set NAME, 0x08..` alias; bytes are raw INCBIN
              (NOT decompiled / not split into its own typed table).
  ABSENT   -- no typed def and no baseline .set (region-different / JP-renamed /
              genuinely absent) -- needs per-item RE, do not fabricate.
"""
import os, re, glob, sys, collections

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FE8U = os.environ.get("FE8U", os.path.join(os.path.dirname(ROOT), "fireemblem8u"))
os.chdir(ROOT)


def fe8u_procscr_names():
    names = set()
    pat = re.compile(r"struct ProcCmd (?:CONST_DATA )?([A-Za-z_]\w*)\s*\[\s*\]")
    for f in glob.glob(os.path.join(FE8U, "src", "**", "*.c"), recursive=True):
        try:
            for m in pat.finditer(open(f, errors="replace").read()):
                names.add(m.group(1))
        except OSError:
            pass
    return names


def fe8j_typed_defs():
    """name -> set(files) of `struct ProcCmd NAME[]` definitions in fe8j src/."""
    out = collections.defaultdict(set)
    pat = re.compile(r"struct ProcCmd ([A-Za-z_]\w*)\s*\[\s*\]")
    for f in glob.glob("src/**/*.c", recursive=True):
        try:
            t = open(f, errors="replace").read()
        except OSError:
            continue
        for m in pat.finditer(t):
            out[m.group(1)].add(f)
    return out


def file_has_rawhex(files):
    for f in files:
        try:
            if re.search(r"\(ProcFunc\)0x08|\(const char \*\)0x08", open(f, errors="replace").read()):
                return True
        except OSError:
            pass
    return False


def baseline_procscr_addr():
    addr = {}
    for f in ["layout/baseline_syms.tsv"] + glob.glob("layout/baseline_syms.d/*.tsv"):
        try:
            for ln in open(f, errors="replace"):
                p = ln.rstrip("\n").split("\t")
                if len(p) >= 2 and re.match(r"^(g|s)?ProcScr_", p[0].strip()):
                    try:
                        addr[p[0].strip()] = int(p[1], 16)
                    except ValueError:
                        pass
        except OSError:
            pass
    return addr


def map_object_ranges():
    """Parse fireemblem8.map -> list of (start, size, object) for placed sections."""
    ranges = []
    if not os.path.exists("fireemblem8.map"):
        return ranges
    # Placed-object lines: `  0xADDR  0xSIZE  path.o` (the section name is on the
    # preceding line). Also accept the `.section 0xADDR 0xSIZE path.o` one-line form.
    line_re = re.compile(r"^\s*(?:\.\S+\s+)?0x0*([0-9a-fA-F]+)\s+0x0*([0-9a-fA-F]+)\s+(\S+\.o)\s*$")
    for ln in open("fireemblem8.map", errors="replace"):
        m = line_re.match(ln)
        if m:
            start = int(m.group(1), 16)
            size = int(m.group(2), 16)
            if start >= 0x08000000:
                ranges.append((start, size, m.group(3)))
    return ranges


def obj_of(a, ranges):
    for s, sz, o in ranges:
        if s <= a < s + sz:
            return o
    return "residual-incbin(asm/baserom.s)"


def main():
    md = "--md" in sys.argv
    fe8u = fe8u_procscr_names()
    typed = fe8j_typed_defs()
    addr = baseline_procscr_addr()
    ranges = map_object_ranges()

    rows = []  # (name, status, detail)
    grp = collections.Counter()
    status_ct = collections.Counter()
    for n in sorted(fe8u):
        if n in typed:
            st = "RAWHEX" if file_has_rawhex(typed[n]) else "TYPED"
            detail = ",".join(sorted(typed[n]))
        elif n in addr:
            st = "OPAQUE"
            o = obj_of(addr[n], ranges)
            detail = f"0x{addr[n]:08X} {o}"
            grp[o] += 1
        else:
            st = "ABSENT"
            detail = ""
        status_ct[st] += 1
        rows.append((n, st, detail))

    print(f"# fe8u proc scripts: {len(fe8u)}")
    for st in ("TYPED", "RAWHEX", "OPAQUE", "ABSENT"):
        print(f"  {st:8}: {status_ct[st]}")
    print("\n# OPAQUE (not split+decompiled) grouped by containing object:")
    for o, c in grp.most_common():
        short = re.sub(r"^src/data/([^/]+)/.*", r"\1", o)
        print(f"  {c:4}  {short}")

    with open("/tmp/procscr_audit.tsv", "w") as fh:
        fh.write("name\tstatus\tdetail\n")
        for n, st, d in rows:
            fh.write(f"{n}\t{st}\t{d}\n")
    print("\n# per-name TSV -> /tmp/procscr_audit.tsv")


if __name__ == "__main__":
    main()
