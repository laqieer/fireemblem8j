#!/usr/bin/env bash
# Clone the canonical Ghidra project into an isolated copy for GitHub Copilot CLI.
#
# A Ghidra project takes an EXCLUSIVE lock (<name>.lock) while open, so a single
# project cannot be served by two pyghidra-mcp processes at once. Claude Code's
# `ghidra` MCP server holds `fe8j` for the whole session; if Copilot CLI's
# pyghidra-mcp opened the same project it would fail with "Connection closed"
# (and vice-versa). Giving Copilot its own copy (`fe8j-cp`) lets both decompile
# concurrently. IDA needs no such copy — its idalib worker is shared via the
# instance registry (~/.idapro/mcp/instances). See docs/reverse-engineering.md
# and docs/decisions.md (D18).
#
# Run this AFTER `make ghidra-db` rebuilds the canonical project, to keep
# Copilot's copy in sync (otherwise fe8j-cp silently goes stale):
#
#     make ghidra-db && make ghidra-cp     # or: scripts/ghidra/clone_copilot_project.sh
#
# Copilot's ~/.copilot/mcp-config.json must set the ghidra server's
# `--project-name` to the destination ($DST below, default fe8j-cp).
set -euo pipefail

PROJ_DIR="${GHIDRA_PROJECT_DIR:-$HOME/ghidra-projects}"
SRC="${1:-fe8j}"
DST="${2:-fe8j-cp}"

cd "$PROJ_DIR"

[ -e "$SRC.gpr" ] || {
    echo "error: source project $PROJ_DIR/$SRC.gpr not found — run 'make ghidra-db' first" >&2
    exit 1
}

# Refuse to touch a project a pyghidra-mcp is actively using (copying a live
# project yields inconsistent state; clobbering an in-use copy corrupts it).
in_use() { pgrep -af pyghidra 2>/dev/null | grep -Eq -- "--project-name $1( |\$)"; }
if in_use "$SRC" || in_use "$DST"; then
    echo "error: a pyghidra-mcp is using '$SRC' or '$DST' — stop it first:" >&2
    echo "       ps -ef | grep pyghidra   # then kill the specific PID" >&2
    exit 1
fi

echo "Refreshing Copilot's isolated Ghidra project: $SRC -> $DST  (in $PROJ_DIR)"
rm -rf -- "$DST.gpr" "$DST.rep" "$DST-pyghidra-mcp" "$DST.lock" "$DST.lock~"
cp -a -- "$SRC.gpr" "$DST.gpr"
cp -a -- "$SRC.rep" "$DST.rep"
[ -e "$SRC-pyghidra-mcp" ] && cp -a -- "$SRC-pyghidra-mcp" "$DST-pyghidra-mcp"
# Never carry over a stale lock into the fresh copy.
rm -f -- "$DST.lock" "$DST.lock~"
find "$DST.rep" -name '*.lock' -delete 2>/dev/null || true

echo "Done. Copilot ghidra --project-name should be '$DST' (~/.copilot/mcp-config.json)."
