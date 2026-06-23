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

# ---- which channels ---------------------------------------------------------
want=("$@")
selected=()
for entry in "${CHANNELS[@]}"; do
  label="${entry%%:*}"
  if [ ${#want[@]} -eq 0 ]; then selected+=("$entry"); continue; fi
  for w in "${want[@]}"; do [ "$w" = "$label" ] && selected+=("$entry"); done
done
[ ${#selected[@]} -gt 0 ] || { echo "no matching channels for: ${want[*]:-<all>}" >&2; exit 1; }

# ---- fetch loop -------------------------------------------------------------
now="$(date -u +%Y-%m-%dT%H:%M:%S)"
echo "== discord_fetch (incremental) @ ${now}Z =="
for entry in "${selected[@]}"; do
  label="${entry%%:*}"; cid="${entry##*:}"
  state_file="$STATE_DIR/${label}.last"
  after="$DEFAULT_AFTER"; [ -f "$state_file" ] && after="$(cat "$state_file")"
  out="$OUT_DIR/delta_${label}_${cid}_$(echo "$after" | tr -d ':-').json"
  echo "-- ${label} (${cid}) : messages after ${after}"
  # DCE reads DISCORD_TOKEN from env; do NOT pass -t (keeps token out of `ps`).
  if "$DCE_BIN" export -c "$cid" -f Json --after "$after" -o "$out" >/dev/null 2>"$OUT_DIR/.dce_err_${label}.log"; then
    # messageCount is in the JSON header; grep it cheaply.
    n="$(grep -o '"messageCount":[0-9]*' "$out" 2>/dev/null | head -1 | grep -o '[0-9]*' || echo '?')"
    echo "   -> ${n:-0} new messages  ($(basename "$out"))"
    [ "${n:-0}" = "0" ] && rm -f "$out"   # drop empty deltas to keep the tree clean
    echo "$now" > "$state_file"           # advance watermark only on success
  else
    echo "   !! DCE export failed (see $OUT_DIR/.dce_err_${label}.log); watermark NOT advanced" >&2
  fi
done
echo "== done.  Distil new content into docs/discord_findings.md (commit docs only, NEVER the raw json). =="
