#!/usr/bin/env bash
# Build a cached, fully-analyzed Ghidra project of fireemblem8.elf, for the
# pyghidra-mcp second-opinion decompiler (server `ghidra`). One-time and SLOW
# (Ghidra's full analysis of the 16 MB image takes tens of minutes); the result
# is cached so the MCP opens it quickly afterwards. Re-run after meaningful
# decomp progress to refresh symbols. See docs/reverse-engineering.md.
#
# Feeding Ghidra the ELF (not baserom.gba) means its ELF loader applies the ARM
# `$a`/`$t` mapping symbols, so analysis gets ARM-vs-Thumb right per function —
# which the raw .gba lacks. The .gpr/.rep land outside the repo (gitignored anyway).
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$HERE/ghidra_env.sh"
REPO="$(cd "$HERE/../.." && pwd)"
PROJ_DIR="${GHIDRA_PROJECTS:-$HOME/ghidra-projects}"
PROJ_NAME="${GHIDRA_PROJECT_NAME:-fe8j}"

if [ ! -f "$REPO/fireemblem8.elf" ]; then
  echo "error: $REPO/fireemblem8.elf not found — run \`make\` first." >&2
  exit 1
fi
mkdir -p "$PROJ_DIR"
echo "Building Ghidra project '$PROJ_NAME' in $PROJ_DIR (this takes a while)..."
"$GHIDRA_INSTALL_DIR/support/analyzeHeadless" "$PROJ_DIR" "$PROJ_NAME" \
  -import "$REPO/fireemblem8.elf" \
  -overwrite \
  -analysisTimeoutPerFile 3000
echo "Done -> $PROJ_DIR/$PROJ_NAME.{gpr,rep}"
echo "The MCP server 'ghidra' opens this project; (re)register with:"
echo "  claude mcp add ghidra \\"
echo "    -e JAVA_HOME=$JAVA_HOME -e GHIDRA_INSTALL_DIR=$GHIDRA_INSTALL_DIR \\"
echo "    -- $PYGHIDRA_MCP --project-path $PROJ_DIR --project-name $PROJ_NAME --wait-for-analysis"
# --wait-for-analysis makes pyghidra-mcp run an (incremental, ~no-op) analyzeAll
# over the cached project at startup so its ghidra_analysis_complete flag is set
# and decompile_function works; with the cache this adds only a few seconds.
