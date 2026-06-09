#!/usr/bin/env python3
"""Generate a gbadisasm config for the JP ROM from the prepared IDA database.

gbadisasm (tools/gbadisasm) needs a config of `thumb_func 0xADDR NAME` /
`arm_func 0xADDR NAME` lines (one per function, `#` comments ignored) so it
disassembles each function in the correct ARM/Thumb mode and knows where the
function boundaries are. This is the JP counterpart of the US `fireemblem8.cfg`
that ships with gbadisasm, and is what drives scripts/carve_gbadisasm_asm.py.

It walks every function IDA discovered in tools/ida/fe8j.i64 (built by
`make ida-db`), reads the per-function ARM/Thumb mode from the `T` segment
register, and writes `arm_func`/`thumb_func` lines. Names are taken from IDA;
where a US<->JP funcmap name exists for the JP address it is preferred (so the
disassembly uses real symbol names, not `sub_XXXX`).

Only the CODE region (jp < 0x080DC134, the first data byte) is emitted: IDA
auto-analysis creates spurious "functions" inside the data region that would
mislead gbadisasm.

`import idapro` MUST be first (idalib requirement). Run with the idalib venv
python and ONLY when no other idalib/MCP worker holds the DB open (the loose
.id0/.id1 working files mean it is already open elsewhere -> this will block):

    /home/laqieer/ida-mcp-venv/bin/python scripts/ida/export_gbadisasm_cfg.py \
        tools/gbadisasm/fe8j_full.cfg
"""
import idapro  # noqa: E402  (must be first)
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
# The IDA DB (tools/ida/fe8j.i64) is gitignored and lives only in the main repo;
# a parallel-carve worktree does not have it. Allow overriding where the DB is
# found via FE8J_IDA_DB (or FE8J_MAIN_REPO) so this can run from a worktree.
DB = os.environ.get("FE8J_IDA_DB") or os.path.join(
    os.environ.get("FE8J_MAIN_REPO", REPO), "tools", "ida", "fe8j.i64")
CODE_END = 0x080DC134  # first data byte; code is jp < this


def jp_names():
    """Map JP addr -> real name from the US<->JP funcmap (preferred over sub_*)."""
    m = {}
    fp = os.path.join(REPO, "layout", "us_jp_funcmap.tsv")
    if os.path.exists(fp):
        for ln in open(fp):
            if ln.startswith("#"):
                continue
            c = ln.rstrip("\n").split("\t")
            if len(c) >= 5:
                try:
                    m[int(c[0], 16)] = c[4]
                except ValueError:
                    pass
    return m


def main():
    out = sys.argv[1] if len(sys.argv) > 1 else "tools/gbadisasm/fe8j_full.cfg"
    if not os.path.isabs(out):
        out = os.path.join(REPO, out)
    if not os.path.exists(DB):
        sys.stderr.write(f"ERROR: {DB} not found - run `make ida-db` first.\n")
        return 2
    idapro.enable_console_messages(False)
    rc = idapro.open_database(DB, False)  # already analysed; no re-analysis
    if rc != 0:
        sys.stderr.write(f"ERROR: open_database rc={rc} (is another worker holding it?)\n")
        return 3

    import idautils
    import idc

    names = jp_names()
    rows, n_arm, n_thumb, n_skip = [], 0, 0, 0
    for ea in idautils.Functions():
        if ea >= CODE_END:
            n_skip += 1
            continue
        name = names.get(ea) or idc.get_func_name(ea)
        if not name:
            continue
        t = idc.get_sreg(ea, "T")  # 1 = Thumb, 0 = ARM
        if t == 1:
            rows.append(f"thumb_func 0x{ea:x} {name}")
            n_thumb += 1
        else:
            rows.append(f"arm_func 0x{ea:x} {name}")
            n_arm += 1

    idapro.close_database(False)
    os.makedirs(os.path.dirname(out), exist_ok=True)
    with open(out, "w") as f:
        f.write("# gbadisasm config for FE8 JP (BE8J), generated from tools/ida/fe8j.i64\n")
        f.write("# by scripts/ida/export_gbadisasm_cfg.py\n")
        f.write("\n".join(rows) + "\n")
    print(f"wrote {out}: {len(rows)} funcs ({n_thumb} thumb, {n_arm} arm); "
          f"skipped {n_skip} data-region")
    return 0


if __name__ == "__main__":
    sys.exit(main())
