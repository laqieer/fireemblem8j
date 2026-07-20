#!/usr/bin/env python3
"""Synchronize a proven score>0 seed to its owned decomp.me registry scratch.

The exact ``src/nonmatching/<fn>.c`` is preflight-compiled, then an authenticated
PATCH is verified by response and fresh GET. Verification failure restores the
previous scratch when no concurrent change is present. Score 0 must instead use
``mark_solved.sh`` and remove the registry row.

Project includes must be wrapped in ``#ifndef FE8J_DECOMPME_CONTEXT``; this tool
flattens those trusted local headers into the remote context. It never executes
downloaded source locally. Every sync records the normalized source hash, local
score/residual/flags, and decomp.me score/compiler/flags in the scratch
description. A worse remote score is allowed because different toolchains are
not directly comparable.

Usage:
  sync_improvement.py <owned_slug> --source src/nonmatching/<fn>.c \
    --local-score <score> --local-residual <residual> --local-flags <flags> \
    --proof-result <PROVEN-BOUNDED(n)> --equiv-result <EQUIV-trials> \
    [--compiler-settings-from <fork>] [--compiler-flags <remote-flags>] --dry-run
  sync_improvement.py <owned_slug> --source src/nonmatching/<fn>.c \
    --local-score <score> --local-residual <residual> --local-flags <flags> \
    --proof-result <PROVEN-BOUNDED(n)> --equiv-result <EQUIV-trials> \
    [--compiler-settings-from <fork>] [--compiler-flags <remote-flags>] \
    --expected-score <dry-run-score>

FE8J scratches that use ``-mjp-promote`` must select the hosted
``agbcc-fe8j`` compiler so the exact local flags can be preflighted instead of
recording a toolchain mismatch.
"""

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
import time
import urllib.error

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(os.path.dirname(os.path.dirname(HERE)))
NONMATCHING_ROOT = os.path.realpath(os.path.join(ROOT, "src", "nonmatching"))
REGISTRY = os.path.join(HERE, "registry.tsv")
sys.path.insert(0, HERE)
import verify_compile as dm  # noqa: E402

FIELDS = ("compiler", "compiler_flags", "context", "diff_flags", "diff_label", "libraries")
DEFAULTS = {
    "compiler": "",
    "compiler_flags": "",
    "context": "",
    "diff_flags": [],
    "diff_label": "",
    "libraries": [],
}
MARKER = "FE8J_DECOMPME_CONTEXT"
PREAMBLE = "#define %s 1\n" % MARKER
SYNC_START = "<!-- FE8J_NONZERO_SYNC\n"
SYNC_END = "\nFE8J_NONZERO_SYNC -->"
CPPFLAGS = (
    "-I",
    "tools/agbcc/include",
    "-iquote",
    "include",
    "-iquote",
    ".",
    "-nostdinc",
    "-undef",
)


class SyncError(Exception):
    pass


def normalize_source(source):
    return re.sub(r"\r\n?", "\n", source)


def normalize_transport_text(text):
    normalized = normalize_source(text)
    if normalized.endswith("\n"):
        return normalized[:-1]
    return normalized


def source_digest(source):
    return hashlib.sha256(normalize_transport_text(source).encode()).hexdigest()


def request(path, data=None, method="GET", cookie=None, csrf=None, fresh=False):
    if fresh:
        path += ("&" if "?" in path else "?") + "verify=%d" % time.time_ns()
    try:
        return dm._req(path, data=data, method=method, cookie=cookie, csrf=csrf)
    except urllib.error.HTTPError as error:
        detail = error.read().decode("utf-8", "replace")[:300]
        raise SyncError("HTTP %s for %s: %s" % (error.code, path, detail))
    except Exception as error:
        raise SyncError("%s %s failed: %s" % (method, path, error))


def scratch_path(slug):
    return "/scratch/" + slug


def get_scratch(slug, fresh=False):
    return request(scratch_path(slug), fresh=fresh)


def registry_entries():
    entries = {}
    with open(REGISTRY, encoding="utf-8") as registry:
        for line in registry:
            fields = line.rstrip("\n").split("\t")
            if line.lstrip().startswith("#") or len(fields) < 2 or not fields[1]:
                continue
            entries[fields[1]] = fields[0]
    return entries


def read_source(path, expected_fn):
    actual = os.path.realpath(path)
    expected = os.path.realpath(os.path.join(NONMATCHING_ROOT, expected_fn + ".c"))
    if actual != expected or not actual.endswith(".c"):
        raise SyncError(
            "--source must be exact src/nonmatching/%s.c; refusing another local file"
            % expected_fn
        )
    try:
        with open(actual, "rb") as source_file:
            source = source_file.read().decode("utf-8")
    except (OSError, UnicodeDecodeError) as error:
        raise SyncError("cannot read UTF-8 source %s: %s" % (path, error))
    if not source.strip():
        raise SyncError("refusing to upload an empty source file")
    if re.search(r'^\s*#\s*include\s+"', source, re.MULTILINE) and MARKER not in source:
        raise SyncError(
            "wrap project includes in #ifndef %s / #endif before synchronization"
            % MARKER
        )
    return source


def raw_settings(scratch):
    return {field: scratch.get(field, DEFAULTS[field]) for field in FIELDS}


def project_context(source):
    # Same trusted-header/CPP pattern as Makefile and scripts/tools/m2c/gen_ctx.py.
    cpp = shutil.which("arm-none-eabi-cpp") or shutil.which("cpp")
    if not cpp:
        raise SyncError("arm-none-eabi-cpp or cpp is required")
    includes = re.findall(r'^\s*#\s*include\s+[<"][^>"]+[>"].*$', source, re.MULTILINE)
    if not includes:
        includes = ['#include "global.h"']
    env = os.environ.copy()
    env.pop("C_INCLUDE_PATH", None)
    result = subprocess.run(
        [cpp] + list(CPPFLAGS) + ["-"],
        cwd=ROOT,
        env=env,
        input="\n".join(includes) + "\n",
        capture_output=True,
        text=True,
    )
    if result.returncode:
        raise SyncError("project context generation failed: %s" % result.stderr[:300])
    return PREAMBLE + result.stdout


def candidate_settings(target, source, compiler_source=None, compiler_flags=None):
    settings = raw_settings(target)
    if compiler_source:
        for field in ("compiler", "compiler_flags", "libraries"):
            settings[field] = compiler_source.get(field, DEFAULTS[field])
    if compiler_flags is not None:
        settings["compiler_flags"] = compiler_flags
    settings["context"] = project_context(source)
    return settings


def sync_description(
    existing,
    source,
    local_score,
    local_residual,
    local_flags,
    proof_result,
    equiv_result,
    score,
    settings,
):
    local_flags_normalized = " ".join(local_flags.split())
    remote_flags_normalized = " ".join(settings["compiler_flags"].split())
    comparable = local_flags_normalized == remote_flags_normalized
    record = {
        "normalized_source_sha256": source_digest(source),
        "local_score": local_score,
        "local_residual": local_residual,
        "local_compiler_flags": local_flags_normalized,
        "proof_result": proof_result,
        "equivalence_result": equiv_result,
        "decompme_score": score,
        "decompme_compiler": settings["compiler"],
        "decompme_compiler_flags": remote_flags_normalized,
        "scores_directly_comparable": comparable,
    }
    if not comparable:
        record["toolchain_note"] = (
            "Local and decomp.me flags differ; the remote score does not measure "
            "the project-only toolchain."
        )
    block = SYNC_START + json.dumps(record, ensure_ascii=False, sort_keys=True) + SYNC_END
    pattern = re.compile(re.escape(SYNC_START) + r".*?" + re.escape(SYNC_END), re.DOTALL)
    description = pattern.sub("", existing or "").rstrip()
    return (description + "\n\n" if description else "") + block


def compile_score(slug, source, settings):
    body = {"source_code": source, "include_objects": False}
    body.update(settings)
    result = request(scratch_path(slug) + "/compile", data=body, method="POST")
    if not result.get("success"):
        output = (result.get("compiler_output") or "unknown compile/diff failure").strip()
        raise SyncError("candidate does not compile/diff: %s" % output[:300])
    diff = result.get("diff_output")
    if not isinstance(diff, dict) or not isinstance(diff.get("current_score"), int):
        raise SyncError("compile response has no numeric score")
    return diff["current_score"], diff.get("max_score")


def payload(source, settings, description, match_override=False):
    result = {
        "source_code": source,
        "description": description,
        "match_override": match_override,
    }
    result.update(settings)
    return result


def verify(scratch, source, settings, description, score):
    problems = []
    if normalize_transport_text(
        scratch.get("source_code") or ""
    ) != normalize_transport_text(source):
        problems.append(
            "normalized source hash %s != %s"
            % (source_digest(scratch.get("source_code") or ""), source_digest(source))
        )
    if scratch.get("score") != score:
        problems.append("score %r != %r" % (scratch.get("score"), score))
    if scratch.get("description") != description:
        problems.append("sync metadata description differs")
    if scratch.get("match_override"):
        problems.append("match_override became true")
    for field, expected in settings.items():
        actual = scratch.get(field, DEFAULTS[field])
        if field == "context":
            matches = normalize_transport_text(actual) == normalize_transport_text(
                expected
            )
        else:
            matches = actual == expected
        if not matches:
            problems.append("%s differs" % field)
    if problems:
        raise SyncError("; ".join(problems))


def fingerprint(scratch):
    state = {
        "source_code": scratch.get("source_code"),
        "score": scratch.get("score"),
        "match_override": scratch.get("match_override"),
        "last_updated": scratch.get("last_updated"),
        "description": scratch.get("description"),
    }
    state.update(raw_settings(scratch))
    return json.dumps(state, sort_keys=True, ensure_ascii=False)


def has_candidate_content(scratch, source, settings, description):
    settings_match = True
    for field, expected in settings.items():
        actual = scratch.get(field, DEFAULTS[field])
        if field == "context":
            if normalize_transport_text(actual) != normalize_transport_text(expected):
                settings_match = False
                break
        elif actual != expected:
            settings_match = False
            break
    return (
        normalize_transport_text(scratch.get("source_code") or "")
        == normalize_transport_text(source)
        and scratch.get("description") == description
        and not scratch.get("match_override")
        and settings_match
    )


def patch_and_verify(slug, body, source, settings, description, score, cookie, csrf):
    updated = request(scratch_path(slug), data=body, method="PATCH", cookie=cookie, csrf=csrf)
    verify(updated, source, settings, description, score)
    verify(get_scratch(slug, fresh=True), source, settings, description, score)


def auth_cookie():
    session, csrf = dm.load_auth()
    if not session or not csrf:
        raise SyncError("run scripts/tools/decompme/setup_auth.sh before a live update")
    cookie = "sessionid=%s; csrftoken=%s" % (session, csrf)
    user = request("/user", cookie=cookie, csrf=csrf, fresh=True)
    username = None if user.get("is_anonymous") else user.get("username")
    if not username:
        raise SyncError("decomp.me authentication is anonymous")
    return cookie, csrf, username


def main(argv=None):
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("slug")
    parser.add_argument("--source", required=True)
    parser.add_argument("--compiler-settings-from", metavar="SLUG")
    parser.add_argument("--compiler-flags")
    parser.add_argument("--local-score", required=True)
    parser.add_argument("--local-residual", required=True)
    parser.add_argument("--local-flags", required=True)
    parser.add_argument("--proof-result", required=True)
    parser.add_argument("--equiv-result", required=True)
    parser.add_argument("--expected-score", type=int)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args(argv)

    entries = registry_entries()
    if args.slug not in entries:
        raise SyncError("%s is not an active registry slug" % args.slug)
    source = read_source(args.source, entries[args.slug])
    target = get_scratch(args.slug)
    old_score = target.get("score")
    if not isinstance(old_score, int) or old_score <= 0:
        raise SyncError("owned score %r is not eligible; score 0 uses mark_solved.sh" % old_score)
    if target.get("match_override"):
        raise SyncError("owned scratch is already marked matched elsewhere")

    compiler_source = None
    settings_slug = args.compiler_settings_from or args.slug
    if args.compiler_settings_from:
        family = request(scratch_path(args.slug) + "/family")
        members = (
            family
            if isinstance(family, list)
            else family.get("results", family.get("family", []))
        )
        if settings_slug not in {member.get("slug") for member in members}:
            raise SyncError("%s is not in owned family %s" % (settings_slug, args.slug))
        compiler_source = get_scratch(settings_slug)
    settings = candidate_settings(target, source, compiler_source, args.compiler_flags)
    new_score, max_score = compile_score(args.slug, source, settings)
    description = sync_description(
        target.get("description"),
        source,
        args.local_score,
        args.local_residual,
        args.local_flags,
        args.proof_result,
        args.equiv_result,
        new_score,
        settings,
    )
    digest = source_digest(source)
    print(
        "preflight %s: current=%d candidate=%d max=%s "
        "normalized_source_sha256=%s settings=%s"
        % (args.slug, old_score, new_score, max_score, digest, settings_slug)
    )
    local_flags = " ".join(args.local_flags.split())
    remote_flags = " ".join(settings["compiler_flags"].split())
    print(
        "record: local_score=%s local_residual=%s proof=%s equiv=%s local_flags=%r "
        "decompme_score=%d decompme_compiler=%s decompme_flags=%r"
        % (
            args.local_score,
            args.local_residual,
            args.proof_result,
            args.equiv_result,
            local_flags,
            new_score,
            settings["compiler"],
            remote_flags,
        )
    )
    if local_flags != remote_flags:
        print("NOTE: toolchain flags differ; local and decomp.me scores are not comparable")
    if new_score >= old_score:
        print(
            "NOTE: non-improving decomp.me score is allowed; "
            "normalized source identity is the gate"
        )

    if new_score <= 0:
        raise SyncError("candidate score %d belongs to the score-0 lifecycle" % new_score)
    if args.expected_score is not None and new_score != args.expected_score:
        raise SyncError("candidate score %d != expected %d" % (new_score, args.expected_score))
    if args.dry_run:
        print("DRY-RUN: no PATCH sent; registry row remains active")
        return 0
    if args.expected_score is None:
        raise SyncError("live update requires --expected-score from the dry-run")

    cookie, csrf, username = auth_cookie()
    owner = (target.get("owner") or {}).get("username")
    if owner != username:
        raise SyncError("scratch owner %r does not match authenticated user" % owner)
    latest = get_scratch(args.slug, fresh=True)
    if fingerprint(latest) != fingerprint(target):
        raise SyncError("owned scratch changed during preflight; rerun")
    original_source = latest.get("source_code") or ""
    original_settings = raw_settings(latest)
    original_description = latest.get("description") or ""
    original = payload(
        original_source,
        original_settings,
        original_description,
        bool(latest.get("match_override")),
    )
    candidate = payload(source, settings, description)

    try:
        patch_and_verify(
            args.slug,
            candidate,
            source,
            settings,
            description,
            new_score,
            cookie,
            csrf,
        )
    except Exception as update_error:
        try:
            current = get_scratch(args.slug, fresh=True)
        except Exception as inspect_error:
            raise SyncError(
                "update failed (%s); state inspection failed (%s); no blind rollback"
                % (update_error, inspect_error)
            )
        if fingerprint(current) == fingerprint(latest):
            raise SyncError("update failed; original scratch is unchanged: %s" % update_error)
        if not has_candidate_content(current, source, settings, description):
            raise SyncError(
                "update failed with concurrent/unknown state; no rollback: %s"
                % update_error
            )
        try:
            patch_and_verify(
                args.slug,
                original,
                original_source,
                original_settings,
                original_description,
                old_score,
                cookie,
                csrf,
            )
        except Exception as rollback_error:
            raise SyncError(
                "update failed (%s); ROLLBACK FAILED (%s)" % (update_error, rollback_error)
            )
        raise SyncError("update failed and original scratch was restored: %s" % update_error)

    print(
        "SYNCED %s: score %d -> %d; normalized source identity and "
        "toolchain record verified; registry row kept; NOT marked solved"
        % (args.slug, old_score, new_score)
    )
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except SyncError as error:
        print("error: %s" % error, file=sys.stderr)
        raise SystemExit(1)
