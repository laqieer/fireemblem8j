#!/usr/bin/env python3
"""size_backlog.py — make the un-carved sub_<addr> functions visible to coddog.

coddog's read_elf keeps only ELF symbols with size>0. The gbadisasm `asm/sub_*.s`
functions are real .text symbols but size-0, so coddog SKIPS the whole backlog.
This appends a BYTE-NEUTRAL `.size sub_X, .-sub_X` to each `asm/sub_*.s` whose
`.global` matches its filename — giving coddog 1100+ more functions to compare.

Workflow (one-time analysis, then REVERT the .size with `git checkout -- asm/`):
  1. python3 scripts/tools/coddog/size_backlog.py        # adds .size (make compare stays OK)
  2. make                                                 # build the sized ELF
  3. cp scripts/tools/coddog/fe8.coddog.yaml fe8.coddog.yaml
     cp scripts/tools/coddog/fe8u.coddog.yaml fe8u.coddog.yaml
  4. tools/coddog/target/release/coddog compare2 fe8.coddog.yaml jp fe8u.coddog.yaml us \
       --sort-by similarity -t 0.9 > /tmp/coddog_out.txt
  5. grep '^sub_.* - .*(99.99%\\|100.00%)' /tmp/coddog_out.txt  # region-SAME backlog matches
  6. git checkout HEAD -- asm/ ; rm -f fe8*.coddog.yaml         # revert (analysis only)

A `sub_X - US_name (99.99%)` line means JP sub_X IS US_name (opcode-identical mod
relocation). Carve it: rename sub_X -> US_name (def + callers) then autobind.run(US_name)
-- it byte-matches once the data/proc symbols are sentinel-bound (the straight-port
graduate_jp_batch misses them). +matching-C AND +named. See reference/coddog/.
"""
import glob, re
sized=0
for f in glob.glob("asm/sub_*.s"):
    txt=open(f).read()
    if ".size sub_" in txt: continue
    m=re.search(r"\.global (sub_[0-9A-Fa-f]+)", txt)
    if not m: continue
    g=m.group(1)
    if not re.search(rf"^{g}:", txt, re.M): continue
    open(f,"a").write(f"\n.size {g}, .-{g}\n")
    sized+=1
print(f"sized {sized} sub_ functions (.size appended; byte-neutral). "
      f"Build, run coddog, then `git checkout HEAD -- asm/` to revert.")
