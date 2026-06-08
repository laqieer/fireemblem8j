#!/usr/bin/env python3
"""Atomic task-claim registry for parallel carving.

Every registry mutation (claim/beat/release/reap) runs under an exclusive
``fcntl.flock`` (see ``_locked``), so two agents can never claim the same task
simultaneously and no operation can race another. Claims carry a TTL + heartbeat;
an expired claim (the agent died mid-task) is reclaimable, and ``reap`` clears
stale ones so work is never permanently stuck.

``layout/claims/`` is gitignored local coordination state -- it is NOT committed
(it must not travel on the per-task branches), so the integrator and the agents
share it through the main working tree / a shared path, not through git.

CLI::

  claim.py claim   <task> <agent>   # exit 0 claimed, 3 already-claimed
  claim.py release <task> <agent>   # delete your claim (only if you own it)
  claim.py beat    <task> <agent>   # refresh the TTL (only if you own it)
  claim.py status  <task>           # print the claim json, exit 0/3
  claim.py list                     # list active claims
  claim.py reap   [--ttl SECONDS]   # delete expired claims, print what was reaped
"""
import contextlib
import fcntl
import hashlib
import json
import os
import sys
import time

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
CLAIMS_DIR = os.path.join(ROOT, "layout", "claims")
DEFAULT_TTL = 2 * 60 * 60  # 2h — generous for reasoning-heavy carves; refresh via `beat`


def _path(task):
    # A short stable hash of the ORIGINAL id makes the basename collision-free:
    # distinct ids ("a/b", "a_b", ".a_b.") get distinct files even though their
    # sanitized prefix is identical, so independent tasks never overwrite claims.
    safe = "".join(c if (c.isalnum() or c in "-_.") else "_" for c in str(task)).strip("._")
    h = hashlib.sha1(str(task).encode("utf-8")).hexdigest()[:8]
    return os.path.join(CLAIMS_DIR, (safe or "task") + "-" + h + ".json")


def _load(path):
    try:
        with open(path) as f:
            return json.load(f)
    except (OSError, ValueError):
        return None


def _expired(rec, ttl):
    return rec is None or (time.time() - rec.get("beat", 0)) > ttl


@contextlib.contextmanager
def _locked():
    """Hold an exclusive flock on the registry lock for the whole critical
    section. EVERY claim-file mutation (claim/beat/release/reap) takes this lock,
    so they are fully serialized -- e.g. reap() can never delete a claim that
    claim() created concurrently, and beat/release never race a steal."""
    os.makedirs(CLAIMS_DIR, exist_ok=True)
    lf = open(os.path.join(CLAIMS_DIR, ".lock"), "w")
    try:
        fcntl.flock(lf, fcntl.LOCK_EX)
        yield
    finally:
        lf.close()  # closing the fd releases the flock


def _write(path, rec):
    tmp = path + ".tmp.%d" % os.getpid()
    with open(tmp, "w") as f:
        json.dump(rec, f)
    os.replace(tmp, path)


def claim(task, agent, ttl=DEFAULT_TTL):
    """Claim a task. Succeeds unless a non-expired claim already exists. An
    expired claim (the previous owner died) is stolen atomically under the lock,
    so two claimants can never both 'steal' the same stale record."""
    path = _path(task)
    with _locked():
        prev = _load(path)
        if prev is not None and not _expired(prev, ttl):
            return False, prev
        now = time.time()
        rec = {"task": task, "agent": agent, "pid": os.getpid(), "started": now, "beat": now}
        _write(path, rec)
        return True, rec


def release(task, agent):
    """Release a claim -- only if `agent` is the current owner, so a stale agent
    whose task was stolen cannot delete the new owner's claim."""
    path = _path(task)
    with _locked():
        rec = _load(path)
        if rec is None or rec.get("agent") != agent:
            return False
        os.remove(path)
        return True


def beat(task, agent, ttl=DEFAULT_TTL):
    """Refresh the TTL -- only if `agent` still owns the (non-expired) claim, so a
    stale agent cannot resurrect a task another agent has taken over."""
    path = _path(task)
    with _locked():
        rec = _load(path)
        if rec is None or rec.get("agent") != agent or _expired(rec, ttl):
            return False
        rec["beat"] = time.time()
        _write(path, rec)
        return True


def active(ttl=DEFAULT_TTL):
    with _locked():
        out = []
        for fn in sorted(os.listdir(CLAIMS_DIR)) if os.path.isdir(CLAIMS_DIR) else []:
            if not fn.endswith(".json"):
                continue
            rec = _load(os.path.join(CLAIMS_DIR, fn))
            if rec and not _expired(rec, ttl):
                out.append(rec)
        return out


def reap(ttl=DEFAULT_TTL):
    with _locked():
        reaped = []
        for fn in sorted(os.listdir(CLAIMS_DIR)) if os.path.isdir(CLAIMS_DIR) else []:
            if not fn.endswith(".json"):
                continue
            p = os.path.join(CLAIMS_DIR, fn)
            if _expired(_load(p), ttl):
                os.remove(p)
                reaped.append(fn[:-5])
        return reaped


def _arg_ttl():
    if "--ttl" in sys.argv:
        return int(sys.argv[sys.argv.index("--ttl") + 1])
    return DEFAULT_TTL


if __name__ == "__main__":
    a = sys.argv
    if len(a) >= 4 and a[1] == "claim":
        ok, rec = claim(a[2], a[3], _arg_ttl())
        print(("CLAIMED " if ok else "BUSY ") + json.dumps(rec))
        sys.exit(0 if ok else 3)
    elif len(a) >= 4 and a[1] == "release":
        sys.exit(0 if release(a[2], a[3]) else 3)
    elif len(a) >= 4 and a[1] == "beat":
        sys.exit(0 if beat(a[2], a[3], _arg_ttl()) else 3)
    elif len(a) == 3 and a[1] == "status":
        rec = _load(_path(a[2]))
        print(json.dumps(rec) if rec else "(unclaimed)")
        sys.exit(0 if rec and not _expired(rec, _arg_ttl()) else 3)
    elif len(a) >= 2 and a[1] == "list":
        for rec in active(_arg_ttl()):
            print(json.dumps(rec))
    elif len(a) >= 2 and a[1] == "reap":
        for t in reap(_arg_ttl()):
            print("reaped", t)
    else:
        sys.exit(__doc__)
