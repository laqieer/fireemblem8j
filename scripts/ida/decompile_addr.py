#!/usr/bin/env python3
"""Headless IDA Hex-Rays helper for the region-different decomp phase (D9).

Opens the prepared database `tools/ida/fe8j.i64` (built by `make ida-db`) WITHOUT
re-analysing, and either lists the functions IDA discovered in a JP address range
or decompiles one function to pseudo-C. This is the headless building block the
permuter path needs: the remaining region-different CODE TUs are not in the
funcmap, so their JP boundaries come from IDA's auto-analysis, and their JP
behaviour comes from Hex-Rays — both available here with no interactive MCP.

Run with the idalib venv python (NOT the system one):
    /home/laqieer/ida-mcp-venv/bin/python scripts/ida/decompile_addr.py list  0805C6FA 08068C7C
    /home/laqieer/ida-mcp-venv/bin/python scripts/ida/decompile_addr.py decomp 0805CEC8

`import idapro` MUST be first (idalib requirement).
"""
import idapro  # noqa: E402  (must be first)
import os
import sys

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
DB = os.path.join(REPO, "tools", "ida", "fe8j.i64")


def _open():
    if not os.path.exists(DB):
        sys.stderr.write(f"ERROR: {DB} not found - run `make ida-db` first.\n")
        sys.exit(2)
    idapro.enable_console_messages(False)
    rc = idapro.open_database(DB, False)  # run_auto_analysis=False: DB is already analysed
    if rc != 0:
        sys.stderr.write(f"ERROR: open_database rc={rc}\n")
        sys.exit(3)


def cmd_list(lo, hi):
    import idautils
    import ida_funcs
    import idc
    n = 0
    for ea in idautils.Functions(lo, hi):
        f = ida_funcs.get_func(ea)
        if not f:
            continue
        name = idc.get_func_name(ea)
        thumb = idc.get_sreg(ea, "T")
        print(f"{f.start_ea:08X} {f.end_ea:08X} {f.end_ea - f.start_ea:5d} "
              f"{'T' if thumb else 'A'} {name}")
        n += 1
    sys.stderr.write(f"[decompile_addr] {n} functions in {lo:#08x}..{hi:#08x}\n")


def cmd_decomp(ea):
    import ida_hexrays
    import ida_funcs
    import idc
    if not ida_hexrays.init_hexrays_plugin():
        sys.stderr.write("ERROR: Hex-Rays not available\n")
        sys.exit(4)
    f = ida_funcs.get_func(ea)
    if not f:
        sys.stderr.write(f"no function at {ea:#x}; trying to create one...\n")
        idc.create_insn(ea)
        ida_funcs.add_func(ea)
        f = ida_funcs.get_func(ea)
        if not f:
            sys.stderr.write(f"ERROR: could not define a function at {ea:#x}\n")
            sys.exit(5)
    print(f"/* {idc.get_func_name(f.start_ea)}  "
          f"{f.start_ea:#08x}..{f.end_ea:#08x} ({f.end_ea - f.start_ea} bytes) */")
    cf = ida_hexrays.decompile(f.start_ea)
    print(str(cf) if cf else "/* decompile failed */")


def main():
    if len(sys.argv) < 3:
        sys.stderr.write(__doc__)
        return 1
    mode = sys.argv[1]
    _open()
    try:
        if mode == "list":
            cmd_list(int(sys.argv[2], 16), int(sys.argv[3], 16))
        elif mode == "decomp":
            cmd_decomp(int(sys.argv[2], 16))
        else:
            sys.stderr.write(f"unknown mode {mode!r}\n")
            return 1
    finally:
        idapro.close_database(False)  # don't save: read-only use
    return 0


if __name__ == "__main__":
    sys.exit(main())
