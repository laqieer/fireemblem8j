#!/usr/bin/env python3
"""verify_compile.py — make sure every FE8J decomp.me scratch actually COMPILES.

A scratch that fails to compile on decomp.me is dead weight: the community can't
even start matching it. FE8J uses the hosted ``agbcc-fe8j`` compiler, which is
stock-compatible by default and accepts the project's per-TU ``-mjp-promote``
flag.

This tool walks every slug in ``registry.tsv``, enforces any checked-in compiler
profile, compiles it through decomp.me's own compile endpoint, and reports
pass/fail. With ``--fix`` it repairs known compiler/flag failures and PATCHes
scratches you own (auth via ``setup_auth.sh``), then verifies the persisted
settings with a fresh GET and recompilation. In particular, an older scratch
using stock ``agbcc`` is migrated to ``agbcc-fe8j`` without dropping the
``-mjp-promote`` profile.

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
JP_PROMOTE_PROFILE = "jp-promote"


def repair_flags(flags, compiler_output):
    """Return (new_flags, removed_list) that make the scratch compile, or (None, []).

    Two classes of build breakage are handled by flag changes:
      1. an invalid option -> strip it;
      2. ``-Werror`` promoting a benign warning to an error -> strip ``-Werror``.
    """
    m = INVALID_OPT_RE.search(compiler_output)
    if m:
        reported = m.group(1)
        if reported == "jp-promote" and JP_PROMOTE_FLAG in flags.split():
            return None, []
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
        invalid
        and invalid.group(1) == "jp-promote"
        and JP_PROMOTE_FLAG in flags.split()
    ):
        if compiler == STOCK_AGBCC:
            return FE8J_AGBCC, flags, [
                "compiler %s -> %s" % (STOCK_AGBCC, FE8J_AGBCC)
            ]
        return None, None, []

    newflags, removed = repair_flags(flags, compiler_output)
    if removed:
        return compiler, newflags, ["removed %s" % flag for flag in removed]
    return None, None, []


def required_profile_settings(profile, compiler, flags):
    """Return required (compiler, flags, changes), or no changes."""
    if not profile:
        return None, None, []
    if profile != JP_PROMOTE_PROFILE:
        raise ValueError("unknown decomp.me compiler profile: %s" % profile)

    changes = []
    newcompiler = compiler
    newflags = flags.split()
    if compiler != FE8J_AGBCC:
        newcompiler = FE8J_AGBCC
        changes.append("compiler %s -> %s" % (compiler, FE8J_AGBCC))
    if JP_PROMOTE_FLAG not in newflags:
        newflags.append(JP_PROMOTE_FLAG)
        changes.append("added %s" % JP_PROMOTE_FLAG)
    if not changes:
        return None, None, []
    return newcompiler, " ".join(newflags), changes


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


def get_scratch(slug, fresh=False):
    path = f"/scratch/{slug}"
    if fresh:
        path += f"?verify={time.time_ns()}"
    return _req(path)


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
            profile = parts[3] if len(parts) >= 4 else ""
            rows.append((parts[1], parts[0], profile))  # (slug, fn, profile)
    return rows


def apply_repair(
    slug,
    scratch,
    newcompiler,
    newflags,
    changes,
    cookie,
    csrf,
    whoami,
):
    owner = (scratch.get("owner") or {}).get("username")
    if owner != whoami:
        print(f"           -> owned by {owner!r}, not you ({whoami!r}); skipping PATCH")
        return False

    source = scratch["source_code"]
    context = scratch.get("context", "")
    chk = compile_scratch(slug, newcompiler, newflags, source, context)
    if not chk.get("success"):
        print(f"           -> repair still fails: {(chk.get('compiler_output') or '')[:120]!r}")
        return False

    patch = {}
    if newcompiler != scratch["compiler"]:
        patch["compiler"] = newcompiler
    if newflags != scratch.get("compiler_flags", ""):
        patch["compiler_flags"] = newflags
    try:
        _req(f"/scratch/{slug}", data=patch, method="PATCH", cookie=cookie, csrf=csrf)
        stored = get_scratch(slug, fresh=True)
    except urllib.error.HTTPError as e:
        print(f"           -> PATCH/GET failed HTTP {e.code}: {e.read().decode()[:160]}")
        return False

    stored_flags = " ".join((stored.get("compiler_flags") or "").split())
    expected_flags = " ".join(newflags.split())
    if (
        stored.get("compiler") != newcompiler
        or stored_flags != expected_flags
        or stored.get("source_code") != source
    ):
        print("           -> persisted compiler/flags/source differ after PATCH")
        return False

    persisted = compile_scratch(
        slug,
        stored["compiler"],
        stored["compiler_flags"],
        stored["source_code"],
        stored.get("context", ""),
    )
    if not persisted.get("success"):
        print(
            "           -> persisted settings fail recompilation: "
            f"{(persisted.get('compiler_output') or '')[:120]!r}"
        )
        return False

    print(
        f"           -> FIXED: {'; '.join(changes)}; "
        f"compiler={newcompiler}; flags={newflags}"
    )
    time.sleep(0.3)
    return True


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("slugs", nargs="*", help="limit to these slugs (default: all in registry.tsv)")
    ap.add_argument("--fix", action="store_true", help="PATCH known compiler/flag failures (needs auth + ownership)")
    args = ap.parse_args()

    rows = read_registry()
    if args.slugs:
        want = set(args.slugs)
        rows = [(s, fn, profile) for s, fn, profile in rows if s in want]

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
    cookie = f"sessionid={sess}; csrftoken={csrf or ''}" if args.fix else None
    for slug, fn, profile in rows:
        try:
            d = get_scratch(slug)
        except urllib.error.HTTPError as e:
            print(f"[GET-ERR ] {slug:8} {fn:22} HTTP {e.code}")
            fails.append((slug, fn, f"GET HTTP {e.code}"))
            continue
        flags = d.get("compiler_flags", "")
        try:
            newcompiler, newflags, changes = required_profile_settings(
                profile, d["compiler"], flags
            )
        except ValueError as e:
            print(f"[PROFILE ] {slug:8} {fn:22} {e}")
            fails.append((slug, fn, str(e)))
            continue
        if changes:
            reason = "; ".join(changes)
            print(f"[MIGRATE ] {slug:8} {fn:22} {reason}")
            fails.append((slug, fn, reason))
            if args.fix and apply_repair(
                slug,
                d,
                newcompiler,
                newflags,
                changes,
                cookie,
                csrf,
                whoami,
            ):
                fixed.append((slug, fn))
            continue

        try:
            res = compile_scratch(
                slug,
                d["compiler"],
                flags,
                d["source_code"],
                d.get("context", ""),
            )
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
                print("           -> no known compiler/flag repair for this error; skipping")
                continue
            if apply_repair(
                slug,
                d,
                newcompiler,
                newflags,
                changes,
                cookie,
                csrf,
                whoami,
            ):
                fixed.append((slug, fn))

    print(f"\nsummary: {passes} ok, {len(fails)} failed" + (f", {len(fixed)} fixed" if args.fix else ""))
    if fails and not args.fix:
        print("re-run with --fix to repair known compiler/flag failures on scratches you own.")
    # exit non-zero if anything is still broken after (optional) fixing
    still_broken = len(fails) - len(fixed)
    return 1 if still_broken > 0 else 0


if __name__ == "__main__":
    raise SystemExit(main())
