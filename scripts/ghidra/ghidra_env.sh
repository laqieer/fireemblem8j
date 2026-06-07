#!/usr/bin/env bash
# Shared environment for the Ghidra reverse-engineering tooling (the open-source
# second decompiler that cross-checks IDA's Hex-Rays — see docs/reverse-engineering.md).
# Source this before running the build script or the MCP server by hand.
#
#   - JDK 21 (Temurin):   $JAVA_HOME
#   - Ghidra 12.x:        $GHIDRA_INSTALL_DIR
#   - pyghidra venv:      $GHIDRA_VENV  (has pyghidra + pyghidra-mcp)
#   - headless MCP:       $GHIDRA_VENV/bin/pyghidra-mcp

export JAVA_HOME="${JAVA_HOME:-$HOME/ghidra-tools/jdk-21.0.11+10}"
export GHIDRA_INSTALL_DIR="${GHIDRA_INSTALL_DIR:-$HOME/ghidra-tools/ghidra_12.1.2_PUBLIC}"
export GHIDRA_VENV="${GHIDRA_VENV:-$HOME/ghidra-mcp-venv}"
export PATH="$JAVA_HOME/bin:$PATH"
export GHIDRA_PY="$GHIDRA_VENV/bin/python"
export PYGHIDRA_MCP="$GHIDRA_VENV/bin/pyghidra-mcp"
