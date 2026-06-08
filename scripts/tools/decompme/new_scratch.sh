#!/usr/bin/env bash
#
# new_scratch.sh — create a decomp.me scratch for a tricky FE8J function.
#
# !!! THIS PUBLISHES TO A PUBLIC, OUTWARD-FACING SERVICE (https://decomp.me) !!!
#
# Creating a scratch uploads the target asm, your context (headers), and your C
# source to decomp.me, where ANYONE can view and fork it. This is a DELIBERATE,
# OPT-IN, MANUAL action. It is intentionally NOT something an autonomous loop
# should run. To guard against accidental publishing, this script refuses to do
# anything unless you explicitly set:
#
#     DECOMPME_PUBLISH=1
#
# Defaults to the GBA platform + agbcc compiler (this project's toolchain).
# See docs/tools/decomp-me.md for the full rationale and API field reference.
#
# Usage:
#   DECOMPME_PUBLISH=1 scripts/tools/decompme/new_scratch.sh \
#       --asm path/to/func.s \
#       [--context path/to/context.h] \
#       [--label FuncName] \
#       [--name "Scratch name"] \
#       [--source path/to/initial.c] \
#       [--compiler agbcc] \
#       [--platform gba] \
#       [--flags "-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2"]
#
# On success it prints the scratch URL (https://decomp.me/scratch/<slug>).

set -euo pipefail

readonly API_BASE="${DECOMPME_API_BASE:-https://decomp.me/api}"
readonly SITE_BASE="${DECOMPME_SITE_BASE:-https://decomp.me}"

die() {
    printf 'error: %s\n' "$1" >&2
    exit 1
}

usage() {
    # Print only the leading comment header (lines 2..29), stripping "# ".
    sed -n '2,29p' "$0" | sed 's/^# \{0,1\}//'
    exit "${1:-0}"
}

# ---- Defaults matching this project's toolchain --------------------------
platform="gba"
compiler="agbcc"
# Mirrors the local CC1FLAGS minus local-only debug/format flags
# (-fhex-asm/-ffix-debug-line/-g), so a scratch that builds here also builds
# under the repo's -Werror rule. -O2/-mthumb-interwork drive matching; the -W*
# flags don't affect codegen but keep the warning-as-error behavior consistent.
flags="-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2"
asm_file=""
context_file=""
source_file=""
label=""
name=""

# ---- Parse args ----------------------------------------------------------
# need_val OPTION: require that a value-taking option was given an argument.
# Without this, `--asm` with no following value would hit `shift 2` on a
# single remaining arg and abort with Bash's raw "shift: shift count out of
# range" under `set -e`, before our friendly error/usage path runs.
need_val() {
    [ "$#" -ge 2 ] || die "option $1 requires a value (use --help)"
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --asm)       need_val "$@"; asm_file="$2"; shift 2 ;;
        --context)   need_val "$@"; context_file="$2"; shift 2 ;;
        --source)    need_val "$@"; source_file="$2"; shift 2 ;;
        --label)     need_val "$@"; label="$2"; shift 2 ;;
        --name)      need_val "$@"; name="$2"; shift 2 ;;
        --compiler)  need_val "$@"; compiler="$2"; shift 2 ;;
        --platform)  need_val "$@"; platform="$2"; shift 2 ;;
        --flags)     need_val "$@"; flags="$2"; shift 2 ;;
        -h|--help)   usage 0 ;;
        *)           die "unknown argument: $1 (use --help)" ;;
    esac
done

# ---- Hard opt-in gate (prevents accidental publishing) -------------------
if [ "${DECOMPME_PUBLISH:-}" != "1" ]; then
    cat >&2 <<'EOF'
refusing to publish: DECOMPME_PUBLISH is not set to 1.

Creating a decomp.me scratch uploads your asm/context/source to a PUBLIC site.
This is intentional friction. If you really mean to publish, re-run with:

    DECOMPME_PUBLISH=1 scripts/tools/decompme/new_scratch.sh ...
EOF
    exit 2
fi

# ---- Validate inputs -----------------------------------------------------
command -v curl >/dev/null 2>&1 || die "curl is required"
command -v python3 >/dev/null 2>&1 || die "python3 is required (for JSON encoding)"

[ -n "$asm_file" ] || die "--asm <file> is required"
[ -f "$asm_file" ] || die "asm file not found: $asm_file"
if [ -n "$context_file" ]; then
    [ -f "$context_file" ] || die "context file not found: $context_file"
fi
if [ -n "$source_file" ]; then
    [ -f "$source_file" ] || die "source file not found: $source_file"
fi

# ---- Build the JSON body safely (python3 handles all escaping) -----------
# Inputs are passed via environment (not argv), so file contents never appear
# in the process list. The assembled JSON is written to a temp file and POSTed
# with `--data-binary @file`, so it never hits curl's argv either.
body_file="$(mktemp)"
trap 'rm -f "$body_file"' EXIT

DM_PLATFORM="$platform" \
DM_COMPILER="$compiler" \
DM_FLAGS="$flags" \
DM_LABEL="$label" \
DM_NAME="$name" \
DM_ASM_FILE="$asm_file" \
DM_CONTEXT_FILE="$context_file" \
DM_SOURCE_FILE="$source_file" \
python3 - > "$body_file" <<'PY'
import json
import os


def read(path):
    if not path:
        return ""
    with open(path, "r", encoding="utf-8") as f:
        return f.read()


payload = {
    "platform": os.environ["DM_PLATFORM"],
    "compiler": os.environ["DM_COMPILER"],
    "compiler_flags": os.environ["DM_FLAGS"],
    "target_asm": read(os.environ.get("DM_ASM_FILE", "")),
    "context": read(os.environ.get("DM_CONTEXT_FILE", "")),
}

label = os.environ.get("DM_LABEL", "")
if label:
    payload["diff_label"] = label

name = os.environ.get("DM_NAME", "")
if name:
    payload["name"] = name

source = read(os.environ.get("DM_SOURCE_FILE", ""))
if source:
    payload["source_code"] = source

print(json.dumps(payload))
PY

# ---- Final confirmation banner -------------------------------------------
printf '>>> Publishing a PUBLIC scratch to %s\n' "$SITE_BASE" >&2
printf '    platform=%s compiler=%s flags=%s\n' "$platform" "$compiler" "$flags" >&2

# ---- POST ----------------------------------------------------------------
# Capture response body + HTTP status separately so we can report failures.
tmp_resp="$(mktemp)"
trap 'rm -f "$body_file" "$tmp_resp"' EXIT

http_code="$(
    curl -sS --max-time 60 \
        -X POST "$API_BASE/scratch" \
        -H "Content-Type: application/json" \
        --data-binary @"$body_file" \
        -o "$tmp_resp" \
        -w "%{http_code}"
)"

if [ "$http_code" != "201" ]; then
    printf 'error: decomp.me returned HTTP %s\n' "$http_code" >&2
    cat "$tmp_resp" >&2 || true
    exit 1
fi

slug="$(python3 -c 'import json,sys; print(json.load(sys.stdin).get("slug",""))' < "$tmp_resp")"
[ -n "$slug" ] || die "created scratch but no slug in response: $(cat "$tmp_resp")"

printf '%s/scratch/%s\n' "$SITE_BASE" "$slug"
