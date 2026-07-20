#!/usr/bin/env python3
"""verify_compile.py — make sure every FE8J decomp.me scratch actually COMPILES.

A scratch that fails to compile on decomp.me is dead weight: the community can't
even start matching it. FE8J uses the hosted ``agbcc-fe8j`` compiler, which is
stock-compatible by default and accepts the project's per-TU ``-mjp-promote``
flag.

This tool walks every slug in ``registry.tsv``, compiles it through decomp.me's
own compile endpoint, and reports pass/fail. With ``--fix`` it repairs known
compiler/flag failures and PATCHes scratches you own (auth via ``setup_auth.sh``),
then re-verifies. In particular, an older scratch using stock ``agbcc`` with
``-mjp-promote`` is migrated to ``agbcc-fe8j`` without dropping the flag.

Usage:
  # audit only (no writes, no auth needed):
  scripts/tools/decompme/verify_compile.py

  # audit + auto-repair known compiler/flag failures on scratches you own:
  scripts/tools/decompme/verify_compile.py --fix

  # limit to specific slugs:
  scripts/tools/decompme/verify_compile.py --fix g7FXU ABitG ENay1
"""
import argparse
import json
import os
import re
import sys
import time
import urllib.error
import urllib.request

API = os.environ.get("DECOMPME_API_BASE", "https://decomp.me/api")
UA = os.environ.get(
    "DECOMPME_UA",
    "Mozilla/5.0 (X11; Linux x86_64; rv:121.0) Gecko/20100101 Firefox/121.0",
)
HERE = os.path.dirname(os.path.abspath(__file__))
REGISTRY = os.path.join(HERE, "registry.tsv")
ENV_FILE = os.environ.get("DECOMPME_ENV", os.path.expanduser("~/.config/fe8j-decomp/decompme.env"))

# agbcc reports an unknown option as e.g. `Invalid option `jp-promote'` (the
# leading -m / -f is stripped in the message).
INVALID_OPT_RE = re.compile(r"Invalid option `([^']+)'")
# agbcc + -Werror turns any warning (e.g. a builtin-conflicting strcpy decl in a
# scratch's context) into a hard compile failure decomp.me can't get past.
WERROR_RE = re.compile(r"warnings being treated as errors")
STOCK_AGBCC = "agbcc"
FE8J_AGBCC = "agbcc-fe8j"
JP_PROMOTE_FLAG = "-mjp-promote"


def repair_flags(flags, compiler_output):
    """Return (new_flags, removed_list) that make the scratch compile, or (None, []).

    Two classes of build breakage are handled by flag changes:
      1. an invalid option -> strip it;
      2. ``-Werror`` promoting a benign warning to an error -> strip ``-Werror``.
    """
    m = INVALID_OPT_RE.search(compiler_output)
    if m:
        reported = m.group(1)
        kept, removed = [], []
        for f in flags.split():
            if f in ("-m" + reported, "-f" + reported) or f.lstrip("-") == reported:
                removed.append(f)
            else:
                kept.append(f)
        if removed:
            return " ".join(kept), removed
    if WERROR_RE.search(compiler_output) and "-Werror" in flags.split():
        kept = [f for f in flags.split() if f != "-Werror"]
        return " ".join(kept), ["-Werror"]
    return None, []


def repair_settings(compiler, flags, compiler_output):
    """Return (compiler, flags, changes), or (None, None, []) when unknown."""
    invalid = INVALID_OPT_RE.search(compiler_output)
    if (
        compiler == STOCK_AGBCC
        and invalid
        and invalid.group(1) == "jp-promote"
        and JP_PROMOTE_FLAG in flags.split()
    ):
        return FE8J_AGBCC, flags, [
            "compiler %s -> %s" % (STOCK_AGBCC, FE8J_AGBCC)
        ]

    newflags, removed = repair_flags(flags, compiler_output)
    if removed:
        return compiler, newflags, ["removed %s" % flag for flag in removed]
    return None, None, []


def load_auth():
    """Return (sessionid, csrftoken) from the gitignored env file, or (None, None)."""
    sess = os.environ.get("DECOMPME_SESSION")
    csrf = os.environ.get("DECOMPME_CSRF")
    if sess:
        return sess, csrf
    if os.path.isfile(ENV_FILE):
        for line in open(ENV_FILE):
            line = line.strip()
            if line.startswith("DECOMPME_SESSION="):
                sess = line.split("=", 1)[1]
            elif line.startswith("DECOMPME_CSRF="):
                csrf = line.split("=", 1)[1]
    return sess, csrf


def _req(path, data=None, method="GET", cookie=None, csrf=None):
    headers = {"User-Agent": UA, "Referer": "https://decomp.me/", "Accept": "application/json"}
    if data is not None:
        headers["Content-Type"] = "application/json"
        data = json.dumps(data).encode()
    if cookie:
        headers["Cookie"] = cookie
    if csrf:
        headers["X-CSRFToken"] = csrf
    req = urllib.request.Request(API + path, data=data, method=method, headers=headers)
    with urllib.request.urlopen(req, timeout=90) as r:
        return json.load(r)


def get_scratch(slug):
    return _req(f"/scratch/{slug}")


def compile_scratch(slug, compiler, flags, source, context):
    body = {
        "compiler": compiler,
        "compiler_flags": flags,
        "source_code": source,
        "context": context or "",
    }
    return _req(f"/scratch/{slug}/compile", data=body, method="POST")


def read_registry():
    rows = []
    for line in open(REGISTRY):
        line = line.rstrip("\n")
        if not line or line.lstrip().startswith("#"):
            continue
        parts = line.split("\t")
        if len(parts) >= 2 and parts[1]:
            rows.append((parts[1], parts[0]))  # (slug, fn)
    return rows


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("slugs", nargs="*", help="limit to these slugs (default: all in registry.tsv)")
    ap.add_argument("--fix", action="store_true", help="PATCH known compiler/flag failures (needs auth + ownership)")
    args = ap.parse_args()

    rows = read_registry()
    if args.slugs:
        want = set(args.slugs)
        rows = [(s, fn) for s, fn in rows if s in want]

    sess, csrf = (None, None)
    whoami = None
    if args.fix:
        sess, csrf = load_auth()
        if not sess:
            print(f"error: --fix needs auth ({ENV_FILE}); run setup_auth.sh first.", file=sys.stderr)
            return 2
        cookie = f"sessionid={sess}; csrftoken={csrf or ''}"
        u = _req("/user", cookie=cookie)
        whoami = None if u.get("is_anonymous") else u.get("username")
        if not whoami:
            print("error: auth cookie is anonymous — re-run setup_auth.sh.", file=sys.stderr)
            return 2
        print(f"authenticated as {whoami}\n")

    fails, fixed, passes = [], [], 0
    for slug, fn in rows:
        try:
            d = get_scratch(slug)
        except urllib.error.HTTPError as e:
            print(f"[GET-ERR ] {slug:8} {fn:22} HTTP {e.code}")
            fails.append((slug, fn, f"GET HTTP {e.code}"))
            continue
        flags = d.get("compiler_flags", "")
        try:
            res = compile_scratch(slug, d["compiler"], flags, d["source_code"], d.get("context", ""))
        except urllib.error.HTTPError as e:
            print(f"[CMP-ERR ] {slug:8} {fn:22} HTTP {e.code}")
            fails.append((slug, fn, f"compile HTTP {e.code}"))
            continue
        out = (res.get("compiler_output") or "").strip()
        if res.get("success"):
            print(f"[OK      ] {slug:8} {fn:22} {flags}")
            passes += 1
            continue

        reason = out.splitlines()[0] if out else "(no compiler output)"
        print(f"[FAIL    ] {slug:8} {fn:22} {reason}")
        fails.append((slug, fn, reason))

        if args.fix:
            newcompiler, newflags, changes = repair_settings(d["compiler"], flags, out)
            if not changes:
                print(f"           -> no known compiler/flag repair for this error; skipping")
                continue
            owner = (d.get("owner") or {}).get("username")
            if owner != whoami:
                print(f"           -> owned by {owner!r}, not you ({whoami!r}); skipping PATCH")
                continue
            # Verify the repaired settings compile before writing.
            chk = compile_scratch(slug, newcompiler, newflags, d["source_code"], d.get("context", ""))
            if not chk.get("success"):
                print(f"           -> repair still fails: {(chk.get('compiler_output') or '')[:120]!r}")
                continue
            cookie = f"sessionid={sess}; csrftoken={csrf or ''}"
            patch = {}
            if newcompiler != d["compiler"]:
                patch["compiler"] = newcompiler
            if newflags != flags:
                patch["compiler_flags"] = newflags
            try:
                _req(f"/scratch/{slug}", data=patch, method="PATCH", cookie=cookie, csrf=csrf)
            except urllib.error.HTTPError as e:
                print(f"           -> PATCH failed HTTP {e.code}: {e.read().decode()[:160]}")
                continue
            print(
                f"           -> FIXED: {'; '.join(changes)}; "
                f"compiler={newcompiler}; flags={newflags}"
            )
            fixed.append((slug, fn))
            time.sleep(0.3)

    print(f"\nsummary: {passes} ok, {len(fails)} failed" + (f", {len(fixed)} fixed" if args.fix else ""))
    if fails and not args.fix:
        print("re-run with --fix to repair known compiler/flag failures on scratches you own.")
    # exit non-zero if anything is still broken after (optional) fixing
    still_broken = len(fails) - len(fixed)
    return 1 if still_broken > 0 else 0


if __name__ == "__main__":
    raise SystemExit(main())
