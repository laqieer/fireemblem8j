#!/bin/sh
# build_jp_agbcc.sh — build the agbcc thumb compiler with the JP "-mjp-promote" FLAG.
#
# WHY (D276/D276b/D276c): a subset of FE8-JP functions only byte-match under an agbcc
# whose thumb config (a) PRESERVES sub-word type signedness in PROMOTE_MODE (s8/s16 ->
# sign-extend) and (b) defines PROMOTE_FUNCTION_ARGS (callee extends incoming sub-word
# params at entry in DECLARATION order). Rather than ship a SECOND binary, both behaviors
# are gated behind a new `-mjp-promote` target flag so ONE agbcc serves everything:
#   * DEFAULT (no flag) = byte-identical to stock agbcc -> the ~8077 normal TUs are unchanged.
#   * `-mjp-promote`     = the JP promotion behavior -> the per-TU JP functions byte-match.
# The Makefile adds `CC1FLAGS += -mjp-promote` per-TU (like the m4a CC1_OLD override).
#
# This OVERWRITES the thumb compiler tools/agbcc/bin/agbcc (built earlier by the normal
# pret/agbcc ./build.sh) with the flag-capable build. old_agbcc / agbcc_arm / libc /
# libgcc from the normal install are kept (the flag defaults off, so they are unaffected).
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
AGBCC_URL="https://github.com/pret/agbcc.git"
# PINNED for determinism: the pret/agbcc commit the flag patch + validation were done on.
AGBCC_COMMIT="da598c1d918402c42c0c0d7128ba14567f3175e9"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

echo "[jp_agbcc] cloning pret/agbcc @ $AGBCC_COMMIT ..."
git clone "$AGBCC_URL" "$WORK/agbcc"
git -C "$WORK/agbcc" checkout --quiet "$AGBCC_COMMIT"

echo "[jp_agbcc] adding the -mjp-promote flag (PROMOTE_MODE + PROMOTE_FUNCTION_ARGS, runtime-gated) ..."
python3 - "$WORK/agbcc/gcc" <<'PY'
import sys, re
D = sys.argv[1] + "/"

# --- gcc/thumb.h: declare the flag, gate PROMOTE_MODE, always-define PROMOTE_FUNCTION_ARGS
f = D + "thumb.h"; s = open(f).read()
s, n = re.subn(r'(#define ARM_FLAG_LONG_CALLS\t\(0x10000\)[^\n]*\n)',
               r'\1#define ARM_FLAG_JP_PROMOTE\t(0x20000)\n', s); assert n == 1, ("bit", n)
s, n = re.subn(r'(#define TARGET_LONG_CALLS\t\t\(target_flags & ARM_FLAG_LONG_CALLS\)\n)',
               r'\1#define TARGET_JP_PROMOTE\t(target_flags & ARM_FLAG_JP_PROMOTE)\n', s); assert n == 1, ("macro", n)
s, n = re.subn(r'(  \{"no-long-calls",\t       -ARM_FLAG_LONG_CALLS, ""\},\t\\\n)',
               r'\1  {"jp-promote",\t\tARM_FLAG_JP_PROMOTE, ""},\t\\\n', s); assert n == 1, ("switch", n)
# gate the force-zero-extend of sub-word ints on the flag (default OFF = stock)
s, n = re.subn(r'(\{\s*\\\n  if \(GET_MODE_CLASS \(MODE\) == MODE_INT\t\t\\\n      && GET_MODE_SIZE \(MODE\) < 4\)\t\t\\\n    \{\t\t\t\t\t\t\\\n)      \(UNSIGNEDP\) = 1;(\t*\\\n)',
               r'\1      if (! TARGET_JP_PROMOTE) (UNSIGNEDP) = 1;\2', s); assert n == 1, ("promote_mode", n)
# define PROMOTE_FUNCTION_ARGS so the arg-promotion code compiles in; the actual
# promotion is runtime-gated on TARGET_JP_PROMOTE at every use site below.
s, n = re.subn(r'(#define PROMOTE_PROTOTYPES 1\n)', r'#define PROMOTE_FUNCTION_ARGS\n\1', s); assert n == 1, ("pfa_def", n)
open(f, 'w').write(s)

# --- gcc/calls.c: gate the outgoing-arg promotion
f = D + "calls.c"; s = open(f).read()
s, n = re.subn(r'\n      mode = promote_mode \(type, mode, &unsignedp, 1\);\n',
               r'\n      if (TARGET_JP_PROMOTE) mode = promote_mode (type, mode, &unsignedp, 1);\n', s); assert n == 1, ("calls", n)
open(f, 'w').write(s)

# --- gcc/function.c: gate the incoming-param promotion
f = D + "function.c"; s = open(f).read()
s, n = re.subn(r'\n      unsignedp = TREE_UNSIGNED \(passed_type\);\n      promoted_mode = promote_mode \(passed_type, promoted_mode, &unsignedp, 1\);\n',
               r'\n      if (TARGET_JP_PROMOTE) {\n      unsignedp = TREE_UNSIGNED (passed_type);\n      promoted_mode = promote_mode (passed_type, promoted_mode, &unsignedp, 1);\n      }\n', s); assert n == 1, ("func", n)
open(f, 'w').write(s)

# --- gcc/combine.c: gate the setup_incoming_promotions loop
f = D + "combine.c"; s = open(f).read()
s, n = re.subn(r'(  rtx first = get_insns \(\);\n\n)(  for \(regno = 0; regno < FIRST_PSEUDO_REGISTER; regno\+\+\))',
               r'\1  if (TARGET_JP_PROMOTE)\n\2', s); assert n == 1, ("combine", n)
open(f, 'w').write(s)
print("[jp_agbcc] flag patch applied (4 files, all asserts passed)")
PY

echo "[jp_agbcc] building the flag-capable thumb agbcc (serial) ..."
make -C "$WORK/agbcc/gcc" -j1

mkdir -p "$ROOT/tools/agbcc/bin"
cp "$WORK/agbcc/gcc/agbcc" "$ROOT/tools/agbcc/bin/agbcc"
echo "[jp_agbcc] installed flag-capable agbcc -> tools/agbcc/bin/agbcc (default = stock; -mjp-promote = JP)"
