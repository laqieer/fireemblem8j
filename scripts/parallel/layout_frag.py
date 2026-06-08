#!/usr/bin/env python3
"""Per-task layout fragments — the primitive that makes carving parallel-safe.

Instead of appending to the shared monolith manifests (layout/carved_rom.tsv,
layout/carved_ram.tsv, layout/baseline_syms.tsv), a carve task writes ONLY its
own fragment files::

    layout/carved_rom.d/<task>.tsv
    layout/carved_ram.d/<task>.tsv
    layout/baseline_syms.d/<task>.tsv

``scripts/gen_layout.py`` reads the monolith + every fragment (deduped, and the
output is order-invariant), so two tasks writing different fragments never touch
a shared file -> no merge conflict at commit time. A task also owns its
``src/<name>.c`` or ``asm/<name>.s`` (already per-task-unique). This is what lets
many carves run in parallel and be merged independently by the serial integrator.

This module is the helper carve scripts (and parallel agents) call. It can also
be run as a small CLI for manual fragment writes / removal / inspection.
"""
import os
import sys

# scripts/parallel/layout_frag.py -> repo root is three levels up.
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

MANIFESTS = ("carved_rom", "carved_ram", "baseline_syms")


def safe_task(task):
    """Filesystem-safe, collision-resistant fragment basename for a task id."""
    s = "".join(c if (c.isalnum() or c in "-_.") else "_" for c in str(task))
    return s.strip("._") or "task"


def frag_path(manifest, task):
    if manifest not in MANIFESTS:
        raise ValueError("unknown manifest: %r" % manifest)
    return os.path.join(ROOT, "layout", manifest + ".d", safe_task(task) + ".tsv")


def write(task, rows_by_manifest):
    """Write a task's rows as per-manifest fragments (overwriting that task's
    previous fragment, so re-running a carve is idempotent).

    rows_by_manifest: {manifest: [row, ...]} where each row is a full
    tab-joined manifest line (trailing newline optional). Empty/omitted
    manifests are skipped (and any stale fragment for them is removed).
    Returns the list of fragment paths written.
    """
    written = []
    for manifest in MANIFESTS:
        rows = [r.rstrip("\n") for r in rows_by_manifest.get(manifest, []) if r.strip()]
        p = frag_path(manifest, task)
        if not rows:
            if os.path.exists(p):
                os.remove(p)
            continue
        os.makedirs(os.path.dirname(p), exist_ok=True)
        # atomic write (tmp + rename) so a concurrent gen_layout never reads a
        # half-written fragment.
        tmp = p + ".tmp.%d" % os.getpid()
        with open(tmp, "w") as f:
            f.write("\n".join(rows) + "\n")
        os.replace(tmp, p)
        written.append(p)
    return written


def remove(task):
    """Delete all of a task's fragments — the atomic carve revert."""
    removed = []
    for manifest in MANIFESTS:
        p = frag_path(manifest, task)
        if os.path.exists(p):
            os.remove(p)
            removed.append(p)
    return removed


def _sources(manifest):
    base = os.path.join(ROOT, "layout", manifest)
    if os.path.exists(base + ".tsv"):
        yield base + ".tsv"
    d = base + ".d"
    if os.path.isdir(d):
        for fn in sorted(os.listdir(d)):
            if fn.endswith(".tsv"):
                yield os.path.join(d, fn)


def read_all(manifest):
    """Union of monolith + fragment data rows (deduped), mirroring
    gen_layout.read_manifest, so carve scripts that need the current carved set
    (e.g. 'which objects are already carved?') see fragments too."""
    rows, seen = [], set()
    for path in _sources(manifest):
        with open(path) as f:
            for ln in f:
                ln = ln.rstrip("\n")
                if not ln or ln.lstrip().startswith("#"):
                    continue
                if ln not in seen:
                    seen.add(ln)
                    rows.append(ln)
    return rows


def _usage():
    sys.exit(
        "usage:\n"
        "  layout_frag.py read <carved_rom|carved_ram|baseline_syms>\n"
        "  layout_frag.py remove <task>\n"
        "  layout_frag.py write <task> <manifest> <row>   # row is tab-separated\n"
    )


if __name__ == "__main__":
    if len(sys.argv) < 2:
        _usage()
    cmd = sys.argv[1]
    if cmd == "read" and len(sys.argv) == 3:
        for r in read_all(sys.argv[2]):
            print(r)
    elif cmd == "remove" and len(sys.argv) == 3:
        for p in remove(sys.argv[2]):
            print("removed", os.path.relpath(p, ROOT))
    elif cmd == "write" and len(sys.argv) == 5:
        for p in write(sys.argv[2], {sys.argv[3]: [sys.argv[4]]}):
            print("wrote", os.path.relpath(p, ROOT))
    else:
        _usage()
