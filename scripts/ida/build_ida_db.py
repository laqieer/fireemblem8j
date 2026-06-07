#!/usr/bin/env python3
"""
Build a headless IDA Pro database (.i64) of the FE8 JP ROM for the decompiler MCP.

Input is `fireemblem8.elf` (the project's own build output): a 32-bit ARM ELF.
Loading the ELF (rather than the raw .gba) gives IDA a native AArch32 database
with the correct memory layout, the project's symbols, and ARM/Thumb `$t`/`$d`
mapping for everything already decompiled. The still-incbin regions are the raw
ROM bytes at their real JP addresses, so the region-different functions we still
need to hand-decompile live there and decompile fine.

On top of the ELF we import every JP function address from `sym_jp.txt` (7743 of
them): for any address that is not already inside a defined function we force
Thumb (T=1), create the instruction, make a function, and name it. After this
`decompile(<jp_addr>)` works for any function in the ROM, ported or not.

Run it with the idalib venv python (see scripts/ida/idalib_env.sh):
    /home/laqieer/ida-mcp-venv/bin/python scripts/ida/build_ida_db.py
or just `make ida-db`. Re-run after meaningful decomp progress to refresh symbols.

NOTE: `import idapro` MUST be the first import (idalib requirement).
"""
import idapro  # noqa: E402  (must be first)

import os
import re
import sys
import time

REPO = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
ELF = os.path.join(REPO, "fireemblem8.elf")
SYMS = os.path.join(REPO, "sym_jp.txt")
OUT = os.path.join(REPO, "tools", "ida", "fe8j.i64")

SYM_RE = re.compile(r"^\s*([A-Za-z_]\w*)\s*=\s*0x([0-9A-Fa-f]+)\s*;")


def log(msg):
    print(f"[build_ida_db] {msg}", flush=True)


def parse_syms(path):
    out = []
    with open(path) as f:
        for line in f:
            m = SYM_RE.match(line)
            if m:
                out.append((m.group(1), int(m.group(2), 16)))
    return out


def main():
    if not os.path.exists(ELF):
        log(f"ERROR: {ELF} not found - run `make` first."); return 2
    # Open a fresh copy at the output path so we never disturb fireemblem8.elf
    # and the .i64 lands in tools/ida/.
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    # idalib names the database after the *full* input filename, i.e.
    # fireemblem8.elf.i64 (not fireemblem8.i64). Handle both spellings.
    inplace_candidates = [ELF + ".i64", os.path.splitext(ELF)[0] + ".i64"]
    for stale in [OUT] + inplace_candidates:
        if os.path.exists(stale):
            os.remove(stale)

    log(f"opening {ELF} (auto-analysis on)...")
    t0 = time.time()
    idapro.enable_console_messages(False)
    # Open the ELF; idalib creates <elf>.i64 next to it. We relocate by saving
    # to OUT at the end via close+rename, so analyse in place first.
    rc = idapro.open_database(ELF, True)
    if rc != 0:
        log(f"ERROR: open_database rc={rc}"); return 3

    import idc
    import ida_funcs
    import ida_bytes
    import ida_auto
    import ida_name
    import ida_ida

    log(f"loaded in {time.time()-t0:.1f}s; "
        f"64bit={bool(ida_ida.inf_get_lflags() & ida_ida.LFLG_64BIT)}")

    syms = parse_syms(SYMS)
    log(f"importing {len(syms)} JP function symbols...")
    added = named = skipped = 0
    for i, (name, addr) in enumerate(syms):
        f = ida_funcs.get_func(addr)
        if f is None:
            # Not yet a function (incbin region): force Thumb and define it.
            idc.split_sreg_range(addr, "T", 1, idc.SR_user)
            ida_bytes.del_items(addr, 0, 4)
            idc.create_insn(addr)
            if ida_funcs.add_func(addr):
                added += 1
            else:
                skipped += 1
        # Name it if the current name is absent or auto-generated.
        cur = idc.get_name(addr)
        if cur != name and (not cur or cur.startswith(("sub_", "loc_", "unk_", "off_", "byte_", "word_", "dword_"))):
            if ida_name.set_name(addr, name, ida_name.SN_NOCHECK | ida_name.SN_NOWARN):
                named += 1
        if (i + 1) % 1000 == 0:
            log(f"  {i+1}/{len(syms)} (added {added}, named {named})")

    log(f"defined {added} new funcs, named {named}, could-not-define {skipped}; waiting for analysis...")
    ida_auto.auto_wait()

    log(f"saving database to {OUT} ...")
    # close_database saves the in-place <elf>.i64; move it to OUT.
    idapro.close_database(True)
    for inplace in inplace_candidates:
        if os.path.exists(inplace):
            os.replace(inplace, OUT)
            log(f"done in {time.time()-t0:.1f}s -> {OUT}")
            return 0
    log(f"ERROR: none of {inplace_candidates} found after close"); return 4


if __name__ == "__main__":
    sys.exit(main())
