#!/usr/bin/env bash
#
# setup_auth.sh — interactively configure decomp.me account auth for FE8J posting.
#
# Run this in YOUR OWN terminal. It prompts for your decomp.me session cookies
# (read silently, never echoed, never logged), writes them to a gitignored,
# chmod-600 env file OUTSIDE the repo, and verifies the login works. Once set,
# scripts/tools/decompme/new_scratch.sh posts scratches OWNED by your account
# (claimable / updatable); without it, posting stays anonymous.
#
# HOW TO GET THE TWO VALUES (one-time):
#   1. Log into https://decomp.me in your browser (GitHub OAuth, etc.).
#   2. Open DevTools (F12) -> Application (Chrome) / Storage (Firefox)
#      -> Cookies -> https://decomp.me
#   3. Copy the VALUE of the `sessionid` cookie and the `csrftoken` cookie.
#   (sessionid authenticates you; csrftoken satisfies Django's POST CSRF check.)
#
# Re-run anytime to rotate the cookies (they expire periodically).
#
set -euo pipefail

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fe8j-decomp"
ENV_FILE="$CONFIG_DIR/decompme.env"
API="${DECOMPME_API_BASE:-https://decomp.me/api}"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120 Safari/537.36"

bold() { printf '\033[1m%s\033[0m\n' "$1"; }

bold "decomp.me account auth setup (FE8J)"
echo
echo "Get these from your browser while logged into https://decomp.me:"
echo "  DevTools (F12) -> Cookies -> https://decomp.me -> copy 'sessionid' and 'csrftoken'."
echo "Values are read SILENTLY (not shown, not logged)."
echo

# Read silently so the secret never lands on screen or in shell history.
printf 'Paste your decomp.me sessionid cookie value: '
read -rs SESSION
echo
printf 'Paste your decomp.me csrftoken cookie value:  '
read -rs CSRF
echo

if [ -z "${SESSION:-}" ]; then
    echo "error: sessionid is empty — aborting (nothing written)." >&2
    exit 1
fi

# Verify BEFORE writing, so we never persist a bad cookie.
echo
echo "Verifying login with decomp.me ..."
cookie="sessionid=${SESSION}"
[ -n "${CSRF:-}" ] && cookie="${cookie}; csrftoken=${CSRF}"
who="$(curl -sS --max-time 25 -A "$UA" -H "Referer: https://decomp.me/" \
        -H "Cookie: ${cookie}" "$API/user" 2>/dev/null \
        | python3 -c 'import json,sys; d=json.load(sys.stdin); print(("ANON" if d.get("is_anonymous") else d.get("username","?")))' 2>/dev/null || echo "ERR")"

if [ "$who" = "ANON" ] || [ "$who" = "ERR" ] || [ -z "$who" ]; then
    echo "error: that cookie did NOT authenticate (decomp.me sees you as anonymous)." >&2
    echo "       Make sure you're logged in and copied the CURRENT sessionid. Nothing written." >&2
    exit 1
fi
bold "  ✓ authenticated as: $who"

# Persist with tight perms, outside the repo.
mkdir -p "$CONFIG_DIR"
( umask 077
  printf 'DECOMPME_SESSION=%s\nDECOMPME_CSRF=%s\n' "$SESSION" "$CSRF" > "$ENV_FILE" )
chmod 600 "$ENV_FILE"

echo
bold "Done. Saved to: $ENV_FILE (chmod 600, gitignored, outside the repo)."
echo "scripts/tools/decompme/new_scratch.sh will now post under your account ($who)."
echo "Tell the assistant \"done\" and it'll verify + post the FE8J scratches owned by you."
