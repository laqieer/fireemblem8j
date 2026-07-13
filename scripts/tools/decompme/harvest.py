#!/usr/bin/env python3
"""Harvest decomp.me matches for the FE8J still-asm frontier.

Step 1 of the decomp-harvest skill: poll every posted still-asm function's
decomp.me scratch *family* and classify what (if anything) is actionable.

Classifications (per still-asm function that has a registry scratch):
  * MATCHED           -- some family member scored 0  -> INTEGRATE to main
                         (byte-exact, into `make compare`). Prefer a community
                         fork's slug if it is the score-0 one.
  * IMPROVED          -- the best fork scores strictly LOWER than our base
                         scratch (but > 0) -> candidate to ADOPT as the updated
                         `src/nonmatching/<fn>.c` *iff* it is proven-equivalent
                         (run scripts/prove_nonmatching.py / differential_test.py
                         before adopting; decomp.me score alone is not proof),
                         then sync the exact adopted file back to the owned base
                         with sync_improvement.py, record both toolchains'
                         score/flags, and keep its registry row. A different or
                         worse remote score does not disprove source identity.
  * NONE              -- no member beats our base; keep grinding / permute.
  * STALE             -- function is no longer still-asm (already carved) but a
                         scratch is still open -> MARK-SOLVED on decomp.me so
                         community effort is not wasted.

"still-asm" is decided authoritatively by the presence of
`src/nonmatching/<fn>.c` (the oracle build's byte source is still `asm/`), NOT by
any cached classification.

Usage:
  scripts/tools/decompme/harvest.py                 # report all
  scripts/tools/decompme/harvest.py --json          # machine-readable
  scripts/tools/decompme/harvest.py --actionable    # only MATCHED/IMPROVED/STALE
  scripts/tools/decompme/harvest.py --pull <slug> [--out DIR]   # fetch one scratch

Network: decomp.me is behind Cloudflare; requests need a browser User-Agent AND
`Referer: https://decomp.me/` (plain curl/urllib without them gets HTTP 403).
"""
import argparse
import json
import os
import sys
import urllib.request

REPO = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..", ".."))
REGISTRY = os.path.join(os.path.dirname(__file__), "registry.tsv")
API = os.environ.get("DECOMPME_API_BASE", "https://decomp.me/api")
UA = os.environ.get(
    "DECOMPME_UA",
    "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) "
    "Chrome/120.0 Safari/537.36",
)


def api_get(path):
    req = urllib.request.Request(
        API + path,
        headers={"User-Agent": UA, "Referer": "https://decomp.me/",
                 "Accept": "application/json"},
    )
    with urllib.request.urlopen(req, timeout=25) as r:
        return json.load(r)


def load_registry():
    rows = []
    with open(REGISTRY) as f:
        for ln in f:
            ln = ln.rstrip("\n")
            if not ln or ln.startswith("#"):
                continue
            parts = ln.split("\t")
            if len(parts) >= 2:
                rows.append((parts[0], parts[1], parts[2] if len(parts) > 2 else parts[0]))
    return rows


def is_still_asm(fn):
    return os.path.exists(os.path.join(REPO, "src", "nonmatching", f"{fn}.c"))


def family_members(slug):
    fam = api_get(f"/scratch/{slug}/family")
    if isinstance(fam, list):
        return fam
    return fam.get("results", fam.get("family", []))


def owner_of(m):
    o = m.get("owner") or {}
    return o.get("username") or o.get("name") or "anon"


def classify(fn, slug):
    """Return dict: {fn, slug, status, base_score, best, matched_slug, detail}."""
    try:
        members = family_members(slug)
    except Exception as e:  # network-tolerant
        return {"fn": fn, "slug": slug, "status": "ERROR", "detail": str(e)}
    base = next((m.get("score") for m in members if m.get("slug") == slug), None)
    scored = [(m.get("slug"), m.get("score"), owner_of(m)) for m in members
              if isinstance(m.get("score"), int)]
    still = is_still_asm(fn)

    matched = [(s, sc, who) for s, sc, who in scored if sc == 0]
    if not still:
        # already carved; any open scratch is stale
        st = "STALE" if scored else "STALE"
        return {"fn": fn, "slug": slug, "status": "STALE", "base_score": base,
                "best": min((sc for _, sc, _ in scored), default=None),
                "detail": "carved already; mark scratch solved on decomp.me"}
    if matched:
        # prefer a community fork (owner != base owner) if any; else self
        pick = matched[0]
        return {"fn": fn, "slug": slug, "status": "MATCHED", "base_score": base,
                "best": 0, "matched_slug": pick[0], "matched_by": pick[2],
                "detail": f"score-0 at {pick[0]} ({pick[2]}) -> INTEGRATE to main"}
    best = min(scored, key=lambda t: t[1]) if scored else None
    if best and base is not None and best[1] < base:
        return {"fn": fn, "slug": slug, "status": "IMPROVED", "base_score": base,
                "best": best[1], "matched_slug": best[0], "matched_by": best[2],
                "detail": f"fork {best[0]} ({best[2]}) score {best[1]} < base {base}"
                          f" -> ADOPT+SYNC exact source if proof/EQUIV pass"
                          f" (remote score may differ)"}
    return {"fn": fn, "slug": slug, "status": "NONE", "base_score": base,
            "best": best[1] if best else None,
            "detail": "no member beats base; permute/apply-lever"}


def pull(slug, out):
    d = api_get(f"/scratch/{slug}")
    os.makedirs(out, exist_ok=True)
    open(os.path.join(out, "source.c"), "w").write(d.get("source_code", ""))
    open(os.path.join(out, "context.h"), "w").write(d.get("context", ""))
    meta = {"name": d.get("name"), "score": d.get("score"),
            "compiler": d.get("compiler"), "flags": d.get("compiler_flags")}
    open(os.path.join(out, "meta.json"), "w").write(json.dumps(meta, indent=2))
    print(f"pulled {slug} -> {out}  (score={d.get('score')})")
    print(f"  name : {d.get('name')}")
    print(f"  flags: {d.get('compiler_flags')}")
    if d.get("score") != 0:
        print("  NOTE: score != 0 -- this is NOT a byte match; adopt as nonmatching "
              "only after prove_nonmatching/differential_test.")
    return meta


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--actionable", action="store_true")
    ap.add_argument("--pull", metavar="SLUG")
    ap.add_argument("--out", default=None)
    args = ap.parse_args()

    if args.pull:
        pull(args.pull, args.out or f"/tmp/decompme_{args.pull}")
        return

    results = [classify(fn, slug) for fn, slug, _ in load_registry()]
    order = {"MATCHED": 0, "IMPROVED": 1, "STALE": 2, "NONE": 3, "ERROR": 4}
    results.sort(key=lambda r: (order.get(r["status"], 9), r.get("best") or 1 << 30))

    if args.json:
        print(json.dumps(results, indent=2))
        return

    def show(r):
        return not args.actionable or r["status"] in ("MATCHED", "IMPROVED", "STALE")

    counts = {}
    for r in results:
        counts[r["status"]] = counts.get(r["status"], 0) + 1
        if show(r):
            mark = {"MATCHED": "*** ", "IMPROVED": " +  ", "STALE": " ~  "}.get(
                r["status"], "    ")
            print(f"{mark}{r['fn']:<14} {r['status']:<9} base={r.get('base_score')} "
                  f"best={r.get('best')}  {r.get('detail','')}")

    print("\n-- summary --")
    for k in ("MATCHED", "IMPROVED", "STALE", "NONE", "ERROR"):
        if counts.get(k):
            print(f"  {k:<9} {counts[k]}")
    if counts.get("MATCHED"):
        print("\n  ACTIONABLE: integrate the MATCHED score-0 fork(s) into main "
              "(playbook §7), then learn+cookbook, then APPLY the lever to same-"
              "pattern NONE functions, then mark the scratch solved on decomp.me.")
    elif counts.get("IMPROVED"):
        print("\n  ACTIONABLE: review IMPROVED fork(s); prove-equivalent -> adopt as "
              "src/nonmatching/<fn>.c, sync the exact file to the owned base with "
              "sync_improvement.py, record local+remote score/toolchain data, and "
              "keep the registry row active.")
    else:
        print("\n  No free harvest. Next: apply learned levers to same-pattern "
              "still-asm functions (real make-compare attempts), or permute.")


if __name__ == "__main__":
    main()
