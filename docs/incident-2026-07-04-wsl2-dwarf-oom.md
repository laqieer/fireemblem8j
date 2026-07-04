# Incident postmortem — WSL2 VM dropped by host during DWARF tooling on the 427 MB ELF (2026-07-04)

**Severity:** low (developer-environment only; **zero repo/data loss** — the git tree
stayed clean, every artifact was reproducible). Impact: the interactive WSL2 session was
killed twice mid-task, dropping the terminal and losing all in-flight background shells +
`/tmp` scratch.

**One-line:** Running two heavy DWARF passes (`arm-none-eabi-objdump --dwarf=decodedline`
**concurrently** with `arm-none-eabi-nm -n -l`) on the **427 MB debug `fireemblem8.elf`**
(#142) spiked the WSL2 VM's memory past its host-imposed ceiling; the **Windows host killed
`vmmem`**, disconnecting the whole WSL2 distro — surfacing as "the session exited by itself".

## Context

Work on #144 (speed up `gen_pages.py` / `calcprogress.py`). The issue itself proposes
replacing `nm -l` with `objdump --dwarf=decodedline` for the symbol step. While baselining
the *old* path, I launched, at the same time:
- a detached `arm-none-eabi-nm -n -l fireemblem8.elf` (~27-min sustained, per-symbol DWARF
  line resolution), and
- an async `arm-none-eabi-objdump --dwarf=decodedline fireemblem8.elf` (decodes the entire
  DWARF line program into memory).

Both target the same 427 MB DWARF-heavy ELF. The VM died shortly after.

## What happened (timeline)

1. `python3 scripts/calcprogress.py` baseline ran fine (94 s; small `.o` files, **no** ELF /
   DWARF). Not a factor.
2. `arm-none-eabi-nm -n fireemblem8.elf` **without** `-l` = 0.17 s, no issue (no DWARF line
   resolution).
3. Launched `nm -n -l` (detached) **and** `objdump --dwarf=decodedline` (async) on the ELF
   **concurrently**. `objdump` exited code 1 with **no output file** = killed mid-parse.
4. On the next turn the sandbox had reset: **all background shells were gone from the
   registry** and **`/tmp` scratch files had vanished** (`/tmp/decodedline.txt`,
   `/tmp/nm_nl_baseline.txt`, `/tmp/progress_baseline.txt`) — the signature of a **VM
   restart**, not a normal process exit.
5. It recurred, confirming the pattern: drops correlate exactly with heavy 427 MB-ELF DWARF
   operations.

## Investigation (how the root cause was isolated)

| Check | Result | Inference |
|---|---|---|
| `df -h /tmp /home` | 896 G free | **Not** disk exhaustion |
| `free -h` (after) | 27 G free of 31 G | Misleading — the hog was already killed on restart |
| `dmesg \| grep -i oom` | **empty** | Kill was **not** the Linux OOM-killer → happened *above* Linux (host/`vmmem`) |
| `/proc/version` | `microsoft-standard-WSL2` | Confirms memory-capped WSL2 utility VM |
| `/proc/sys/vm/overcommit_memory` | `0` (heuristic) | A fast multi-GB spike can be refused/killed |
| background shells + `/tmp` gone together | — | **VM restart**, not a clean process exit |
| `nm -n` (no `-l`) vs `nm -n -l` / `objdump --dwarf` | 0.17 s vs multi-GB | The **DWARF line-table** path is the memory hazard |
| `/proc/meminfo` MemTotal | 32 GB (+8 GB swap) | Default 50 %-of-host cap → host ≈ 64 GB; VM balloon pressures the host |

**Mechanism:** `objdump --dwarf=decodedline` must materialize the whole decoded line table
of a 427 MB DWARF ELF (multi-GB, spiky); run alongside `nm -n -l` (also holding DWARF) plus
Linux page cache from repeatedly reading the 427 MB file, the VM's `vmmem` exceeded its
host-imposed ceiling. Under host memory pressure Windows terminates `vmmem`, which **drops
every session attached to that WSL2 distro**. The empty Linux `dmesg` is the tell: a
host-level kill leaves no Linux OOM trace.

## Root causes

| # | Cause | Why it bit |
|---|---|---|
| R1 | **Two DWARF passes on the 427 MB ELF concurrently** | `objdump --dwarf=decodedline` + `nm -n -l` each hold GB of DWARF; together they blew the VM ceiling. |
| R2 | **The 427 MB debug ELF itself (#142)** | Its bloated DWARF makes *any* line-resolving tool a memory hazard in a capped VM. `nm -n` (no `-l`) is trivially cheap by contrast. |
| R3 | **No `.wslconfig`** | Default 50 %-of-host cap + tiny 8 GB swap left no room to absorb a spike; nothing forced page-cache reclaim. |
| R4 | **Scratch in `/tmp` + attached background shells** | A VM restart clears `/tmp` and kills attached async shells → baselines lost, work restarted. |
| R5 | **`free -h` read *after* the crash** | Showed plenty free (hog already dead) — a red herring that hides memory-spike root causes. |

## Lessons / standing rules (now enforced)

1. **Never run two DWARF-heavy passes at once on the big ELF.** `objdump --dwarf=*` and
   `nm -l` on `fireemblem8.elf` are each multi-GB; run **at most one at a time**, alone,
   streaming straight to disk. Prefer `nm -n` (no `-l`) whenever line info isn't needed
   (0.17 s vs minutes + GBs).
2. **In memory-capped WSL2, treat the 427 MB debug ELF as a hazard.** Validate DWARF-parsing
   logic on a **small** object/ELF; trust CI (16 GB runner, no cap) for the full-ELF run.
   Isolate any unavoidable full-ELF DWARF pass as the **last, standalone** step.
3. **A durable `.wslconfig` is the real fix** (`C:\Users\<user>\.wslconfig`, then
   `wsl --shutdown`): cap `memory` below host RAM (leave Windows headroom → no host-side
   `vmmem` kill), a large `swap` to absorb spikes, `autoMemoryReclaim=gradual` +
   `pageReporting=true` to return huge-file page cache. Committed config used here:
   `memory=24GB / swap=32GB / autoMemoryReclaim=gradual / pageReporting=true`.
4. **Persist baselines outside `/tmp`.** A WSL2 drop clears `/tmp` and kills attached async
   shells. Write reusable baselines to the session state dir (or repo-ignored path) and use
   `detach: true` only when survival across a restart is actually wanted.
5. **Diagnose a "session exited by itself" by signature, not by `free`.** Background shells +
   `/tmp` vanishing *together* = VM restart. **Empty Linux `dmesg`** + WSL2 = the kill was
   **host-level** (`vmmem`), not the Linux OOM-killer. `free -h` after the fact is
   misleading.

## Recovery / prevention playbook (next time WSL2 "drops by itself" mid-task)

1. **Confirm it was a VM restart:** are prior background shells gone from the registry and
   `/tmp` scratch cleared? If yes → host-level `vmmem` kill, not your logic.
2. **Confirm host-level (not Linux OOM):** `dmesg | grep -i 'oom\|killed process'` **empty**
   under WSL2 ⇒ the host killed the VM. Check `grep -i microsoft /proc/version`.
3. **Apply the durable fix:** write/raise `.wslconfig` (big `swap` + `autoMemoryReclaim` +
   `memory` cap below host RAM), then `wsl --shutdown` and reopen.
4. **Restructure the workload:** never concurrent DWARF passes on the big ELF; stream to
   disk; validate parsing on a small target; make the full-ELF pass the last standalone step.
5. **Re-seed baselines** into a restart-surviving path before resuming.

See #144 (the task in flight) and #142 (the 427 MB debug-ELF bloat that is the underlying
hazard).
