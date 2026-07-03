# Batch plan — FE8J asset editability (fe8u-parity, "fix all .bin misses") + shiftability validation

## Context

User asked (via `/batch`, ultracode), then expanded twice, for comprehensive
**fe8u-parity asset editability** in the FE8 Japanese decomp
(`/home/laqieer/fireemblem8j`, oracle `../fireemblem8u`), plus shiftability validation.

The unifying directive (user, 2026-06-29): **use fe8u as the ground-truth oracle for the
correct SOURCE FORM of every asset; for every committed `.bin` in fe8j, if fe8u builds
the same asset from a more-editable source (`.png` / `.s` / `.mid` / `.aif` / typed C),
that is a MISS to fix; if fe8u also commits it as binary, it is legitimate FLOOR.** Fix
all misses. Specific asks folded in: (1) all graphics → `.png`; (2) residual sound
(voicegroups, m4a tables) → editable `.s`; (3) raw C strings → literals like
`../fireemblem8u/src/menu_def.c`; (4) FE6 SIO payload built from source like fe8u;
(5) **battle animation** → editable `.s` via fe8u's separate `linker_script_banim.txt` +
`$(BANIM_OBJECT)` compressing-linker pipeline (e.g. `data/banim/banim_mf_mi1_motion_o.bin`
→ `banim/banim_mf_mi1_motion.s`); also check `linker_script_sound.txt`; (6) shiftability
validation like fe8u PRs #745/#744.

Oracle: `make compare` → `fireemblem8.gba: OK` (sha1 `7da0456…`). Per
[[always-watch-ci-after-push]] an **incremental** `make compare` *lies*; every unit
verifies with a clean, no-baserom, parallel build.

### Audit findings (fe8j has 4,901 committed `.bin`)
- **MISS — battle-anim (~1,481):** `data/banim/*.bin` (1081) + `data/residual/AnimSprite_*.bin`
  (~390) + 184 `asm/dat_data_banim_p*.s` incbins. fe8u = **202 editable `banim/*.s`** built
  by `scripts/arm_compressing_linker.py` (+`compressor.py`, `tools/scaninc`,
  `linker_script_banim.txt`, `include/banim_*.inc`) into `banim/data_banim.o` @ROM `0xC02000`,
  LZ-compressed. JP region sits at a **different offset** (~`0x0860xxxx`) and is partitioned
  differently → highest-risk lane.
- **MISS — pixel gfx (~486, audit said 256+frontier):** `Img_*`/`gGfx_*` raw `.bin` (e.g. all
  `misc_gfx/`) — fe8u ships the editable `.png` (byte-matching). png→4bpp round-trips exact.
- **MISS — sound m4a tables (~22):** `data/sound/gMPlayTable.bin` (@0x082140B4) etc. → fe8u
  `sound/music_player_table.s` / `programmable_wave_data.s` / `keysplit_tables.s` (editable `.s`).
- **MISS — voicegroup tail (~17):** 7 missing vg (035/036/076/077/078/086/092) + 11
  `frontier_df3_voicegroup` + `frontier_df4_voice_*` → `sound/voicegroups/*.s` (documented ceiling).
- **MISS — menu strings:** `src/data/*_ref/` inline-asm `.4byte sym+off` into raw
  `graphics/frontier_df4_misc_lo/*.bin` string pools → C literals like fe8u `src/menu_def.c`.
- **MISS — UnitDef residuals (~60):** `data/residual/UnitDef_Ch*_*.bin` → typed
  `struct UnitDefinition[]` C (fe8u `events_udefs.c`; 155 already done — finish the region-diff tail).
- **MISS — map tilemaps (7):** `graphics/map/ObjectType*.bin` → `.png`/`.S` (fe8u `MARTOMAP`).
- **MISS — FE6 payload:** built from the **`mgfembp` git submodule** (see below).
- **DEFERRED MISS — ApConf/gUnkData/opaque (~180):** `data/residual/ApConf_Manim*` etc.; fe8u
  pattern unclear → needs RE; document, don't fake.
- **FLOOR (~1,829, keep binary — fe8u does too):** TSA `.tsa.bin` (572) + `.map.bin`, `.aif`
  PCM (439), `op_anim`/`opanim` tilemaps (116), `graphics/banim/efx*` effect bins (105),
  compressed region-diff `frontier_*` gfx. ⚠️ The audit over-flagged `frontier_*` as floor —
  `frontier_chap_title` images + `frontier_df4_misc_lo` strings ARE misses (handled in G4/C1).
- **FE6 (corrected per user):** canonical fe8u builds the payload **from the `mgfembp` git
  submodule** (StanHash/mgfembp), NOT a committed `.bin`. Local fe8u only *fell back* to a
  prebuilt blob for Docker/Alpine (commits `bbe919f4`/`0578c6b8`); from-source wiring is in
  fe8u history `0ff24f9c`/`bbe919f4~1`. See [[fe8j-fe6sio-payload-mgfembp]].
- **Shiftability:** fe8j has only `audit_pointers.py` (gate=0). fe8u PR #745 added
  `scripts/shiftcheck/` (build-addr audit → `--emit-relocs` reloc scan → cross-resource
  offset → differential two-shift rebuild → optional mGBA oracle), gated by `make shiftcheck`.
- **Sound linker script:** fe8u `INCLUDE`s `linker_script_sound.txt` as a layout fragment;
  fe8j inlines sound layout in its generated `ldscript.txt`. fe8j sound is already from-source,
  so this is organizational parity (folded into S1, optional), not an editability miss.

### Topology / collision
In-flight work (permuters on `sub_8084CE4`/`sub_80A73D4`, ~30 efx/sio code worktrees) is all
**code axis** — no overlap. [SUPERSEDED 2026-07-03: `sub_80A73D4` has since MATCHED byte-exact
in-repo (banked); `sub_8084CE4` remains an 8-byte agbcc spill wall.] Units below are scoped to **disjoint files/dirs** (and disjoint
lines of the shared `layout/data_incbin_deps.mk`/`Makefile`/generated `ldscript.txt`); each PR
merges independently and the integrator serializes final `make compare` gates.

---

## Work units (12)

### U0 — `.bin` form-audit script (the reproducible "find all misses" deliverable)
Build `scripts/audit_bin_forms.py`: for every fe8j `git ls-files '*.bin'`, classify
MISS / FLOOR / UNCERTAIN against fe8u (`git ls-files` for a more-editable source of the same
basename/symbol/ROM-region; known FLOOR dirs = TSA/`.map.bin`/`efx*`/`direct_sound`). Emit
`docs/bin_audit.md` (grouped, with fe8u-source proof per entry + counts). Non-byte-affecting
(adds a script + doc) → cannot break `make compare`. Independent, lands first as the gate the
other lanes check against. Seed its category table from the audit above.

### Lane A — Graphics → `.png` (4 units)  [MISS: pixel gfx + map tilemaps]
Each: for image-named raw `.bin` (`Img_*`/`gImg_*`/`gGfx_*`/`gfx_*`, size %32==0, NOT
`.pal.bin`/`.gbapal`/`.agbpal`/`.tsa.bin`/`.map.bin`), commit the editable `.png` (reuse the
byte-matching `../fireemblem8u/graphics/**/<name>.png` when region-same; else `tools/gbagfx
<name>.bin <name>.png`), repoint its INCBIN (owning `src/data/*.c` / `asm/*.s`) + the
`layout/data_incbin_deps.mk` line `<name>.bin.lz`→`<name>.4bpp.lz` (or `.bin`→`.4bpp`), delete
the committed raw `.bin`. png→4bpp round-trips byte-exact so the existing LZ step is unchanged.
Leave non-tile-aligned / no-round-trip as documented floor. Gate per file on `make compare`.
1. **G1 — `graphics/misc_gfx/` + `graphics/misc_gfx3/`** (~128). Mostly region-same → reuse
   `../fireemblem8u/graphics/misc/*.png`.
2. **G2 — `graphics/misc_gfx2/` + `graphics/misc/`** (~122).
3. **G3 — `graphics/gfx_data_bg/` (~86) + `graphics/gmapunit/` (~53).** TSA-bearing bgs use
   `scripts/gfxtools/tsa_generator.py` (FETSATOOL) where a paired `.tsa.bin` exists.
4. **G4 — `graphics/frontier_chap_title/` (116) + `frontier_df3_titlescreen/` (3) +
   `frontier_df3_opanim_gfx/` (4) + `graphics/map/ObjectType*.bin` (7 → `.png`/`.S`).**

### Lane B — Battle animation pipeline (1 cohesive unit)  [MISS-1, ~1,481]
5. **BA1 — port fe8u's banim compressing-linker pipeline; replace all banim `.bin`.**
   Copy `scripts/arm_compressing_linker.py`, `scripts/compressor.py`, `tools/scaninc`,
   `include/banim_sheet.inc`/`banim_code.inc`/`banim_code_frame.inc`, the 202 `banim/*.s`, and
   `linker_script_banim.txt` from fe8u; add `BANIM_OBJECT := banim/data_banim.o` + its
   `arm_compressing_linker.py … -b <JP base>` rule + `banim/%.o` (scaninc) rule + `-R
   $(BANIM_OBJECT).sym.o` in the final link + `BANIM_OBJECT` in `ALL_OBJECTS`; make
   `gen_layout.py`/`ldscript.txt` place `banim/data_banim.o(.data)` at the JP banim base and
   drop the `data/banim/*.bin` + `data/residual/AnimSprite_*.bin` + `asm/dat_data_banim_p*.s`
   incbins. Find the JP base by locating the banim region (≈`0x0860xxxx`); adapt `-b`. Wire
   `--banim-ldscript`/`BANIM_OBJECT` into shiftcheck (U/V1). **Cohesive** — nothing compares-OK
   until the whole pipeline replaces the incbin; one worker owns it end-to-end. **Highest risk**:
   if the JP banim layout/order diverges from fe8u's compressing-linker output such that
   byte-match is infeasible, STOP and report the exact blocker (keep the divergent subset as
   documented floor). Gate on `make compare` + clean self-contained build.

### Lane C — Sound (2 units)  [MISS: m4a tables + voicegroup tail]
6. **S1 — m4a engine tables → editable fe8u-form `.s`.** Port `sound/music_player_table.s`
   (rewrite `gMPlayTable`@0x082140B4 from `data/sound/gMPlayTable.bin` into symbolic-pointer
   `.s`), `sound/programmable_wave_data.s` (collect the `wave0xx_*` samples already symbolized
   in `layout/baseline_syms.d/d312-voicegroups2.tsv`), `sound/keysplit_tables.s` (port; verify
   region-same), and the other M4A-table `.bin` the audit flags. Optionally adopt fe8u's
   `INCLUDE "linker_script_sound.txt"` layout fragment for parity. Model on
   `../fireemblem8u/sound/*.s`. Drop the redundant `*_ref`/`.bin`.
7. **S2 — voicegroup tail → `.s`** (documented ceiling; attempt + honestly document). Convert
   vg 035/036/076/077/078/086/092 + the 11 `frontier_df3_voicegroup` + `frontier_df4_voice_*`
   blobs to `voice_*` macro `.s` where JP `DirectSoundData_*` boundaries resolve; leave the rest
   self-contained `.bin` with a `docs/sound.md` note. Model on `sound/voicegroups/voicegroup0XX.s`.

### Lane D — C strings (1 unit)  [MISS: menu string pools]
8. **C1 — decode menu string pools → real C literals** (`menu_def.c` parity). Author
   `src/menu_def.c` (fe8u `../fireemblem8u/src/menu_def.c` + `include/menu.h` `struct
   MenuItemDef`) with JP strings as UTF-8 literals for `gDebugClearMenuItems`,
   `gDebugContinueMenuItems`, `gDebugChuudanMenuItems`, `gYesNoSelectionMenuItems`,
   `gItemUseMenuItems`, `gStealItemMenuItems`, `gUnitActionMenuItems`, `MenuItems_SioMenudef_*`;
   replace the `src/data/*_ref/` pointer files + consumed `graphics/frontier_df4_misc_lo/*.bin`
   string-pool bytes. Layout-delicate: the new TU `.rodata` must land at the JP address. Verify
   each string round-trips UTF-8→CP932 (use `\xNN` if iconv is lossy). Gate on `make compare`.

### Lane E — Unit-definition residuals → typed C (1 unit)  [MISS-4, ~60]
9. **UD1 — `data/residual/UnitDef_Ch*_*.bin` → typed `struct UnitDefinition[]` C** (fe8u
   `events_udefs.c` parity; extends the 155 already typed at D309). Per chapter table: emit a
   typed C initializer, repoint the manifest, drop the `.bin`. Gate on `make compare`.

### Lane F — FE6 SIO payload (1 unit)  [MISS, from-source]
10. **F1 — build the FE6 SIO payload FROM SOURCE via the `mgfembp` submodule** (fe8u-canonical;
    do **NOT** commit a prebuilt `.bin`). Add `.gitmodules` `mgfembp →
    https://github.com/StanHash/mgfembp.git` (`git submodule add`; `update --init --recursive`;
    submodule-in-worktree is a sharp edge). Makefile (from fe8u `bbe919f4~1`):
    `mgfembp/tools/agbcc/bin/agbcc: cd mgfembp && env -u C_INCLUDE_PATH bash tools/install_agbcc.sh`;
    `mgfembp/mgfembp.bin: … FORCE` → `env -u C_INCLUDE_PATH $(MAKE) -C mgfembp CPP=cpp
    PREFIX="$(PREFIX)" tools` + `… mgfembp.bin`; `fe6sio_payload.bin.lz: mgfembp/mgfembp.bin` →
    `$(GBAGFX) $< $@ -mindist 1`. Port `asm/fe6sio.s` (ARM SIO routines + `.include
    "src/data/fe6_rom_header.inc"` + `FE6SIO_Payload: .incbin "fe6sio_payload.bin.lz"`) +
    `src/data/fe6_rom_header.inc`. Place `asm/fe6sio.o(.data)` at the JP VMA, carving it out of
    the baserom incbin via `gen_layout.py`. CI: `submodules: recursive` + bash/iconv/libpng. The
    mgfembp build (sha1 `8a81a47d…`, region-invariant) makes `make compare` the from-source validator.

### Lane G — Shiftability validation (1 unit)  [PR #745/#744]
11. **V1 — port the fe8u shiftcheck harness.** Copy `../fireemblem8u/scripts/shiftcheck/` →
    `scripts/shiftcheck/`; add `shiftcheck`/`-build`/`-static`/`-offsets`/`-diff` Makefile
    targets (include `--banim-ldscript linker_script_banim.txt`/`BANIM_OBJECT` once BA1 lands,
    else omit); adapt `gen_shifted_ldscript.py`'s anchor to fe8j's generated `ldscript.txt`
    (verify the `crt0.o(.text)` anchor); add `build/shiftcheck/` to `.gitignore`; run `make
    shiftcheck`, fix mechanical HIGH findings (raw-ptr → `.4byte Sym`, byte-neutral), report
    non-mechanical ones; wire `make shiftcheck` into `.github/workflows/`. `make compare` stays OK.

### Deferred (documented, not units this batch)
**ApConf/gUnkData/opaque (~180)** — needs RE to find fe8u's form; record in `docs/bin_audit.md`
as DEFERRED. **Verified FLOOR** (TSA/`.map.bin`/`.aif`/`efx*`/compressed region-diff gfx) — do
NOT touch / fake-extract.

---

## E2E verification recipe (every unit)

Byte-exact `make compare` **is** the end-to-end test (no emulator/browser). Each worker, in its
worktree, runs **all** of:
1. **Incremental gate:** `make compare` → `fireemblem8.gba: OK`.
2. **Clean self-contained build** (catches stale-`.o`/deleted-`.bin` lie + baserom-auto-incbin):
   `make clean && mv baserom.gba /tmp/baserom.gba && make && sha1sum fireemblem8.gba` =
   `7da0456035366aa18414faa79d8fe7649f03c1ed`; then `mv /tmp/baserom.gba baserom.gba`.
3. **Parallel build** (multi-output rule races → grouped `&:` targets): `make clean && make
   -j$(nproc) compare` → `OK`.
4. **V1 only:** `make shiftcheck` → 0 HIGH findings. **U0 only:** running the script is the test
   (no ROM change). **BA1/F1:** the clean build is the from-source validator.
Introduce `0` new `.incbin "baserom.gba"` directives.

## Worker instruction template (verbatim, appended per unit)

```
After you finish implementing the change:
1. Code review — Invoke the Skill tool with skill: "code-review" to find correctness bugs
   (it reports findings; it does not edit code). Fix any findings before continuing.
2. Run unit tests — this repo's "test" is `make compare`. Run the E2E recipe below.
3. Test end-to-end — Follow the E2E recipe (all steps). For asset/layout units the clean
   no-baserom + parallel builds are mandatory (an incremental `make compare` LIES).
4. Commit and push — Commit with a clear message, push the branch, open a PR with
   `gh pr create` (descriptive title). If `gh`/push fails, note it.
5. Report — End with a single line `PR: <url>` (or `PR: none — <reason>`).
```

## After approval — execution order
**Step 0 (FIRST, before anything else): persist this epic in the repo.** Write this plan
verbatim to `docs/epic_asset_editability_shiftability.md` and `git commit` it on a branch
(`docs/epic-asset-editability`), so it is version-controlled, visible to every worker, and
survives context compaction over the long run. Also log the epic in `docs/decisions.md` +
project board #14. (The plan also lives at `/home/laqieer/.claude/plans/peaceful-soaring-valley.md`,
but the repo copy is the durable, shareable source of truth — workers are told to read it.)

**Step 1:** spawn the 12 units as background `isolation: "worktree"` agents (one message);
each worker prompt references `docs/epic_asset_editability_shiftability.md` for full context.

**Step 2:** track PRs in a status table; merge serially through one `make compare` gate (the
single-integrator discipline). U0 (audit script) lands first as the miss-list gate; BA1
(banim) is the long-pole, highest-risk lane.

**Step 3:** as axes move, update `docs/frontier.md` / README scorecard / `docs/decisions.md`
(the README "pixel-gfx → .png done" and "battle-anim floor" claims must be corrected). U0's
`docs/bin_audit.md` becomes the living miss-tracker; remaining DEFERRED ApConf/opaque (~180)
is the next batch.
