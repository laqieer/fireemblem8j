# full16 CBMC harness status

This directory is reserved for per-function CBMC C-vs-spec harnesses generated
from one of the two sound bridges:

- Bridge A: validated reference C, first proven equivalent to `asm/<fn>.s`.
- Bridge B: a cfg_exec-derived observable spec with complete write/call footprint.

No per-function harness is committed yet because neither bridge is available for
the 16 non-matching functions.  `run_full16.py` therefore emits `UNKNOWN` for
each function instead of creating vacuous harnesses.
