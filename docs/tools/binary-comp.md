# binary-comp — evaluated, SKIP

Tool: <https://github.com/neuromancer/binary-comp> (fresh clone inspected at `/tmp/binary-comp`).

**Verdict: SKIP.** It is built for MSVC-built 32-bit PE (x86) reconstruction and
verifies an *annotated* rebuild against its original EXE. It is not an
architecture-neutral or cross-binary matcher, so it cannot do anything we need
for the FE8J (GBA / ARM7TDMI / Thumb) decomp.

## 1. What it is

`binary-comp` is a Python package of "binary comparison and verification tools
for C/C++ reimplementation projects" (`README.md` line 3, `pyproject.toml`
`description`). Given an original PE executable, a rebuilt PE, the rebuilt
linker `.map`, and source annotated with each function's original address, it
compares layout, function bytes, decoded operands, calls, globals, vtables, and
C++ exception-handling metadata to localize the last small mismatches near the
end of a reconstruction (`README.md` lines 12-28). It is a *reconstruction
verifier*, not a discovery/matching tool.

## 2. Why it does not fit FE8J

**x86 / MSVC-PE only — no ARM or Thumb.**
- Disassembly is hardwired to Capstone x86 32-bit. `src/binary_comp/core/disasm.py`
  imports `CS_ARCH_X86, CS_MODE_32` and `capstone.x86_const` (lines 12-13) and
  constructs the decoder as `Cs(CS_ARCH_X86, CS_MODE_32)` (line 136); the public
  entry point is literally named `disassemble_x86(...)` (line 122). The same
  `Cs(CS_ARCH_X86, CS_MODE_32)` is repeated in `analyzers/globals.py` (lines
  1202, 1251) and `core/eh.py` (lines 63-64). There is **no** ARM/Thumb code
  path anywhere in `src/` or `tests/` (grep for `ARM|Thumb|CS_ARCH_ARM` returns
  nothing).
- The binary loader is PE-only: `core/pe.py` rejects anything that is not an
  `MZ`/`PE\0\0` image (lines 40-43). A GBA ROM is a raw ARM memory image with no
  PE/MZ header, so it cannot even be opened.
- Core analyzers decode MSVC-specific x86 constructs that do not exist on GBA:
  MSVC SEH/`FuncInfo` C++ exception frames (`core/eh.py` header: "MSVC x86 C++
  exception-handling (FuncInfo) extraction"; `analyzers/seh.py`), x86 `fs:[0]`
  SEH prologues and `push -1` sentinels (`core/disasm.py` `has_msvc_seh_frame`,
  lines 313-325), and MSVC switch jump-table/byte-map layouts (`core/disasm.py`
  lines 172-300). The README states this outright: *"Platform scope:
  `binary-comp` is currently optimized for MSVC-built 32-bit PE reconstruction
  projects"* (`README.md` lines 16-18).

**It verifies an annotated reconstruction, not two independent binaries.**
- The intended workflow keeps the original EXE as reference and rebuilds the
  source with the matching compiler, mapping functions via *source annotations*
  plus the rebuilt linker map (`README.md` lines 23-28). Every function to be
  checked must carry a hand-written `/* Function start: 0x00401000 */` comment in
  the rebuilt source (`README.md` lines 188-204), and globals must encode their
  original address in the symbol name or a comment (lines 206-217).
- That is the opposite of what we need. FE8J↔FE8U is a *cross-version match
  discovery* problem between two already-built ROMs; `binary-comp` requires you
  to have already produced annotated source and a rebuilt PE, then merely scores
  how close that rebuild is. It does not auto-match two independent binaries.

## 3. What we use instead (same intent, ARM/Thumb-native)

- **coddog** — cross-version function matching (the FE8J↔FE8U "which US function
  is this JP function" problem `binary-comp` cannot do).
- **asm-differ** + **objdiff** — per-symbol ARM/Thumb disassembly diffing, the
  GBA-native equivalent of `binary-comp`'s `compare`/`values` passes.
- **decomp-permuter** (`scripts/permuter/`) — drives source toward byte-exact
  matches, with `make compare` (sha1) as the oracle.

## 4. Revisit if…

Only relevant if we ever target an x86 / MSVC 32-bit PE binary — **N/A** for the
GBA ARM/Thumb FE8J ROM.
