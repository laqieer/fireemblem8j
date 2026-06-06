#!/usr/bin/env python3
"""Backfill the FULL fireemblem8j progress timeline to the frogress API.

scripts/upload-progress.py publishes a single point (HEAD) on every push.
This replays the whole history so the FE Decomp Portal charts the entire
decompilation curve, not just the latest dot.

Method (decision D5, Copilot-reviewed):
  * Emit one entry per commit that changed the carve manifest
    (layout/carved_rom.tsv) -- those are exactly the commits where progress
    moved -- plus the first such commit (the baseline), oldest -> newest.
  * code/data bytes: EXACT, summed from that commit's own manifest, read with
    `git show <commit>:layout/...tsv` (no checkout, so the running harvester's
    working tree is never touched).
  * functions/symbols: summed from a per-object `nm` cache built ONCE from the
    current (HEAD) objects. Carves only accrete, so every historical object
    still exists at HEAD; the sole inaccuracy is an object whose byte-range was
    EXTENDED after its first carve -- those commits are detected and flagged
    (symbol counts approximate; code/data stay exact).

The measure keys match scripts/progress-template.txt / the live fe6j+fe7j
projects (code, code/total, data, data/total, banim, sound, symbols,
symbols/wip, symbols/total, functions, functions/total, functions/unmatched).
All entries POST in one request; frogress auto-creates the version + default
category on first authenticated post.

Usage:
  scripts/backfill-progress.py --dry-run                 # print, don't POST
  scripts/backfill-progress.py --build -a KEY -b URL -p fireemblem8j -v jp
"""
import argparse
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)

# Authoritative denominators from the US decomp (same as scripts/calcprogress.py).
US_TOTALS = dict(code=858300, data=13285090, symbols=41849, functions=8528)
CODE_EXTS = (".text)",)
DATA_EXTS = (".rodata)", ".data)")
MANIFEST = "layout/carved_rom.tsv"
RAM_MANIFEST = "layout/carved_ram.tsv"
NEVER = {"asm/jp_syms.o", "asm/baserom.o"}  # baseline shim + raw incbin: not decompiled


def git(*args):
    return subprocess.run(["git", *args], capture_output=True, text=True).stdout


def show(commit, path):
    """Contents of `path` at `commit`, or '' if it didn't exist there."""
    r = subprocess.run(["git", "show", f"{commit}:{path}"], capture_output=True, text=True)
    return r.stdout if r.returncode == 0 else ""


def manifest_rows(text):
    for ln in text.splitlines():
        ln = ln.rstrip("\n")
        if ln and not ln.lstrip().startswith("#"):
            yield ln.split("\t")


def objs_and_bytes(rom_text, ram_text):
    """Replicates calcprogress.py: (object set, code_bytes, data_bytes) for a
    given pair of manifest contents."""
    code_bytes = data_bytes = 0
    objs = set()
    for r in manifest_rows(rom_text):
        start, end, sec = int(r[0], 16), int(r[1], 16), r[2]
        size = end - start
        if sec.endswith(CODE_EXTS):
            code_bytes += size
        elif sec.endswith(DATA_EXTS):
            data_bytes += size
        m = re.match(r"(\S+\.o)\(", sec)
        if m and m.group(1) != "asm/baserom.o":
            objs.add(m.group(1))
    for r in manifest_rows(ram_text):
        for spec in r[2].split():
            m = re.match(r"(\S+\.o)\(", spec)
            if m:
                objs.add(m.group(1))
    objs -= NEVER
    return objs, code_bytes, data_bytes


def internal(name):
    return name.startswith((".", "$", "__")) or name == "gcc2_compiled."


def nm_stats(obj, build):
    """(functions, symbols) for one object, mirroring calcprogress.py. funcs are
    only counted for decompiled C (src/*.o text symbols)."""
    if not os.path.exists(obj) and build:
        subprocess.run(["make", obj], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    if not os.path.exists(obj):
        return None  # unbuildable (e.g. src removed at HEAD) -> caller flags it
    out = subprocess.run(["arm-none-eabi-nm", "--defined-only", obj],
                         capture_output=True, text=True).stdout.splitlines()
    funcs = 0
    names = set()
    is_src = obj.startswith("src/")
    for ln in out:
        p = ln.split()
        if len(p) != 3:
            continue
        typ, name = p[1], p[2]
        if internal(name):
            continue
        names.add(name)
        if is_src and typ in ("t", "T"):
            funcs += 1
    return funcs, len(names)


def measures(code_b, data_b, funcs, syms):
    t = US_TOTALS
    return {
        "code": code_b, "code/total": t["code"],
        "data": data_b, "data/total": t["data"],
        "banim": 0, "sound": 0,
        "symbols": syms, "symbols/wip": 0, "symbols/total": t["symbols"],
        "functions": funcs, "functions/total": t["functions"], "functions/unmatched": 0,
    }


def main():
    ap = argparse.ArgumentParser(description="Backfill the frogress progress timeline.")
    ap.add_argument("-b", "--base_url", default="https://progress.deco.mp")
    ap.add_argument("-a", "--api_key", help="frogress API key (or env PROGRESS_API_KEY)")
    ap.add_argument("-p", "--project", default="fireemblem8j")
    ap.add_argument("-v", "--version", default="jp")
    ap.add_argument("-c", "--category", default="default")
    ap.add_argument("--build", action="store_true",
                    help="build any unbuilt object before nm (needed in CI)")
    ap.add_argument("--dry-run", action="store_true", help="print entries, do not POST")
    args = ap.parse_args()

    # Commits that moved progress, oldest -> newest (includes the first one).
    commits = git("log", "--reverse", "--format=%H", "--", MANIFEST).split()
    if not commits:
        sys.exit("no commits touch " + MANIFEST)

    # Build the per-object nm cache ONCE from the current (HEAD) objects.
    head_rom = open(MANIFEST).read()
    head_ram = open(RAM_MANIFEST).read() if os.path.exists(RAM_MANIFEST) else ""
    head_objs, _, _ = objs_and_bytes(head_rom, head_ram)
    cache, unbuilt = {}, []
    for obj in sorted(head_objs):
        st = nm_stats(obj, args.build)
        if st is None:
            unbuilt.append(obj)
            cache[obj] = (0, 0)
        else:
            cache[obj] = st
    if unbuilt:
        sys.stderr.write(f"WARNING: {len(unbuilt)} object(s) not built; "
                         f"funcs/syms undercounted: {unbuilt[:8]}{'...' if len(unbuilt) > 8 else ''}\n")

    # Track per-object code-range size at HEAD to flag later range-extensions.
    head_objs_set = head_objs

    entries = []
    rows = []
    prev_code = -1
    for c in commits:
        rom_text = show(c, MANIFEST)
        ram_text = show(c, RAM_MANIFEST)
        objs, code_b, data_b = objs_and_bytes(rom_text, ram_text)

        missing = [o for o in objs if o not in head_objs_set]  # accretion-drift guard
        funcs = sum(cache.get(o, (0, 0))[0] for o in objs)
        syms = sum(cache.get(o, (0, 0))[1] for o in objs)

        ts = int(git("show", "-s", "--format=%ct", c).strip())
        entries.append({
            "timestamp": ts,
            "git_hash": c,
            "categories": {args.category: measures(code_b, data_b, funcs, syms)},
        })
        flag = "!" if missing else (" " if code_b >= prev_code else "?")  # ? = non-monotonic
        prev_code = code_b
        date = git("show", "-s", "--format=%ci", c).strip()[:10]
        rows.append((c[:8], date, code_b, data_b, funcs, syms, len(objs), flag))

    # Report.
    print(f"{len(entries)} entries  ({rows[0][1]} -> {rows[-1][1]})\n")
    print(f"{'commit':9}{'date':12}{'code':>8}{'data':>9}{'funcs':>7}{'syms':>7}{'objs':>6}  flag")
    for r in rows:
        print(f"{r[0]:9}{r[1]:12}{r[2]:>8}{r[3]:>9}{r[4]:>7}{r[5]:>7}{r[6]:>6}  {r[7]}")
    if any(r[7] == "!" for r in rows):
        print("\n! = manifest references an object absent at HEAD (accretion drift) -- inspect.")
    if any(r[7] == "?" for r in rows):
        print("\n? = code bytes decreased vs previous commit (non-monotonic) -- inspect.")

    if args.dry_run:
        print("\n--dry-run: not posting. Sample entry:")
        print(json.dumps(entries[-1], indent=2))
        return

    # Strip whitespace/newlines: a secret pasted with a trailing newline is the
    # most common cause of a spurious "Incorrect API key provided" 400.
    api_key = (args.api_key or os.environ.get("PROGRESS_API_KEY") or "").strip()
    if not api_key:
        sys.exit("API key required (-a or PROGRESS_API_KEY)")
    import requests
    base = args.base_url.rstrip("/")

    # frogress (this deployment) does NOT auto-create versions or categories, and
    # the data POST rejects entries for a missing category. Both slugs come from
    # the URL path; the body carries only {api_key, name}. Create version then
    # category, idempotently (AlreadyExists -> treat as success).
    def structure_post(url, name, what):
        r = requests.post(url, json={"api_key": api_key, "name": name})
        if r.ok:
            print(f"created {what}")
        elif "exist" in r.text.lower():
            print(f"{what} already exists")
        else:
            sys.exit(f"{what} create failed: {r.status_code} {r.reason}\nresponse body: {r.text}")

    # Best-effort cleanup of the stray 'versions' version a wrong-URL attempt may
    # have created (POST /projects/<p>/versions/ matched version_slug=versions).
    try:
        requests.delete(f"{base}/projects/{args.project}/versions/", json={"api_key": api_key})
    except Exception:
        pass

    structure_post(f"{base}/projects/{args.project}/{args.version}/",
                   args.version, f"version '{args.version}'")
    structure_post(f"{base}/projects/{args.project}/{args.version}/{args.category}/",
                   args.category, f"category '{args.category}'")

    url = f"{base}/data/{args.project}/{args.version}/"
    print(f"POSTing {len(entries)} entries to {url}")
    r = requests.post(url, json={"api_key": api_key, "entries": entries})
    if not r.ok:
        sys.exit(f"POST failed: {r.status_code} {r.reason}\nresponse body: {r.text}")
    print("Done:", r.status_code, r.text[:200])


if __name__ == "__main__":
    main()
