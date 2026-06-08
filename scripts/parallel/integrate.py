#!/usr/bin/env python3
"""Serial integrator for parallel carving.

Parallel carve agents each work in their own worktree/branch, writing only their
own layout fragment (``layout/<name>.d/<task>.tsv``) plus their own ``src/`` /
``asm/`` files, then push a branch. Because those are per-task-unique and the
generated glue is no longer committed (Phase 1), the branches do not conflict.

This integrator is the single point where the whole-ROM oracle runs. It merges
each ready branch onto a local integration branch and runs ``make compare``:

* **OK**   -> keep the merge (the carve is now integrated).
* **FAIL** -> ``git reset --hard`` (roll the merge back); leave the branch for the
  agent to fix. The reject diff is saved under ``/tmp`` for triage.

The claim lifecycle is the AGENT's: an agent releases its own claim
(``claim.py release <task>``) when it finishes, and abandoned claims TTL-expire
and are reaped. The integrator works on branches, not task ids, so it does not
touch claims.

Serial is the *safety* property (only one ``make`` runs at a time, never a racing
build, never a half-merged manifest); it is cheap because ``make compare`` is
incremental (~0.3s, decision D7). It also runs a periodic ``make clean &&
make compare`` *durability* gate (Phase 4) to catch carves that pass the
incremental verify but fail a clean rebuild.

Run from the MAIN repo (it needs the gitignored toolchain + baserom). It mutates
only the CURRENT branch (make it an ``integration`` branch off main, never main
itself) and never pushes — you review and merge the result yourself.

Usage:
  integrate.py <branch> [<branch> ...]        # integrate each in turn
  integrate.py --durability-every N <branch>... # clean-rebuild gate every N accepts
  integrate.py --durability                    # just run the clean-rebuild gate
"""
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def run(cmd, check=False, capture=True):
    return subprocess.run(
        cmd, cwd=ROOT, shell=isinstance(cmd, str),
        capture_output=capture, text=True, check=check)


def git(*args):
    return run(["git", *args])


def make_compare(clean=False):
    if clean:
        run(["make", "clean"])
    r = run(["make", "compare"])
    ok = (r.returncode == 0) and ("fireemblem8.gba: OK" in (r.stdout + r.stderr))
    return ok, (r.stdout + r.stderr)


def preflight():
    head = git("symbolic-ref", "--quiet", "--short", "HEAD")
    branch = head.stdout.strip()
    if not branch:
        sys.exit("integrate: detached HEAD; check out an integration branch first")
    if branch == "main":
        sys.exit("integrate: refusing to run on main; use an integration branch off main")
    if git("status", "--porcelain").stdout.strip():
        sys.exit("integrate: working tree not clean; commit/stash first")
    return branch


def integrate_one(branch):
    """Merge origin/<branch> onto the current branch and verify. Returns a dict.
    Claim release is the agent's responsibility, not the integrator's."""
    git("fetch", "origin", branch)
    ref = "origin/" + branch
    before = git("rev-parse", "HEAD").stdout.strip()
    m = git("merge", "--no-ff", "--no-edit", ref)
    if m.returncode != 0:
        # fragment-based carves should not conflict; if they do, bail cleanly.
        git("merge", "--abort")
        return {"branch": branch, "status": "conflict", "detail": m.stdout + m.stderr}
    ok, out = make_compare()
    if ok:
        return {"branch": branch, "status": "accepted", "head": git("rev-parse", "--short", "HEAD").stdout.strip()}
    # reject: capture the diff, roll back the merge.
    diff = git("diff", before, "HEAD").stdout
    rej = "/tmp/integrate-reject-%s.diff" % branch.replace("/", "_")
    with open(rej, "w") as f:
        f.write(diff)
    git("reset", "--hard", before)
    tail = "\n".join(out.strip().splitlines()[-8:])
    return {"branch": branch, "status": "rejected", "reject_diff": rej, "detail": tail}


def main(argv):
    args = list(argv)
    dur_every = None
    if "--durability-every" in args:
        i = args.index("--durability-every")
        dur_every = int(args[i + 1])
        del args[i:i + 2]
    if "--durability" in args:
        ok, out = make_compare(clean=True)
        print(json.dumps({"durability": "OK" if ok else "FAIL"}))
        sys.exit(0 if ok else 1)

    branches = args
    if not branches:
        sys.exit(__doc__)
    preflight()
    results, accepted = [], 0
    for br in branches:
        res = integrate_one(br)
        results.append(res)
        print(json.dumps(res))
        if res["status"] == "accepted":
            accepted += 1
            if dur_every and accepted % dur_every == 0:
                ok, _ = make_compare(clean=True)
                print(json.dumps({"durability_gate_after": accepted, "result": "OK" if ok else "FAIL"}))
                if not ok:
                    sys.exit("integrate: durability gate FAILED after %d accepts" % accepted)
    n_ok = sum(r["status"] == "accepted" for r in results)
    print(json.dumps({"summary": {"accepted": n_ok, "rejected": len(results) - n_ok, "total": len(results)}}))
    sys.exit(0 if n_ok == len(results) else 2)


if __name__ == "__main__":
    main(sys.argv[1:])
