# Incident postmortem — WSL2 DWARF swap thrashing (2026-07-21)

**Severity:** low (single-developer environment availability incident). Impact: the
active WSL2 guest stopped making recorded progress at approximately 03:28 UTC, interrupting
fleet verification and another session's test/build work until a new guest boot at
06:01 UTC. No ELF size/mtime change or corruption evidence was found, but no
post-incident full hash was run.

**One-line:** Two concurrent `nm -l` readers of the unusually large FE8J DWARF ELF were a
strongly supported, probable contributor to observed memory pressure and severe swap I/O;
swap thrashing is the best-supported explanation for the loss of responsiveness, not a
directly proven causal event, and the exact final trigger and later VHD teardown remain
unresolved.

## Context

The workstation was running fleet updates and verifications for `fe-maps`,
`FE_GBA_Function_Library`, and `FE-Clib-Decomp`. Those activities included two concurrent
FE8J `nm -l` readers doing DWARF line resolution. Shortly before guest logging stopped,
the expansion session `335511d9…` started a full Python test run, while the main fleet
session `d72c405d…` separately started Node/Rollup.

This was not an unconfigured/default WSL2 guest. The existing configuration was
`memory=24GB` and `swap=32GB` and requested gradual automatic reclaim and page reporting.
Observed `MemTotal` and `SwapTotal` directly reflected the memory and swap settings;
effective reclaim and page-reporting behavior was not measured. In particular, lack of
`.wslconfig` is not a cause here. The interval evidence is consistent with large swap
capacity trading an abrupt limit for prolonged high-latency I/O, but that counterfactual
was not tested and more swap is not a primary remediation.

All times below are UTC.

## Timeline

| Time | Observation | Interpretation and limit |
|---|---|---|
| 03:10:48 | FE8J `nm -l` PIDs 5357 and 6672 used 2,374,816 and 2,374,248 KiB RSS: 4,749,064 KiB (4.529 GiB) combined. A Python process used 112,140 KiB. | Visible lower bound including Python: 4,861,204 KiB (4.64 GiB). This is far below the 24 GiB guest limit. The snapshot was filtered, RSS is not private/PSS, and total system RSS, PSS, and working set are unknown. |
| Through 03:19:50 | Both `nm` readers were confirmed present. | Confirms overlap, not their complete lifetimes. |
| 03:27:40 | PID 5357 was sampled at 2,374,816 KiB RSS and 99.6% CPU. | PID 6672 had no recorded completion, but it was not directly sampled at 03:27; do not infer that both were observed then. |
| 03:27:42 | Expansion session `335511d9…` started the full Python tests. | No completion appears in the logs. Timing permits a marginal contribution but does not establish this as the final trigger. |
| 03:27:48 | Main fleet session `d72c405d…` started Node/Rollup. | It also has no logged completion. This was not the expansion session, and its timing is suggestive only. |
| 03:28:11 | Final guest journal entry: `systemd-journald: Under memory pressure, flushing caches.` | Last direct guest evidence and approximate loss-of-progress point. It is not an OOM-kill record. |
| 03:32:20 | VHDMP Event 301 reported 12,648,833,024 swap-write bytes in a 3604-second interval, across 943,027 writes at 328 ms average latency. | Direct host evidence of high-volume, high-latency swap I/O. |
| 04:32:24 | Event 301 reported 34,045,960,192 write bytes and 7,027,535,872 read bytes in a 3604-second interval, with 3,369,449 writes at 339 ms average latency. | Host VHD interval reporting continued after guest progress disappeared. |
| 05:32:28 | Event 301 reported 8,297,996,288 write bytes and 5,548,089,344 read bytes in a 3604-second interval. | Continued interval-level swap traffic. These Event 301 values are neither lifetime cumulative counters nor proof of uninterrupted guest activity. |
| 05:58:03 | VHDMP Events 18/27/28/16 recorded the old swap and ext4 VHDs unsurfacing, closing, and being destroyed. | Host-side teardown occurred about 2.5 hours after the final guest journal entry; its initiating reason is not recorded in the available evidence. |
| 06:01:25 | A new WSL kernel boot began; the journal characterized the preceding shutdown as unclean. | Establishes a guest lifecycle boundary, but not whether memory pressure directly caused the later teardown. |

The guest loss-of-progress boundary, the subsequent host VHD interval reports, the
05:58:03 VHD teardown, and the 06:01:25 boot are separate observations. They must not be
collapsed into a single continuously observed failure mechanism.

## Investigation and evidence

| Check | Result | What it establishes |
|---|---|---|
| Process RSS snapshots | The two `nm -l` readers totaled 4,749,064 KiB (4.529 GiB) RSS; with sampled Python the visible lower bound was 4.64 GiB at 03:10:48. Comparable dual-`nm` concurrency had completed earlier. | The DWARF work had material residency and is a probable contributor, but its sampled RSS was far below 24 GiB and does not deterministically explain the incident. Filtered RSS cannot recover aggregate PSS or working set. |
| Guest journal | Final record at 03:28:11 says journald was under memory pressure and flushing caches. | Direct evidence of guest memory pressure immediately before recorded progress stopped; it does not record why responsiveness was lost. |
| Host VHDMP Event 301 | Large swap write/read volumes and hundreds-of-milliseconds average write latency in three 3604-second reports. | Direct evidence of severe swap I/O across reported intervals, not a lifetime total, continuous-activity proof, or direct causal record for lost responsiveness. |
| VHDMP lifecycle events | Old swap/ext4 VHD unsurfacing, close, and destruction at 05:58:03. | Establishes later host-side VHD teardown, not its cause. |
| New guest journal | Kernel boot at 06:01:25; prior shutdown marked unclean. | Establishes restart and unclean prior shutdown. |
| Linux OOM evidence | No OOM-killer record, cgroup OOM, or allocation failure in the inspected window. | A recorded OOM event was not found; absence does not identify an alternative final trigger or exclude records lost before persistence. |
| Windows memory-pressure evidence | No Event 2004 in the inspected window. | No inspected Windows resource-exhaustion diagnosis or proof that the host killed `vmmem`; uninstrumented host actions remain possible. |
| Kernel failure evidence | No panic, watchdog, or hung-task record in the inspected window. | A persisted Linux kernel crash/hang record was not found. |
| Storage/integrity evidence | No ext4/VHD error in the inspected window; no ELF size/mtime change or corruption evidence. No post-incident full hash was run. | Storage failure and damaged input are not supported, but byte-for-byte identity was not re-established. High VHD latency is swap-I/O evidence, not media-failure evidence. |
| Host lifecycle | No host reboot in the inspected window. | A recorded host reboot does not explain the WSL lifecycle change. |
| Workload logs | Python tests and Node/Rollup started in different sessions just before the final guest entry and never logged completion. | Possible marginal load only; neither is proven to be the trigger. |

Absence findings are bounded by the inspected guest and host windows. They cannot exclude
records lost before persistence, events outside those windows, or uninstrumented host
actions.

## ELF anatomy and safe measurements

| Property | FE8J `fireemblem8.elf` | FE8U ELF |
|---|---:|---:|
| File size | 449,886,868 bytes | 47,894,988 bytes |
| Allocation/layout | Nonsparse; 258 sections | — |
| `.debug_*` total | 426,748,542 bytes (94.86%) | 25,082,305 bytes (52.37%) |
| `.debug_info` | 416,700,288 bytes (92.62%) | 23,298,729 bytes (48.65%) |
| Debug plus symbols | 96.27% | — |
| Debug compression | Uncompressed | — |

The FE8J file is about 9.4 times the total size of FE8U, while its `.debug_info` alone is
about 17.9 times FE8U's. That shape makes operations which resolve source lines
qualitatively different from section-header or symbol-only reads.

Measured low-risk alternatives on FE8J were:

| Operation | Measurement | Scope |
|---|---:|---|
| `readelf -h/-SW/-lW` | approximately 3.3 MiB RSS | ELF headers, section table, and program headers; no full DWARF line resolution |
| Symbol-only pyelftools | 34,128 KiB RSS; 9.48 s | Symbol extraction without resolving source lines |
| `nm` without `-l` | 47,008 KiB RSS; 0.19 s | Symbols only |

These measurements show that a large ELF file is not by itself enough to create a
multi-gigabyte resident set. The expensive path is parsing and resolving the unusually
large DWARF. Concurrency is an avoidable risk multiplier, but comparable dual-`nm` work
completed earlier and therefore was not a deterministic failure condition.

## Causal chain

| Stage | Finding |
|---|---|
| **Latent condition** | FE8J's nonsparse, uncompressed 449,886,868-byte ELF is 94.86% `.debug_*`, dominated by 416,700,288 bytes of `.debug_info`; line-resolving tools therefore have an unusually large input and object graph. |
| **Initiating workload** | Fleet verification ran two FE8J `nm -l` readers concurrently. Both were confirmed through 03:19:50, and one remained directly observed at high CPU and 2,374,816 KiB RSS at 03:27:40. Their combined sampled RSS earlier was 4.529 GiB, far below the 24 GiB guest, and comparable concurrency had completed before. |
| **Probable amplification** | Concurrent parsing/private objects, repeatedly touched file-backed pages, page cache, and any retained/captured output could compete with the rest of the guest. Full tests and Node/Rollup in separate sessions may have added marginal load, but the logs cannot quantify any of these aggregate effects. |
| **Best-supported probable mechanism** | Memory pressure and severe swap I/O are confirmed observations. Swap thrashing causing loss of useful responsiveness is the best fit for their timing and magnitude, but no preserved event directly proves that causal link or the exact threshold crossing. |
| **Observed effect** | Recorded guest progress ended at approximately 03:28; in-flight verification, tests, and build work did not complete in their logs. |
| **Later teardown** | At 05:58:03 Windows unsurfaced, closed, and destroyed the old swap/ext4 VHDs; a new guest booted at 06:01:25 after an unclean shutdown. Why teardown occurred at that time is unresolved. |

This chain deliberately stops where the evidence stops. It does not turn temporal
proximity into proof of a Linux OOM kill, host `vmmem` kill, kernel crash, Node/test
trigger, storage failure, or a specific teardown mechanism.

## Findings and confidence

### Confirmed observations

| Finding | Confidence | Evidence |
|---|---|---|
| The guest recorded memory pressure immediately before logging stopped. | **High** | Final journald pressure message at 03:28:11. |
| Host reports recorded severe swap I/O in three 3604-second intervals. | **High** | High write/read volumes and 328/339 ms average write latency where reported. |
| Two FE8J `nm -l` readers overlapped and totaled 4.529 GiB sampled RSS at 03:10:48. | **High** | Direct process snapshots, with the RSS/PSS and filtering limitations stated above. |
| The VHDs were torn down later and the next boot followed an unclean shutdown. | **High** | VHDMP IDs 18/27/28/16 at 05:58:03 and new kernel boot at 06:01:25. |

### Probable

| Finding | Confidence | Evidence gap |
|---|---|---|
| Swap thrashing explains the loss of useful guest responsiveness. | **Medium/high** | It best fits the guest pressure message and severe host swap I/O, but no causal event or complete guest telemetry was preserved. |
| Concurrent `nm -l` on the huge uncompressed FE8J DWARF was a strongly supported contributor. | **Medium/high** | The readers had material RSS and expensive line-resolution work, but 4.529 GiB was far below the 24 GiB guest, total PSS/working set is unknown, and comparable concurrency had completed earlier. |
| Aggregate workload crossed a practical responsiveness threshold rather than one allocation producing a recorded fatal event. | **Medium** | Total system PSS, cgroup usage, PSI history, swap-in/out rate, and complete process inventory were not preserved. |

### Possible

| Finding | Confidence | Evidence gap |
|---|---|---|
| Full Python tests and/or Node/Rollup supplied marginal load near the threshold. | **Low** | Start times and missing completions only; no matching RSS/PSS samples or causal event. |
| A manual action, host policy, or unrecorded WSL condition initiated the 05:58:03 teardown. | **Unknown** | Lifecycle events describe what was torn down, not who or why. |

### Not evidenced in the inspected window

- A **recorded** Linux OOM-killer, cgroup OOM, or allocation-failure event.
- A **recorded** panic, watchdog, or hung-task event.
- A Windows Event 2004 memory-exhaustion diagnosis or host reboot.
- An ext4/VHD storage error.
- An ELF size/mtime change or corruption evidence; a post-incident full hash was not run.
- “No `.wslconfig`” as a cause: the 24 GB memory/32 GB swap/reclaim configuration already
  requested those settings, and observed totals directly reflected memory and swap. The
  effective reclaim/page-reporting behavior was not measured.

These are absence findings, not global exclusions. Records may have been lost before
persistence, and host actions may not have been instrumented.

## Likely mechanism and contributing factors

1. **Best-supported probable mechanism: swap thrashing removed useful responsiveness.**
   Memory pressure and severe swap I/O are observed; their causal connection to the
   loss-of-progress boundary is probable rather than directly recorded.
2. **Strongly supported probable workload contributor: concurrent source-line
   resolution.** Two `nm -l` passes multiplied avoidable parsing work. Their sampled
   4.529 GiB RSS alone did not approach the 24 GiB guest limit, however, and comparable
   dual-`nm` concurrency had completed earlier.
3. **Strongly supported latent contributor: FE8J debug information dominates the ELF.** Its
   426,748,542 bytes of uncompressed `.debug_*` data make line resolution far more costly
   than symbol-only inspection and far costlier than the FE8U comparison artifact.
4. **Contributing scheduling weakness: heavyweight work was not serialized or gated.**
   Fleet verification and another session could overlap without a shared memory/PSI
   admission check.
5. **Contributing observability gap: only filtered process snapshots survived.** Without
   total PSS, PSI, cgroup counters, swap rates, complete command lifetimes, and host
   lifecycle context, the exact threshold crossing and teardown initiator cannot be
   reconstructed.
6. **Possible swap-capacity tradeoff, not a proven cause.** The 32 GiB swap setting and
   interval reports are consistent with swap allowing prolonged high-latency I/O. No
   counterfactual run established that less swap would have improved recovery, and more
   swap is not a primary remediation.

No independent handle leak or handle-only cause was evidenced. An open file descriptor
normally costs a small amount of file and kernel metadata. An untouched `mmap` reserves
virtual address space without making every mapped byte resident; residency rises as pages
are faulted and touched. DWARF parsing and line resolution can additionally build private
indexes/objects, while page cache, captured output, and concurrency can retain or duplicate
memory. Those mechanics make active parsing and aggregate residency more plausible than
“the file was open,” without making a handle-related defect impossible in the absence of
complete descriptor and mapping telemetry.

## Lessons and standing rules

1. **Remove `nm -l` where source lines are not an explicit output requirement.** Use plain
   `nm` or symbol-only pyelftools; measured costs are 47,008 KiB/0.19 s and
   34,128 KiB/9.48 s respectively.
2. **Serialize unavoidable full-ELF line resolution.** Permit at most one DWARF
   line-resolving process for FE8J, and do not overlap it with fleet-wide tests/builds.
3. **Cache line-resolution results.** Key the cache by a cryptographic ELF content hash or
   stable build ID, include the tool/version and options in the cache schema, and publish
   one result to all consumers instead of reparsing per repository.
4. **Separate runtime symbols from debug payload when consumers permit it.** Use complete
   commands such as:

   ```sh
   objcopy --only-keep-debug input.elf input.elf.debug
   objcopy --strip-debug --add-gnu-debuglink=input.elf.debug input.elf input.stripped.elf
   ```

   Do not blindly alter the canonical matching ELF. Validate every consumer, symbol/debug
   association, and reproducibility requirement before adopting the stripped artifact.
   Consumers that only need symbols should not parse the detached DWARF.
5. **Treat debug compression as an I/O/storage optimization, not a memory guarantee.**
   Compressed debug sections can reduce file size and bytes read, but a parser may
   decompress sections and construct equal or larger in-memory representations. Measure
   peak PSS before relying on compression as a memory control.
6. **Put hazardous tools in a memory boundary.** Use a cgroup/systemd scope with
   `MemoryHigh`, `MemoryMax`, and an appropriate `MemorySwapMax` so a parser is throttled or
   terminated without making the whole guest unusable. Validate the selected bounds on a
   single isolated run.
7. **Gate starts on pressure, not nominal capacity.** Before a heavyweight pass, check
   `/proc/pressure/memory`, available memory, swap use, and recent swap-in/out rate. Refuse
   or queue work when PSI or swap activity exceeds an established baseline.
8. **Preserve telemetry outside volatile session output.** Record timestamps, command/PID
   lifetimes, `/proc/<pid>/smaps_rollup` PSS, cgroup `memory.current/events`, PSI,
   `vmstat`, and guest journal excerpts to a durable, bounded location. Preserve matching
   host VHDMP/System/WSL lifecycle events.

## Recovery and prevention playbook

### Before running

1. Classify the consumer: headers only, symbols only, or source-line resolution. Delete
   line resolution from the path unless its result is actually consumed.
2. Look up a cache entry keyed by ELF hash/build ID plus tool/version/options.
3. For a cache miss that truly needs lines, acquire a single-machine DWARF semaphore.
4. Check memory PSI, available memory, swap occupancy/rates, and whether tests/builds are
   active. Queue the job if the guest is already pressured.
5. Start the job in a bounded cgroup/systemd scope and start lightweight, durable
   telemetry. Do not launch a second full-DWARF reader.

### On rising pressure

1. Stop admitting new tests, builds, and DWARF readers.
2. Cancel the newest optional workload first; if pressure persists, terminate the bounded
   DWARF job rather than waiting for swap to rescue the guest.
3. Preserve process PSS, cgroup events, PSI, `vmstat`, journal, and host event timestamps.
   Avoid new full ELF/DWARF probes during diagnosis.
4. If the guest is no longer interactive, use host-side WSL controls deliberately and
   record the command/time. Do not infer a host kill merely because a later boot occurred.

### After recovery

1. Correlate guest and host UTC timelines without treating Event 301 interval values as
   lifetime cumulative or continuously observed activity.
2. Check explicitly for Linux/cgroup OOM, allocation failure, panic/watchdog/hung task,
   Windows Event 2004, VHD/ext4 errors, host reboot, and manual/automated WSL teardown.
3. Verify repository state and artifact hashes before resuming.
4. Resume with symbol-only tools or one isolated, bounded line-resolution pass; publish its
   cached result for the remaining fleet consumers.

## Comparison with the 2026-07-04 incident

The [2026-07-04 WSL2 DWARF incident](incident-2026-07-04-wsl2-dwarf-oom.md) is operational
history showing why concurrent full-DWARF work on this oversized FE8J ELF warrants caution
and cheaper symbol paths. It is not independent proof of this incident's cause.

In particular, this report does not adopt the earlier report's unsupported inference that
empty Linux `dmesg` implies a host `vmmem` kill, its deterministic dual-DWARF causality, or
its conclusion that more swap/`.wslconfig` is “the real fix.” The incidents are not known
to have identical teardown mechanisms. For 2026-07-21, memory pressure and severe VHD swap
I/O are observed, swap thrashing is the best-supported probable explanation for lost
responsiveness, concurrent FE8J `nm -l` is a strongly supported probable contributor, and
the exact threshold and 05:58 teardown remain unresolved.
