#!/usr/bin/env bash
#
# mark_solved.sh — mark a decomp.me scratch you OWN as SOLVED (score 0), so the
# community never re-derives an already-matched function.
#
# WHY THIS EXISTS: a scratch left "unmatched" for a function that is actually
# solved (either carved in-repo, or matched by a community fork) wastes other
# people's effort — someone may spend hours re-matching it. This happened once
# (sub_80D17C8 / VAkhM, re-matched by TsilaAllaoui after it was already carved as
# LoadClassReelFontPalette, D307). Whenever a function is carved in the repo, or a
# fork of your scratch reaches score 0, close your scratch out with this script.
#
# It PATCHes your scratch's source_code/compiler/flags to the matched solution
# (pulled from a matched scratch/fork slug, or from a local .c file) so it
# compiles to score 0, and annotates the name as SOLVED (crediting the matcher).
#
# Requires auth (see setup_auth.sh): ~/.config/fe8j-decomp/decompme.env with
# DECOMPME_SESSION + DECOMPME_CSRF. You must own the target scratch.
#
# Usage:
#   scripts/tools/decompme/mark_solved.sh <your_slug> --from-scratch <matched_slug> [--credit <name>]
#   scripts/tools/decompme/mark_solved.sh <your_slug> --from-file <matched.c> --flags "<compiler_flags>" [--credit <name>]
#
set -euo pipefail

die() { echo "error: $*" >&2; exit 1; }

API="${DECOMPME_API_BASE:-https://decomp.me/api}"
UA="Mozilla/5.0 (X11; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0"
ENV_FILE="${DECOMPME_ENV:-$HOME/.config/fe8j-decomp/decompme.env}"
[ -f "$ENV_FILE" ] || die "no auth env ($ENV_FILE) — run setup_auth.sh first (you must own the scratch)."
# shellcheck disable=SC1090
set -a; . "$ENV_FILE"; set +a
[ -n "${DECOMPME_SESSION:-}" ] || die "DECOMPME_SESSION missing in $ENV_FILE"

slug="${1:?usage: mark_solved.sh <your_slug> --from-scratch <matched_slug> | --from-file <c> --flags <flags> [--credit <name>]}"
shift
mode=""; src_slug=""; src_file=""; flags=""; credit=""
while [ $# -gt 0 ]; do
    case "$1" in
        --from-scratch) mode=scratch; src_slug="$2"; shift 2 ;;
        --from-file)    mode=file; src_file="$2"; shift 2 ;;
        --flags)        flags="$2"; shift 2 ;;
        --credit)       credit="$2"; shift 2 ;;
        *) die "unknown arg: $1" ;;
    esac
done

get() { curl -sS --max-time 30 -H "User-Agent: $UA" -H "Accept: application/json" -H "Referer: https://decomp.me/" "$@"; }

# Resolve the matched source + compiler/flags.
if [ "$mode" = scratch ]; then
    [ -n "$src_slug" ] || die "--from-scratch needs a slug"
    j="$(get "$API/scratch/$src_slug")"
    score="$(printf '%s' "$j" | python3 -c 'import json,sys;print(json.load(sys.stdin).get("score"))')"
    [ "$score" = "0" ] || die "source scratch $src_slug is score=$score (not a confirmed match); refusing."
    export SRC_JSON="$j"
    [ -n "$credit" ] || credit="$(printf '%s' "$j" | python3 -c 'import json,sys;print((json.load(sys.stdin).get("owner") or {}).get("username") or "")')"
elif [ "$mode" = file ]; then
    [ -f "$src_file" ] || die "--from-file not found: $src_file"
    [ -n "$flags" ] || die "--from-file requires --flags \"<compiler_flags>\""
    export SRC_FILE="$src_file" SRC_FLAGS="$flags"
else
    die "specify --from-scratch <slug> or --from-file <c> --flags <flags>"
fi

# Verify we own the target scratch (and get its current name).
whoami="$(get -H "Cookie: sessionid=$DECOMPME_SESSION; csrftoken=${DECOMPME_CSRF:-}" "$API/user" | python3 -c 'import json,sys;d=json.load(sys.stdin);print("ANON" if d.get("is_anonymous") else d.get("username",""))')"
[ -n "$whoami" ] && [ "$whoami" != "ANON" ] || die "not authenticated (decomp.me sees you as anonymous)."
tgt="$(get "$API/scratch/$slug")"
owner="$(printf '%s' "$tgt" | python3 -c 'import json,sys;print((json.load(sys.stdin).get("owner") or {}).get("username") or "")')"
[ "$owner" = "$whoami" ] || die "you ($whoami) do not own scratch $slug (owner=$owner) — cannot mark it solved."
export TGT_JSON="$tgt" CREDIT="$credit"

# Build the PATCH body and send it (auth via Cookie + X-CSRFToken).
CSRF="${DECOMPME_CSRF:-}" SESS="$DECOMPME_SESSION" SLUG="$slug" API="$API" UA="$UA" python3 - <<'PY'
import os, json, urllib.request
def get_src():
    if os.environ.get("SRC_JSON"):
        d=json.loads(os.environ["SRC_JSON"])
        return d.get("source_code",""), d.get("context","") or "", d.get("compiler","agbcc"), d.get("compiler_flags","")
    return open(os.environ["SRC_FILE"]).read(), "", "agbcc", os.environ["SRC_FLAGS"]
src, ctx, comp, flags = get_src()
tgt=json.loads(os.environ["TGT_JSON"]); name=tgt.get("name") or ""
credit=os.environ.get("CREDIT","")
if "SOLVED" not in name:
    name = name.split(" — ")[0].strip() + " — SOLVED" + (f" (match credit: {credit})" if credit else "")
body={"name":name,"source_code":src,"compiler":comp,"compiler_flags":flags}
if ctx: body["context"]=ctx
req=urllib.request.Request(os.environ["API"]+"/scratch/"+os.environ["SLUG"], data=json.dumps(body).encode(),
    method="PATCH", headers={"User-Agent":os.environ["UA"],"Referer":"https://decomp.me/",
    "Content-Type":"application/json","Accept":"application/json","X-CSRFToken":os.environ["CSRF"],
    "Cookie":f"sessionid={os.environ['SESS']}; csrftoken={os.environ['CSRF']}"})
try:
    with urllib.request.urlopen(req,timeout=30) as r:
        d=json.load(r); print("PATCHed", os.environ["SLUG"], "->", (d.get('name') or '')[:70])
except urllib.error.HTTPError as e:
    raise SystemExit("PATCH failed HTTP %s: %s" % (e.code, e.read().decode()[:300]))
PY

echo "Done. Re-check score in a few seconds:"
echo "  curl -s -H 'User-Agent: $UA' -H 'Accept: application/json' -H 'Referer: https://decomp.me/' $API/scratch/$slug | python3 -c 'import json,sys;print(\"score\",json.load(sys.stdin).get(\"score\"))'"
