#!/usr/bin/env bash
#
# discord_fetch.sh — reusable INCREMENTAL fetch of the FE8 decomp Discord learning
# corpus via DiscordChatExporter (DCE).  Fetches only NEW messages per channel
# (since the last run) into the gitignored docs/refs/discord/ tree.
#
# Why this exists: the decomp.me / pret / FEU Discords are a living source of
# matching tricks, agbcc lore, and new tooling.  We distil learnings into
# docs/discord_findings.md (committed) but NEVER commit the raw logs (IP / piracy
# boundary — see .gitignore docs/refs/discord/).
#
# SECRET HANDLING:
#   - The auth token lives OUTSIDE the repo at ~/.config/fe8j-decomp/discord.env
#     (chmod 600), as `DISCORD_TOKEN=...`.  It is NEVER passed on the command line
#     (DCE reads the DISCORD_TOKEN env var directly -> not visible in `ps`).
#   - Never echo $DISCORD_TOKEN.  Never commit the env file or the logs.
#
# USAGE:
#   scripts/discord_fetch.sh                  # incremental: all channels since last run
#   scripts/discord_fetch.sh ai tools         # only the named channels
#   FE8J_DISCORD_AFTER=2026-06-01 scripts/discord_fetch.sh ai   # override the 'after'
#
# After fetching, distil NEW content into docs/discord_findings.md and commit THAT
# (docs only) — see docs/discord_learning.md for the loop.
set -euo pipefail

# ---- config (override via env) ----------------------------------------------
ENV_FILE="${FE8J_DISCORD_ENV:-$HOME/.config/fe8j-decomp/discord.env}"
DCE_DIR="${DCE_DIR:-$HOME/tools/dce}"
DCE_BIN="$DCE_DIR/DiscordChatExporter.Cli"
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="$REPO_ROOT/docs/refs/discord"
STATE_DIR="$OUT_DIR/.state"
# First-run lower bound: the day the base corpus was exported (2026-06-22).
# Subsequent runs advance per-channel state automatically.
DEFAULT_AFTER="${FE8J_DISCORD_AFTER:-2026-06-22T00:00:00}"

# label  ->  channel id   (the corpus we track)
CHANNELS=(
  "ai:1399506904979345408"               # decomp.me / decompilation / ai  (AI-decomp tooling)
  "tools:1224198647097593876"            # decomp.me / decompilation / tools
  "decomp-general:1232647864337829940"   # decomp.me / decompilation / decomp-general
  "decomp-help:967856276350574673"       # decomp.me / decompilation / decomp-help
  "asm2c:597616808023031819"             # pret / Contributing / asm2c
  "fireemblem8:442465614104231937"       # pret / Not Pokemon / fireemblem8
  "feu-projects-decomp:416236460002377730" # Fire Emblem Universe / Projects / decomp
)

# ---- preflight --------------------------------------------------------------
[ -x "$DCE_BIN" ] || { echo "ERROR: DCE binary not found/executable at $DCE_BIN" >&2; exit 1; }
[ -f "$ENV_FILE" ] || { echo "ERROR: token env file missing at $ENV_FILE (chmod 600, DISCORD_TOKEN=...)" >&2; exit 1; }
# shellcheck disable=SC1090
set -a; . "$ENV_FILE"; set +a
[ -n "${DISCORD_TOKEN:-}" ] || { echo "ERROR: DISCORD_TOKEN not set by $ENV_FILE" >&2; exit 1; }
mkdir -p "$OUT_DIR" "$STATE_DIR"

# ---- --seed: recover each channel's watermark from its committed base export (NO network) ----
# The watermark is a Discord MESSAGE ID (snowflake), NOT a wall-clock timestamp. The old
# date-string `--after` form silently mis-filtered and MISSED a real 6/23 message; `--after
# <messageId>` is unambiguous. Run `discord_fetch.sh --seed` once to migrate from the old state.
if [ "${1:-}" = "--seed" ]; then
  echo "== seeding message-ID watermarks from committed base exports (no network) =="
  for entry in "${CHANNELS[@]}"; do
    label="${entry%%:*}"; cid="${entry##*:}"
    base="$(ls "$OUT_DIR"/*"[${cid}].json" 2>/dev/null | head -1)"
    [ -n "$base" ] || { echo "   ${label}: no base export — skip" >&2; continue; }
    lid="$("${PYTHON:-python3}" -c 'import json,sys; d=json.load(open(sys.argv[1])); m=d.get("messages",[]); print(m[-1]["id"] if m else "")' "$base" 2>/dev/null)"
    [ -n "$lid" ] || { echo "   ${label}: base has no messages — skip" >&2; continue; }
    echo "$lid" > "$STATE_DIR/${label}.lastid"; rm -f "$STATE_DIR/${label}.last"
    echo "   ${label}: watermark -> ${lid}"
  done
  echo "== seeded. Re-run without --seed (with a VALID token) to fetch new messages only. =="
  exit 0
fi

# ---- which channels ---------------------------------------------------------
want=("$@")
selected=()
for entry in "${CHANNELS[@]}"; do
  label="${entry%%:*}"
  if [ ${#want[@]} -eq 0 ]; then selected+=("$entry"); continue; fi
  for w in "${want[@]}"; do [ "$w" = "$label" ] && selected+=("$entry"); done
done
[ ${#selected[@]} -gt 0 ] || { echo "no matching channels for: ${want[*]:-<all>}" >&2; exit 1; }

PY="${PYTHON:-python3}"
last_id_of() {  # print the highest (last) message id in a DCE Json export, or empty
  "$PY" - "$1" <<'PYEOF' 2>/dev/null
import json,sys
try:
    d=json.load(open(sys.argv[1])); m=d.get('messages',[])
    print(m[-1]['id'] if m else '')
except Exception:
    print('')
PYEOF
}

# ---- fetch loop (message-ID watermark) ---------------------------------------
now="$(date -u +%Y-%m-%dT%H:%M:%S)"
echo "== discord_fetch (incremental, message-ID watermark) @ ${now}Z =="
for entry in "${selected[@]}"; do
  label="${entry%%:*}"; cid="${entry##*:}"
  state_file="$STATE_DIR/${label}.lastid"
  after=""; [ -f "$state_file" ] && after="$(cat "$state_file")"
  if [ -z "$after" ]; then
    echo "-- ${label}: NO watermark — run 'scripts/discord_fetch.sh --seed' first (seeds from the base export). Skipping (avoids a full re-fetch / ban risk)." >&2
    continue
  fi
  out="$OUT_DIR/delta_${label}_${cid}_${after}.json"
  err="$OUT_DIR/.dce_err_${label}.log"
  echo "-- ${label} (${cid}) : messages after id ${after}"
  # DCE reads DISCORD_TOKEN from env; do NOT pass -t (keeps token out of `ps`). --after <id> is exact.
  if "$DCE_BIN" export -c "$cid" -f Json --after "$after" -o "$out" >/dev/null 2>"$err"; then
    n="$(grep -o '"messageCount":[0-9]*' "$out" 2>/dev/null | head -1 | grep -o '[0-9]*' || echo 0)"
    if [ "${n:-0}" = "0" ]; then
      echo "   -> 0 new messages"; rm -f "$out"
    else
      newid="$(last_id_of "$out")"
      echo "   -> ${n} new messages ($(basename "$out")); watermark -> ${newid:-<unchanged>}"
      [ -n "$newid" ] && echo "$newid" > "$state_file"   # advance only to the real last id
    fi
  else
    if grep -qiE 'token is invalid|unauthorized|\b401\b' "$err" 2>/dev/null; then
      echo "   !! TOKEN INVALID — refresh ~/.config/fe8j-decomp/discord.env; do NOT retry-spam (ban risk)." >&2
    else
      echo "   !! DCE export failed (see $err); watermark NOT advanced." >&2
    fi
  fi
done
echo "== done.  Distil new content into docs/discord_findings.md (commit docs only, NEVER the raw json). =="
