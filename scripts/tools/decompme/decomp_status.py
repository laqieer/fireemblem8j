#!/usr/bin/env python3
"""decomp_status.py - the complete decomp.me decompilation decision tree for FE8J.

For each still-asm function, decide the next action by checking decomp.me FIRST
(so we never re-derive a function the community already matched). Policy (D292):

    posted?  -- registry.tsv maps fn -> scratch slug
    |- YES, our scratch score==0 ........... INTEGRATE      (pull source from <slug>, carve)
    |- YES, a FORK in the family score==0 .. INTEGRATE_FORK (pull source from <fork>, carve)
    |- YES, unmatched anywhere ............. DECOMP_THEN_UPDATE
    |                                          (reconstruct/permute; if we MATCH -> carve +
    |                                           fork-with-solution to mark the scratch solved;
    |                                           anonymous scratches can't be PATCHed, so we fork)
    |- NO (never posted) ................... DECOMP_THEN_POST
                                               (reconstruct; if MATCH -> carve, do NOT post;
                                                else -> post a new scratch with the nearest C)

Usage:
    decomp_status.py            # all still-asm functions
    decomp_status.py <fn>...    # specific functions
    decomp_status.py --json     # machine-readable

Reads the still-asm set from layout/carved_rom.d/gbadisasm_*.tsv (asm/ objects).
Queries https://decomp.me/api with browser headers (Cloudflare). Network-tolerant:
on API failure for a posted fn, reports POSTED_UNKNOWN (treat as unmatched, retry later).
"""
import glob
import json
import os
import re
import subprocess
import sys
import urllib.request

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
REGISTRY = os.path.join(ROOT, "scripts", "tools", "decompme", "registry.tsv")
API = os.environ.get("DECOMPME_API_BASE", "https://decomp.me/api")
UA = "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120 Safari/537.36"


def load_registry():
    reg = {}
    if os.path.exists(REGISTRY):
        for ln in open(REGISTRY):
            ln = ln.strip()
            if not ln or ln.startswith("#"):
                continue
            p = ln.split("\t")
            if len(p) >= 2:
                reg[p[0]] = {"slug": p[1], "name": p[2] if len(p) > 2 else p[0]}
    return reg


def still_asm_set():
    fns = set()
    for f in glob.glob(os.path.join(ROOT, "layout", "carved_rom.d", "gbadisasm_*.tsv")):
        for ln in open(f):
            cols = ln.split("\t")
            if len(cols) >= 4 and cols[2].startswith("asm/"):
                # col 4 is "<fnname> <free-text description>" -> take the first token
                fns.add(cols[3].strip().split()[0])
    return {f for f in fns if not re.match(r"^_[0-9A-Fa-f]{4,}$", f)}


def api_get(path):
    req = urllib.request.Request(API + path, headers={"User-Agent": UA, "Referer": "https://decomp.me/"})
    with urllib.request.urlopen(req, timeout=25) as r:
        return json.load(r)


def scratch_status(slug):
    """Return (our_score, [(fork_slug, fork_score)...]) or None on error."""
    try:
        fam = api_get("/scratch/%s/family" % slug)
        members = fam if isinstance(fam, list) else fam.get("results", fam.get("family", []))
        ours = next((m.get("score") for m in members if m.get("slug") == slug), None)
        forks = [(m.get("slug"), m.get("score")) for m in members if m.get("slug") != slug]
        return ours, forks
    except Exception as e:
        return ("ERR", str(e))


def decide(fn, reg):
    entry = reg.get(fn)
    if not entry:
        return {"fn": fn, "state": "NOT_POSTED", "action": "DECOMP_THEN_POST",
                "detail": "never posted -> reconstruct; if MATCH carve (no post), else post nearest C"}
    slug = entry["slug"]
    st = scratch_status(slug)
    if st and st[0] == "ERR":
        return {"fn": fn, "slug": slug, "state": "POSTED_UNKNOWN", "action": "RETRY",
                "detail": "API error (%s); treat as unmatched, retry next poll" % st[1][:60]}
    ours, forks = st
    if ours == 0:
        return {"fn": fn, "slug": slug, "state": "POSTED_MATCHED", "action": "INTEGRATE",
                "detail": "our scratch %s is MATCHED (score 0) -> pull source_code, carve, make compare" % slug}
    matched_fork = next((s for s, sc in forks if sc == 0), None)
    if matched_fork:
        return {"fn": fn, "slug": slug, "state": "POSTED_FORK_MATCHED", "action": "INTEGRATE_FORK",
                "detail": "community fork %s is MATCHED -> pull its source_code, carve, make compare" % matched_fork}
    best = min([sc for sc in [ours] + [s for _, s in forks] if isinstance(sc, int)], default=None)
    return {"fn": fn, "slug": slug, "state": "POSTED_UNMATCHED", "action": "DECOMP_THEN_UPDATE",
            "detail": "posted (best score %s), no match -> reconstruct/permute; if we MATCH, carve + fork-with-solution to mark %s solved" % (best, slug)}


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    as_json = "--json" in sys.argv
    reg = load_registry()
    fns = args if args else sorted(still_asm_set())
    results = [decide(fn, reg) for fn in fns]
    if as_json:
        print(json.dumps(results, indent=2))
        return 0
    print("== decomp.me decompilation status (D292 decision tree) ==")
    by_action = {}
    for r in results:
        by_action.setdefault(r["action"], []).append(r)
        flag = "  <<<" if r["action"] in ("INTEGRATE", "INTEGRATE_FORK") else ""
        print("  %-14s %-12s %s%s" % (r["fn"], r["state"], r["action"], flag))
    print("\n-- summary --")
    for act in ("INTEGRATE", "INTEGRATE_FORK", "DECOMP_THEN_UPDATE", "DECOMP_THEN_POST", "POSTED_UNKNOWN", "RETRY"):
        n = len(by_action.get(act, []))
        if n:
            print("  %-18s %d" % (act, n))
    if by_action.get("INTEGRATE") or by_action.get("INTEGRATE_FORK"):
        print("\n  *** ACTIONABLE: a matched scratch/fork exists -> integrate it (free win, no re-derive).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
