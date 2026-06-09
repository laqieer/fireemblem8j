#!/usr/bin/env bash
# Route the shared Agency MCP config to the right per-client Ghidra project.
#
# Agency uses Copilot's MCP config when it launches Claude Code, so a literal
# `--project-name fe8j-cp` there would make Claude hold Copilot's isolated copy.
# Keep Copilot on fe8j-cp, but rewrite the project to fe8j when the parent
# client is Claude.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "$HERE/ghidra_env.sh"

detect_client_project() {
    local pid
    local ppid
    local comm
    local args

    pid="$PPID"
    while [ -n "$pid" ] && [ "$pid" -gt 1 ]; do
        comm="$(ps -p "$pid" -o comm= 2>/dev/null | tr -d ' ' || true)"
        case "$comm" in
        copilot) echo fe8j-cp; return ;;
        claude) echo fe8j; return ;;
        esac

        args="$(ps -p "$pid" -o args= 2>/dev/null || true)"
        case "$args" in
        copilot | copilot\ * | */.copilot-cli/* | */copilot\ *) echo fe8j-cp; return ;;
        claude | claude\ * | */.claude-cli/* | */claude\ *) echo fe8j; return ;;
        esac

        ppid="$(ps -p "$pid" -o ppid= 2>/dev/null | tr -d ' ' || true)"
        [ "$ppid" != "$pid" ] || break
        pid="$ppid"
    done

    echo "${GHIDRA_MCP_DEFAULT_PROJECT:-fe8j-cp}"
}

project="${GHIDRA_MCP_PROJECT:-$(detect_client_project)}"
args=()
saw_project_name=0

while [ "$#" -gt 0 ]; do
    case "$1" in
    --project-name)
        args+=("$1" "$project")
        saw_project_name=1
        shift 2
        ;;
    --project-name=*)
        args+=("--project-name=$project")
        saw_project_name=1
        shift
        ;;
    *)
        args+=("$1")
        shift
        ;;
    esac
done

if [ "$saw_project_name" -eq 0 ]; then
    args+=("--project-name" "$project")
fi

exec "$PYGHIDRA_MCP" "${args[@]}"
