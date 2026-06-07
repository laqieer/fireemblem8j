#!/usr/bin/env bash
# Shared environment for the IDA Pro / idalib reverse-engineering tooling.
# Source this (`. scripts/ida/idalib_env.sh`) before running the build script
# or the MCP server by hand.
#
# The pieces (all installed locally, outside the repo):
#   - IDA Pro 9.3 Linux:  $IDA_DIR              (native AArch32/AArch64 + HEXARM)
#   - idalib venv:        $IDA_VENV             (python with idapro + ida-pro-mcp)
#   - headless MCP:       $IDA_VENV/bin/idalib-mcp
# See docs/reverse-engineering.md for how this was set up.

export IDA_DIR="${IDA_DIR:-/home/laqieer/ida-pro-9.3}"
export IDA_VENV="${IDA_VENV:-/home/laqieer/ida-mcp-venv}"
export IDA_PY="$IDA_VENV/bin/python"
export IDALIB_MCP="$IDA_VENV/bin/idalib-mcp"

# idalib finds the install via ~/.idapro/ida-config.json; IDADIR is a belt-and-
# braces fallback.
export IDADIR="$IDA_DIR"
