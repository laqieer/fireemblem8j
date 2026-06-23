#!/bin/sh
# build_jp_agbcc.sh — build the "jp_agbcc" thumb compiler variant.
#
# WHY (D275): the stock agbcc's thumb config (gcc/thumb.h PROMOTE_MODE) FORCE-zero-
# extends ALL sub-word values (UNSIGNEDP=1 for both QImode and HImode). The JP-FE8
# build instead PRESERVED type signedness, so an s8/s16 value held across a function
# body is SIGN-extended (asrs), not zero-extended (lsrs). Functions that do this only
# byte-match under a compiler with the signedness-preserving PROMOTE_MODE — the
# "s8/s16-hold" ceiling class. This variant is applied PER-TU (Makefile CC1_JP, like
# CC1_OLD for m4a) because it is NOT globally byte-neutral (most TUs want the stock
# force-zero-extend; only the hold-form functions want this).
#
# Output: tools/agbcc/bin/jp_agbcc  (gitignored, like the rest of tools/agbcc).
# Run AFTER the normal agbcc install (it reuses the same pret/agbcc source/commit).
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGBCC_URL="https://github.com/pret/agbcc.git"
# PINNED commit for determinism (Copilot review): the jp_agbcc binary must be
# reproducible. This is the pret/agbcc commit the patch + validation were done on.
AGBCC_COMMIT="da598c1d918402c42c0c0d7128ba14567f3175e9"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

echo "[jp_agbcc] cloning pret/agbcc @ $AGBCC_COMMIT ..."
git clone "$AGBCC_URL" "$WORK/agbcc"
git -C "$WORK/agbcc" checkout --quiet "$AGBCC_COMMIT"

echo "[jp_agbcc] patching thumb config (D276): preserve sub-word signedness + promote function args ..."
python3 - "$WORK/agbcc/gcc/thumb.h" <<'PY'
import sys, re
p = sys.argv[1]
s = open(p).read()
# Knob 1 (PROMOTE_MODE): drop the force `(UNSIGNEDP) = 1;` so sub-word ints keep
# their type signedness (s8/s16 -> sign-extend, u8/u16 -> zero) -> s8/s16 "hold-form".
pat = re.compile(r'(\#define PROMOTE_MODE\(MODE,UNSIGNEDP,TYPE\).*?MODE_SIZE \(MODE\) < 4\)\s*\\\n\s*\{\s*\\\n)\s*\(UNSIGNEDP\) = 1;\s*\\\n', re.S)
s, n1 = pat.subn(r'\1', s)
assert n1 == 1, "expected exactly one PROMOTE_MODE force-unsigned line, found %d" % n1
# Knob 2 (PROMOTE_FUNCTION_ARGS): the thumb config omits it (the ARM config defines it).
# Defining it makes the callee promote/extend its incoming sub-word params at entry in
# DECLARATION order -> matches JP's arg-extension-ORDER class (e.g. AddGorgonEggTrap).
assert 'PROMOTE_FUNCTION_ARGS' not in s, "PROMOTE_FUNCTION_ARGS already present"
s, n2 = re.subn(r'^#define PROMOTE_PROTOTYPES 1', '#define PROMOTE_FUNCTION_ARGS\n#define PROMOTE_PROTOTYPES 1', s, count=1, flags=re.M)
assert n2 == 1, "expected exactly one PROMOTE_PROTOTYPES anchor, found %d" % n2
open(p, 'w').write(s)
print("[jp_agbcc] patched OK (PROMOTE_MODE + PROMOTE_FUNCTION_ARGS)")
PY

echo "[jp_agbcc] building thumb agbcc (serial; genrtl.h codegen must precede rtl.o) ..."
make -C "$WORK/agbcc/gcc" -j1

mkdir -p "$ROOT/tools/agbcc/bin"
cp "$WORK/agbcc/gcc/agbcc" "$ROOT/tools/agbcc/bin/jp_agbcc"
echo "[jp_agbcc] installed -> tools/agbcc/bin/jp_agbcc"
