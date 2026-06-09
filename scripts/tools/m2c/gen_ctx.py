#!/usr/bin/env python3
"""Generate the m2c context file (m2ctx-style) for FE8J.

m2c (`--context ctx.c`) wants a single C file of struct/typedef/prototype
context so it emits TYPED args/fields instead of `void *` / `unkNN`
placeholders. The community m2ctx pattern (oot/mm/pokeemerald) is: gather the
project headers, run them through the C preprocessor with the build's include
flags, and hand the flattened result to m2c.

FE8J specifics:
  * The canonical aggregate header is `include/global.h` (it pulls in
    types.h / variables.h / functions.h + the gba/* headers), so preprocessing
    one tiny `#include "global.h"` TU captures the whole project's type and
    prototype surface that any region-different function might touch.
  * The build CPP flags are the Makefile's CPPFLAGS
    (`-I tools/agbcc/include -iquote include -iquote . -nostdinc -undef`).
  * m2c parses C with the *vendored* `m2c_pycparser`, which does NOT understand
    agbcc/GCC attribute syntax (`__attribute__((...))`, `__asm__`, etc.). The
    real build feeds the same headers to agbcc, which DOES, so we cannot strip
    them from the headers. Instead we neutralize them ONLY for the ctx by
    `-imacros` defining them away before preprocessing -- the oracle build is
    untouched (it never sees this file).

The generated ctx (`tools/m2c/fe8j_ctx.c` by default) is a build artifact and is
gitignored; THIS generator is what's committed, so the ctx is always
regenerable. `scripts/m2c_firstpass.py` regenerates it on demand.

Usage:
    scripts/tools/m2c/gen_ctx.py [-o OUTPUT]
"""
import argparse
import os
import shutil
import subprocess
import sys
import tempfile

# scripts/tools/m2c/gen_ctx.py -> repo root is four levels up.
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))

# Mirror the Makefile CPPFLAGS so the ctx sees exactly the build's headers.
CPPFLAGS = [
    "-I", "tools/agbcc/include",
    "-iquote", "include",
    "-iquote", ".",
    "-nostdinc",
    "-undef",
]

# Neutralize pycparser-incompatible constructs for the CONTEXT ONLY (the oracle
# build never includes this file). Defining the attribute macros to nothing lets
# the flattened ctx parse cleanly while leaving struct layouts intact.
NEUTRALIZE = """\
#define __attribute__(x)
#define __asm__(...)
#define __volatile__(x)
#define __inline__
#define __signed__ signed
#define __const const
#define asm(...)
#define volatile
"""

DEFAULT_OUT = os.path.join(ROOT, "tools", "m2c", "fe8j_ctx.c")


def find_cpp():
    for cand in ("arm-none-eabi-cpp", "cpp"):
        p = shutil.which(cand)
        if p:
            return p
    return "cpp"


def generate(out_path):
    os.chdir(ROOT)
    cpp = find_cpp()
    with tempfile.TemporaryDirectory() as td:
        neutral = os.path.join(td, "neutralize.h")
        with open(neutral, "w") as f:
            f.write(NEUTRALIZE)
        ctx_tu = os.path.join(td, "ctx_tu.c")
        with open(ctx_tu, "w") as f:
            f.write('#include "global.h"\n')

        cmd = [cpp] + CPPFLAGS + ["-imacros", neutral, ctx_tu]
        res = subprocess.run(cmd, capture_output=True, text=True)
        if res.returncode != 0:
            sys.stderr.write("cpp failed generating ctx:\n" + res.stderr)
            return 1
        os.makedirs(os.path.dirname(out_path), exist_ok=True)
        with open(out_path, "w") as f:
            f.write("/* AUTO-GENERATED m2c context for FE8J -- do not edit.\n")
            f.write(" * Regenerate: scripts/tools/m2c/gen_ctx.py\n")
            f.write(" * Source: preprocessed include/global.h (build CPPFLAGS,\n")
            f.write(" * attributes neutralized for m2c's pycparser). NOT a build input. */\n")
            f.write(res.stdout)
    n = sum(1 for _ in open(out_path))
    print(f"wrote {out_path} ({n} lines)")
    return 0


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-o", "--output", default=DEFAULT_OUT,
                    help=f"output ctx file (default: {DEFAULT_OUT})")
    args = ap.parse_args()
    return generate(args.output)


if __name__ == "__main__":
    sys.exit(main())
