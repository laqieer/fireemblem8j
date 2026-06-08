#!/usr/bin/env python3
"""Atomic task-claim registry for parallel carving.

A claim file ``layout/claims/<task>.json`` is created with ``O_CREAT|O_EXCL``
(atomic on POSIX), so two agents can never claim the same task simultaneously.
Claims carry a TTL + heartbeat; an expired claim (the agent died mid-task) is
reclaimable, and ``reap`` clears stale ones so work is never permanently stuck.

``layout/claims/`` is gitignored local coordination state -- it is NOT committed
(it must not travel on the per-task branches), so the integrator and the agents
share it through the main working tree / a shared path, not through git.

CLI::

  claim.py claim   <task> <agent>   # exit 0 claimed, 3 already-claimed
  claim.py release <task>           # delete the claim (done/abandoned)
  claim.py beat    <task>           # refresh the TTL (call periodically)
  claim.py status  <task>           # print the claim json, exit 0/3
  claim.py list                     # list active claims
  claim.py reap   [--ttl SECONDS]   # delete expired claims, print what was reaped
"""
import json
import os
import sys
import time

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
CLAIMS_DIR = os.path.join(ROOT, "layout", "claims")
DEFAULT_TTL = 2 * 60 * 60  # 2h — generous for reasoning-heavy carves; refresh via `beat`


def _path(task):
    safe = "".join(c if (c.isalnum() or c in "-_.") else "_" for c in str(task)).strip("._")
    return os.path.join(CLAIMS_DIR, (safe or "task") + ".json")


def _load(path):
    try:
        with open(path) as f:
            return json.load(f)
    except (OSError, ValueError):
        return None


def _expired(rec, ttl):
    return rec is None or (time.time() - rec.get("beat", 0)) > ttl


def claim(task, agent, ttl=DEFAULT_TTL):
    os.makedirs(CLAIMS_DIR, exist_ok=True)
    path = _path(task)
    now = time.time()
    rec = {"task": task, "agent": agent, "pid": os.getpid(), "started": now, "beat": now}
    try:
        fd = os.open(path, os.O_CREAT | os.O_EXCL | os.O_WRONLY, 0o644)
    except FileExistsError:
        # already exists: steal it only if expired (the previous owner died).
        prev = _load(path)
        if _expired(prev, ttl):
            with open(path, "w") as f:
                json.dump(rec, f)
            return True, rec
        return False, prev
    with os.fdopen(fd, "w") as f:
        json.dump(rec, f)
    return True, rec


def release(task):
    path = _path(task)
    if os.path.exists(path):
        os.remove(path)
        return True
    return False


def beat(task):
    path = _path(task)
    rec = _load(path)
    if rec is None:
        return False
    rec["beat"] = time.time()
    with open(path, "w") as f:
        json.dump(rec, f)
    return True


def active(ttl=DEFAULT_TTL):
    out = []
    if not os.path.isdir(CLAIMS_DIR):
        return out
    for fn in sorted(os.listdir(CLAIMS_DIR)):
        if not fn.endswith(".json"):
            continue
        rec = _load(os.path.join(CLAIMS_DIR, fn))
        if rec and not _expired(rec, ttl):
            out.append(rec)
    return out


def reap(ttl=DEFAULT_TTL):
    reaped = []
    if not os.path.isdir(CLAIMS_DIR):
        return reaped
    for fn in sorted(os.listdir(CLAIMS_DIR)):
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
    elif len(a) == 3 and a[1] == "release":
        sys.exit(0 if release(a[2]) else 3)
    elif len(a) == 3 and a[1] == "beat":
        sys.exit(0 if beat(a[2]) else 3)
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
