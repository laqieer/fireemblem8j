#!/usr/bin/env python3
"""Reject tracked regular files whose on-disk size is zero."""

import os
import stat
import subprocess
import sys


ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def main():
    result = subprocess.run(
        ["git", "-C", ROOT, "ls-files", "-z"],
        check=True,
        stdout=subprocess.PIPE,
    )
    empty = []

    for raw_path in result.stdout.split(b"\0"):
        if not raw_path:
            continue

        relative = os.fsdecode(raw_path)
        path = os.path.join(ROOT, relative)

        try:
            file_stat = os.stat(path, follow_symlinks=False)
        except FileNotFoundError:
            continue

        if stat.S_ISREG(file_stat.st_mode) and file_stat.st_size == 0:
            empty.append(relative)

    if empty:
        print("ERROR: tracked zero-byte files:")
        for path in empty:
            print("  " + path)
        return 1

    print("OK: no tracked zero-byte files.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
