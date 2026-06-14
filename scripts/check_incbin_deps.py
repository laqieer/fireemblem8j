#!/usr/bin/env python3
"""Static guard for the CI-only build bug (the one that slipped through ~19 commits):
a src/data/**/*.c that INCBINs a GENERATED (gitignored) asset but whose object has
NO make-dependency on that asset -> a CLEAN parallel build (CI / fresh checkout)
compiles the .incbin before the asset exists and FAILS, while a local tree that
already has the asset passes. This checker catches it WITHOUT a full clean build.

For every INCBIN asset referenced by a src/data object: if the asset is generated
(not git-tracked) it MUST appear as a prerequisite of that object in one of the
-included make fragments (layout/data_incbin_deps.mk or graphics/**/*.mk).

Exit 0 = all generated INCBIN assets have a declared dep. Exit 1 = missing deps (CI would fail).
"""
import re, glob, os, subprocess, sys

INCBIN = re.compile(r'INCBIN_(?:U8|U16|U32)\(\s*"([^"]+)"')

# git-tracked set (committed assets need no build dep)
tracked = set(subprocess.run(['git', 'ls-files'], capture_output=True, text=True).stdout.split('\n'))

# declared deps: obj -> set(prereqs), from all -included .mk fragments
dep = {}
for mk in ['layout/data_incbin_deps.mk'] + glob.glob('graphics/**/*.mk', recursive=True):
    if not os.path.exists(mk):
        continue
    for ln in open(mk, errors='replace'):
        m = re.match(r'(\S+\.o)\s*:\s*(.*)', ln)
        if m:
            dep.setdefault(m.group(1), set()).update(m.group(2).split())

missing = []
for c in glob.glob('src/data/**/*.c', recursive=True):
    if '/map/' in c or c.count('/') < 3:
        continue
    obj = c[:-2] + '.o'
    for asset in set(INCBIN.findall(open(c, errors='replace').read())):
        if asset in tracked:
            continue                      # committed -> exists in clean checkout, no dep needed
        if asset not in dep.get(obj, ()):
            missing.append((obj, asset))

if missing:
    print(f"FAIL: {len(missing)} generated INCBIN assets with NO build dep (CLEAN build would fail):")
    for obj, a in missing[:20]:
        print(f"  {obj}  <-  {a}")
    print("Fix: python3 scripts/gen_data_incbin_deps.py")
    sys.exit(1)
print(f"OK: every generated src/data INCBIN asset has a declared build dependency.")
