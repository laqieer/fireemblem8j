#### Fire Emblem: Seima no Kouseki (FE8 JP) decompilation ####
#
# Bootstrap build: reproduces the original JP ROM byte-for-byte from a raw-ROM
# incbin baseline (asm/baserom.s), then progressively replaces incbin ranges
# with decompiled C (src/) and descriptively-named asm/data. Mirrors the
# toolchain of the sibling US decomp (../fireemblem8u).
#
# baserom.gba is NOT a build input: the build is self-contained (0 `.incbin
# "baserom.gba"`), so `make compare` builds from committed source and verifies
# `sha1sum -c checksum.sha1` (7da0456035366aa18414faa79d8fe7649f03c1ed). A local
# baserom.gba is needed ONLY for optional dev-only re-extraction, never to build.

#### Parallelism ####
# The build is per-object (`%.o: %.c/.s`) and embarrassingly parallel: a clean
# `make -j$(nproc)` is byte-identical to a serial build (verified) and ~6-8x faster
# (16-core: 54s vs ~6min). Default to a parallel build for EVERY invocation (local,
# sub-agent worktrees, CI) unless the caller already passed -j. The layout-generation
# step (asm/baserom.s + ldscript via gen_layout) is a proper prerequisite of the
# compile targets, so parallel ordering stays correct.
ifeq ($(filter -j%,$(MAKEFLAGS)),)
  NPROC := $(shell nproc 2>/dev/null || echo 4)
  MAKEFLAGS += -j$(NPROC)
endif

#### Tools ####

ifeq ($(OS),Windows_NT)
  EXE := .exe
else
  EXE :=
endif

UNAME := $(shell uname)

TOOLCHAIN ?= $(DEVKITARM)
PREFIX    ?= arm-none-eabi-
export PATH := $(TOOLCHAIN)/bin:$(PATH)

# Prefer arm-none-eabi-cpp if present, else the host cpp (agbcc headers come via
# -nostdinc -I tools/agbcc/include, so the host preprocessor is fine).
CPP     ?= $(shell command -v $(PREFIX)cpp$(EXE) 2>/dev/null || echo cpp)
AS      := $(PREFIX)as$(EXE)
LD      := $(PREFIX)ld$(EXE)
OBJCOPY := $(PREFIX)objcopy$(EXE)
STRIP   := $(PREFIX)strip$(EXE)

# agbcc (GCC 2.95 for ARM7TDMI). Installed locally into tools/agbcc (gitignored),
# same as the US decomp. Only needed once C decompilation begins.
CC1     := tools/agbcc/bin/agbcc$(EXE)
CC1_OLD := tools/agbcc/bin/old_agbcc$(EXE)
# The project agbcc (built by scripts/build_jp_agbcc.sh) carries a `-mjp-promote`
# target flag (D276c). DEFAULT-OFF it is byte-identical to stock agbcc, so the
# ~8077 normal TUs are unchanged. With `-mjp-promote` it (1) preserves sub-word
# type signedness in PROMOTE_MODE (s8/s16 -> sign-extend, not force-zero-extend)
# and (2) enables PROMOTE_FUNCTION_ARGS (declaration-order incoming-param
# extension). A subset of JP functions only byte-match under that behavior, so it
# is enabled PER-TU below via `CC1FLAGS += -mjp-promote` (one binary, not two).

# m4a sound-engine TUs were built with the old GBA SDK agbcc; their codegen
# shape (prologue, dead reg-inits) differs from the regular agbcc, so they
# only byte-match under old_agbcc (same as fe8u's `src/m4a.o: CC1 := CC1_OLD`).
src/ClearModM.o src/m4aSongNumStart.o src/m4aSongNumStop.o \
src/m4aSongNumContinue.o src/m4aSongNumStartOrChange.o \
src/m4aSongNumStartOrContinue.o src/m4aSoundInit.o src/MPlayExtender.o src/CgbSound.o src/m4aSoundMode.o src/MPlayContinue.o src/MPlayFadeOut.o src/m4aMPlayFadeOutTemporarily.o src/m4aMPlayFadeIn.o src/m4aMPlayImmInit.o src/m4aSoundVSyncOff.o src/m4aSoundVSyncOn.o src/MPlayStart.o src/FadeOutBody.o src/TrkVolPitSet.o src/CgbOscOff.o src/CgbModVol.o src/m4aMPlayTempoControl.o src/m4aMPlayModDepthSet.o src/m4aMPlayLFOSpeedSet.o src/ply_xwave.o src/ply_memacc.o src/fflush.o: CC1 := $(CC1_OLD)

# -mjp-promote per-TU overrides — functions that only byte-match under the JP
# promotion behavior: s8/s16-hold form (signedness preserved) and/or
# declaration-order arg extension (PROMOTE_FUNCTION_ARGS). One flag, one agbcc.
src/sub_800E5CC.o: CC1FLAGS += -mjp-promote
src/PutUnitSpriteIconsOam.o: CC1FLAGS += -mjp-promote
src/GMapScreen_UpdateScroll.o: CC1FLAGS += -mjp-promote
src/sub_8032CBC.o: CC1FLAGS += -mjp-promote
src/PrepareSineWaveScanlineBufExt.o: CC1FLAGS += -mjp-promote
src/sub_8085DDC.o: CC1FLAGS += -mjp-promote
src/sub_80B3564.o: CC1FLAGS += -mjp-promote
src/muctrl_0807C178.o: CC1FLAGS += -mjp-promote
src/NewEfxDarkGradoOBJ01piece.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxNaglfarOBJ.o: CC1FLAGS += -mjp-promote
src/NewEfxHitQuake.o: CC1FLAGS += -mjp-promote
src/banim-ekrdragon-utils_08072974.o: CC1FLAGS += -mjp-promote
src/banim-ekrgauge_08051FB8.o: CC1FLAGS += -mjp-promote
src/banim-main.o: CC1FLAGS += -mjp-promote
src/eventscr_0801060C.o: CC1FLAGS += -mjp-promote
src/EventA8_WmUnitMoveFree.o: CC1FLAGS += -mjp-promote
src/sub_80106A0.o: CC1FLAGS += -mjp-promote
src/uichapterstatus_0809020C.o: CC1FLAGS += -mjp-promote
src/EkrDragonBodyAnimeMain.o: CC1FLAGS += -mjp-promote
src/sub_8021A94.o: CC1FLAGS += -mjp-promote
src/StartEventWarpAnim.o: CC1FLAGS += -mjp-promote
src/muctrl_0807CA10.o: CC1FLAGS += -mjp-promote
src/bmunit_08017E7C.o: CC1FLAGS += -mjp-promote
src/sub_800FF08.o: CC1FLAGS += -mjp-promote
src/BlitU8TileMapData.o: CC1FLAGS += -mjp-promote
src/PrintDebugStringFmtAsOBJ.o: CC1FLAGS += -mjp-promote
src/LoadBattleSpritesForBranchScreen.o: CC1FLAGS += -mjp-promote
src/TsaModifyFirstPalReverse.o: CC1FLAGS += -mjp-promote
src/EfxTmCpyExt.o: CC1FLAGS += -mjp-promote
src/efxLunaOBJ_Loop_C.o: CC1FLAGS += -mjp-promote
src/EfxNoDamageYureMain.o: CC1FLAGS += -mjp-promote
src/EfxTriangleQUAKEMain.o: CC1FLAGS += -mjp-promote
src/efxLunaOBJ_Loop_B.o: CC1FLAGS += -mjp-promote
src/EventLoadUnitWithMovement.o: CC1FLAGS += -mjp-promote
src/EfxSRankWeaponEffectSCRMain.o: CC1FLAGS += -mjp-promote
src/efxIvaldiBG2_Loop.o: CC1FLAGS += -mjp-promote
src/sub_8056984.o: CC1FLAGS += -mjp-promote
src/sub_8048DC0.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxMaohFlashEyeROBJ2.o: CC1FLAGS += -mjp-promote
src/GmapLineFade_0.o: CC1FLAGS += -mjp-promote
src/GMScreenVSync_Loop.o: CC1FLAGS += -mjp-promote
src/SlotQueuePop.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxNaglfarOBJ2.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxMaohFlashEyeLOBJ2.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxMaohFlashEyeOBJ1.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxIvaldiOBJ1.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxIvaldiOBJ2.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxMaohFlashEyeFire1OBJ1.o: CC1FLAGS += -mjp-promote
src/StartSubSpell_efxMaohFlashEyeFire2OBJ1.o: CC1FLAGS += -mjp-promote
src/efxDarkGradoBG02_Loop_A.o: CC1FLAGS += -mjp-promote
src/AiGetUnitClosestValidPosition.o: CC1FLAGS += -mjp-promote
src/sub_800FAD0.o: CC1FLAGS += -mjp-promote
src/nonmatching/sub_807C8DC.o: CC1FLAGS += -mjp-promote
src/nonmatching/sub_807D3BC.o: CC1FLAGS += -mjp-promote
src/nonmatching/sub_8057F80.o: CC1FLAGS += -mjp-promote
src/nonmatching/sub_800A594.o: CC1FLAGS += -fno-rerun-cse-after-loop
src/nonmatching/sub_800A34C.o: CC1FLAGS += -fno-gcse
src/DivinationRankSpriteUpdate.o: CC1FLAGS += -fno-gcse
src/efxSPDQuake_Loop.o: CC1FLAGS += -mjp-promote
src/efxLunaOBJ_Loop_D.o: CC1FLAGS += -mjp-promote
src/efxHazymoonOBJ3_Loop.o: CC1FLAGS += -mjp-promote
src/EventShinningCursorAdvance.o: CC1FLAGS += -mjp-promote
src/EfxTmCpyExtHFlip.o: CC1FLAGS += -mjp-promote
src/UnitGetDeathDropLocation.o: CC1FLAGS += -mjp-promote
src/DrawPathArrow.o: CC1FLAGS += -mjp-promote
src/GmTmConfront_Loop_MoveUnitPositions.o: CC1FLAGS += -mjp-promote
src/EfxHpBarResire_SetAnotherSide.o: CC1FLAGS += -mjp-promote
src/EfxCircleWINMain.o: CC1FLAGS += -mjp-promote
src/banim-ekrdragon-demonking_0807A078.o: CC1FLAGS += -mjp-promote
src/banim-efxutils_08073D00.o: CC1FLAGS += -mjp-promote
src/EfxRestWINMain.o: CC1FLAGS += -mjp-promote
src/DrawNumberText_WithReset.o: CC1FLAGS += -mjp-promote
src/AddGorgonEggTrap.o: CC1FLAGS += -mjp-promote
src/UpdateLinkArenaMenuScrollBar.o: CC1FLAGS += -mjp-promote
src/AddPointToPathArrowProc.o: CC1FLAGS += -mjp-promote
src/DrawItemMenuLine.o: CC1FLAGS += -mjp-promote
src/DrawNumberText.o: CC1FLAGS += -mjp-promote
src/DrawTimeText.o: CC1FLAGS += -mjp-promote
src/DrawUiFrame2.o: CC1FLAGS += -mjp-promote
src/Text_DrawNumber.o: CC1FLAGS += -mjp-promote
src/Tactician_MoveHand.o: CC1FLAGS += -mjp-promote
src/_PutChapterTitleGfx.o: CC1FLAGS += -mjp-promote
src/DrawSupportScreenText.o: CC1FLAGS += -mjp-promote
src/DrawTimeText_WithReset.o: CC1FLAGS += -mjp-promote
src/DrawPrepScreenItems.o: CC1FLAGS += -mjp-promote
src/GetPointAlongPath.o: CC1FLAGS += -mjp-promote
src/DrawChapterTitleStrEx_jp.o: CC1FLAGS += -mjp-promote
src/GetMovementScriptFromPath.o: CC1FLAGS += -mjp-promote
src/GetEventTriggerId.o: CC1FLAGS += -mjp-promote
src/TsaModifyFirstPalMaybe.o: CC1FLAGS += -mjp-promote
src/Sio_RasterRotatedBoxToWinBuf.o: CC1FLAGS += -mjp-promote
src/FilterBattleAnimCharacterPalette.o: CC1FLAGS += -mjp-promote
src/PointInCameraBounds.o: CC1FLAGS += -mjp-promote
src/AiIsWithinRectDistance.o: CC1FLAGS += -mjp-promote
src/MoveUnitExt.o: CC1FLAGS += -mjp-promote
src/InitPlayConfig.o: CC1FLAGS += -mjp-promote
src/GmMuPrim_TrackMovementDelta.o: CC1FLAGS += -mjp-promote
src/GmMuPrim_GetMovementFacing.o: CC1FLAGS += -mjp-promote
src/ColorFadeTickThumb.o: CC1FLAGS += -mjp-promote
src/EventA7_WmUnitSetPosition.o: CC1FLAGS += -mjp-promote
src/MuCtr_StartMoveTowards.o: CC1FLAGS += -mjp-promote
src/MuCtr_InitDefinedMove.o: CC1FLAGS += -mjp-promote
src/MoveUnit_.o: CC1FLAGS += -mjp-promote
src/ChangeAiForPositions.o: CC1FLAGS += -mjp-promote
src/Event3F_ScriptBattle.o: CC1FLAGS += -mjp-promote
src/EventSetFogVisionExt.o: CC1FLAGS += -mjp-promote
src/Event88_WmScrollCameraOntoUnit.o: CC1FLAGS += -mjp-promote
src/Event86_WmScrollCamera.o: CC1FLAGS += -mjp-promote
src/ComputeBattleUnitAttack.o: CC1FLAGS += -mjp-promote
src/GmMuPrim_3.o: CC1FLAGS += -mjp-promote
src/CheckCanSummon.o: CC1FLAGS += -mjp-promote
src/ForEachPosAtSinglePosition.o: CC1FLAGS += -mjp-promote
src/GmFindPathRecursive.o: CC1FLAGS += -mjp-promote
src/GmFindPathThroughBlockedRecursive.o: CC1FLAGS += -mjp-promote
src/GmFindPath.o: CC1FLAGS += -mjp-promote
src/GmapRmUpdateExt_ScrollPosition.o: CC1FLAGS += -mjp-promote
src/savedraw_080AFE14.o: CC1FLAGS += -mjp-promote
src/sio_teamlist_0804421C.o: CC1FLAGS += -mjp-promote
src/sio_teamlist_080442A8.o: CC1FLAGS += -mjp-promote
src/worldmap_rm_080C7CA8.o: CC1FLAGS += -mjp-promote
src/worldmap_gmapunit_080BFAC8.o: CC1FLAGS += -mjp-promote
src/GmTmConfront_StartAnim.o: CC1FLAGS += -mjp-promote
src/bm_08015C38.o: CC1FLAGS += -mjp-promote
# Event25_ChangeMap: JP defers s16 chIndex sign-extension (PROMOTE) vs eager US.
src/eventscr_0800F390.o: CC1FLAGS += -mjp-promote
# ApplySepiaToPaletteBuffer: JP defers s16 Div-result sign-extension (asr) vs eager US (lsr).
src/code_8086934_08088B0C.o: CC1FLAGS += -mjp-promote
# AiFindTargetInReachByFunc: JP defers s16 ix/iy loop-index sign-extension vs eager US.
src/cp_utility_0803A99C.o: CC1FLAGS += -mjp-promote
# AiFindTargetInReachNeglectWallByFunc: JP defers s16 ix/iy loop-index sign-extension vs eager US.
src/cp_utility_0803AA9C.o: CC1FLAGS += -mjp-promote
# AiRandomMove: JP defers s16 ix/iy loop-index sign-extension vs eager US.
src/cp_utility_0803AB9C.o: CC1FLAGS += -mjp-promote
# AiTryMoveTowards: JP defers s16 ix/iy loop-index sign-extension vs eager US.
src/cp_utility_0803BA10.o: CC1FLAGS += -mjp-promote
# AiTryMoveTowardsNeglectWall: JP defers s16 ix/iy loop-index sign-extension vs eager US.
src/cp_utility_0803BBC0.o: CC1FLAGS += -mjp-promote
# AiBallistaRideExit: JP defers s16 x/y sign-extension vs eager US.
src/cp_0803E2F4_0803F7BC.o: CC1FLAGS += -mjp-promote

# Asset toolchain (Phase 0): vendored into the gitignored tools/<tool>/ via
# scripts/tools/<tool>/setup.sh (gbagfx FIRST, then bin2c, preproc). These turn
# committed PNG/.pal source into the raw GBA bytes the ROM contains, so graphics
# regions build from source instead of `.incbin "baserom.gba"`. See
# docs/tools/{gbagfx,bin2c,preproc}.md.
GBAGFX     := tools/gbagfx/gbagfx$(EXE)
# Exported so the BA1 compressing linker's compressor.py subprocess
# (scripts/compressor.py reads $GBAGFX) uses the same gbagfx as the rest of the
# build, even under `make GBAGFX=...` overrides. Mirrors ../fireemblem8u.
export GBAGFX
BIN2C      := tools/bin2c/bin2c$(EXE)
PREPROC    := tools/preproc/preproc$(EXE)
# Sound toolchain (Phase 1 Music): aif2pcm (AIFF -> raw GBA PCM sample) and
# mid2agb (.mid -> m4a song bytecode). Vendored via scripts/tools/<tool>/setup.sh.
AIF2PCM    := tools/aif2pcm/aif2pcm$(EXE)
MID2AGB    := tools/mid2agb/mid2agb$(EXE)
# gbagfx converts both tiles and palettes; PAL2GBAPAL aliases it for the .pal rule.
PAL2GBAPAL := $(GBAGFX)
# tmap2tsa (vendored from ../fireemblem8u/scripts): turns an editable .tmap tilemap
# into the ROM's .bin TSA (width/height-prefixed, line-reversed). Used by the
# explicit graphics/gmapunit/Tsa_Statscreen*.bin rules below.
TMAP2TSA   := scripts/tmap2tsa.py

# scaninc (vendored from ../fireemblem8u/tools/scaninc): scans a .s/.c for its
# .include/#include deps so editing an .inc rebuilds the dependent object. Used by
# the banim/%.o rule (BA1) to track include/banim_*.inc edits.
SCANINC    := tools/scaninc/scaninc$(EXE)

PYTHON  ?= python3

# FETSATOOL (ported from ../fireemblem8u/scripts/gfxtools/tsa_generator.py): turns
# a committed btl_bg .png into the ROM's TSA-encoded tiles (.feimg<N>.bin) +
# tilemap (.fetsa<N>.bin) so battle backgrounds build from an EDITABLE image
# instead of committed binary blobs. Needs python3 + numpy + Pillow.
FETSATOOL  := $(PYTHON) scripts/gfxtools/tsa_generator.py

# MARTOMAP (ported from ../fireemblem8u/scripts/mar_to_map.py): turns an editable
# chapter-map layout (.mar grid + .json metatile/dimension metadata) into the
# ROM's flat map tilemap (.bin), which the %.lz rule then compresses for incbin.
# Makes the 63 chapter maps build from editable sources instead of committed
# binary blobs (D309). Tile configs build from .S via the graphics/map/%.bin rule.
MARTOMAP   := $(PYTHON) scripts/mar_to_map.py

ifeq ($(UNAME),Darwin)
  SHASUM := shasum
else
  SHASUM := sha1sum
endif

CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g
# agb_sram fast-SRAM routines byte-match only at -O1 (same as fe8u's `src/agb_sram.o`).
src/ReadSramFast_Core.o src/WriteSramFast.o src/VerifySramFast_Core.o src/agb_sram.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O1 -fhex-asm -ffix-debug-line -g
# sub_80A6C60 (JP-only augury bit-packing): JP build used -Os codegen (2 callee-saved
# regs, FC8 base held in r8, EEC reloaded per-use) — only -Os yields the byte-match.
src/sub_80A6C60.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -Os -fhex-asm -ffix-debug-line -g
# sub_80A73D4 (JP-only link-arena scoreboard renderer): same subsystem as sub_80A6C60,
# JP build cached column bases in callee-saved regs (-Os GCSE signature).
src/sub_80A73D4.o: CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -Os -fhex-asm -ffix-debug-line -g
# fflush (newlib libc.a fflush.o): old_agbcc codegen + non-interwork `pop {pc}` epilogue.
src/fflush.o: CC1FLAGS := -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g
# Spline_SetupChannels: JP defers s16 arg sign-extension (PROMOTE) vs eager US.
src/spline_0800BA5C.o: CC1FLAGS += -mjp-promote
src/spline_0800B4F0.o: CC1FLAGS += -mjp-promote
src/spline_0800B6C0.o: CC1FLAGS += -mjp-promote
src/sub_800C224.o: CC1FLAGS += -mjp-promote
src/eventscr_0800F4D0.o: CC1FLAGS += -mjp-promote
src/eventscr_0800F41C.o: CC1FLAGS += -mjp-promote
# LoadUnit_0: JP sign-extends s8 quiet/d params (asrs) vs eager-zero-extend US.
src/eventscr_0800F8D4.o: CC1FLAGS += -mjp-promote
# EventLoadUnitSliently: JP defers s16 count / s8 r3 extension (PROMOTE).
src/eventscr_0800F86C.o: CC1FLAGS += -mjp-promote
# Event2C_LoadUnits: JP signed-loads s16 unitLoadCount (ldrsh) (PROMOTE).
src/eventscr_0800FD04.o: CC1FLAGS += -mjp-promote
# Event01_End: JP defers s8 i loop-counter sign-extension (PROMOTE).
src/eventscr_0800D860.o: CC1FLAGS += -mjp-promote
# Text_DrawNumberOrSpace: JP s16 digit char (0x4F82) shifted-domain (asr #16) (PROMOTE).
src/text_08003FEC.o: CC1FLAGS += -mjp-promote
# SioWeaponSelectMenu_Draw: JP (s8)CanUnitUseWeapon sign-extension (asr) (PROMOTE).
src/sio_menudef_0804E670.o: CC1FLAGS += -mjp-promote
# SortMus: JP s8 loop counters held in the shifted (<<24) domain (PROMOTE).
src/mu_0807BFF4.o: CC1FLAGS += -mjp-promote
# AutoGenerateUnitdef/SetupAutoGeneratedUnitdefs: JP s8 x/y params + bitfields (PROMOTE).
src/AutoGenerateUnitdef.o: CC1FLAGS += -mjp-promote
# GenerateSummonUnitDef: JP short summonerNum/i hold sign-extended (PROMOTE).
src/mapanim_summon_0807D074.o: CC1FLAGS += -mjp-promote
# RefreshUnitStealInventoryInfoWindow: JP s8 stealable holds one sign-extension (PROMOTE).
src/unitinfowindow_08034C54.o: CC1FLAGS += -mjp-promote
# GetPathFromMovementScript: JP s8 i++ counter sign-extended (asrs not lsrs) -> PROMOTE.
src/GetPathFromMovementScript.o: CC1FLAGS += -mjp-promote
# EkrPalModifyUnused: JP (s16)start/(s16)end held sign-extended in shifted domain -> PROMOTE.
src/banim-efxutils_080736C4.o: CC1FLAGS += -mjp-promote
# RegisterEkrDragonStatusType: JP s16 gBanimValid loads sign-extended (ldrsh) -> PROMOTE.
src/banim-ekrdragon-myrrh_080730E4.o: CC1FLAGS += -mjp-promote

# BallistaRangeMenu_Draw: JP places arg2 (isAvailable) after the complex arg3
# (mapOut), keeping it in callee-saved r5 + using r6 as index temp -> PROMOTE
# flips the arg-evaluation tiebreak to match (declaration-order arg extension).
src/BallistaRangeMenu_Draw.o: CC1FLAGS += -mjp-promote

# ShopTryMoveHand: JP sign-extends the bool hscroll_en param (lsls#18;asrs#18)
# instead of zero-extending -> PROMOTE preserves sub-word signedness.
src/ShopTryMoveHand.o: CC1FLAGS += -mjp-promote

# WmMain_MoveCursor: s16 cursor coords held sign-extended (lsl#16;asr#16) ->
# PROMOTE preserves sub-word signedness for the (gGMData.ix >> 8) / 16 math.
src/worldmap_main_080BE2A8.o: CC1FLAGS += -mjp-promote
src/bmidoten_0801B2F4.o: CC1FLAGS += -mjp-promote
src/bmbattle_0802A38C.o: CC1FLAGS += -mjp-promote
src/prep_sallycir_08099CC0.o: CC1FLAGS += -mjp-promote
src/worldmap_effect_080C5F68.o: CC1FLAGS += -mjp-promote
src/monstergen_0807A710.o: CC1FLAGS += -mjp-promote
src/PutFaceChibi.o: CC1FLAGS += -mjp-promote
src/statscreen_0808B314.o: CC1FLAGS += -mjp-promote
src/GenerateBestMovementScript.o: CC1FLAGS += -mjp-promote
src/Sio_ReadPacket.o: CC1FLAGS += -mjp-promote
src/Loop6C_efxMagicQUAKE.o: CC1FLAGS += -mjp-promote
src/UnitKakudaiMain.o: CC1FLAGS += -mjp-promote
src/ParseBattleHitToBanimCmd.o: CC1FLAGS += -mjp-promote
src/StartEventBattle.o: CC1FLAGS += -mjp-promote
src/ColorFadeSetupFromBlack.o: CC1FLAGS += -mjp-promote
src/ColorFadeSetupFromColorToBlack.o: CC1FLAGS += -mjp-promote
src/ColorFadeSetupFromColorToWhite.o: CC1FLAGS += -mjp-promote
src/ColorFadeSetupFromWhite.o: CC1FLAGS += -mjp-promote
src/sub_8015188.o: CC1FLAGS += -mjp-promote
src/sub_8010CB4.o: CC1FLAGS += -mjp-promote

CPPFLAGS := -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef
ASFLAGS  := -mcpu=arm7tdmi -mthumb-interwork -I include -I .

#### Files ####

ROM      := fireemblem8.gba
ELF      := $(ROM:.gba=.elf)
MAP      := $(ROM:.gba=.map)
LDSCRIPT := ldscript.txt

CFILES      := $(wildcard src/*.c) $(wildcard src/data/*.c) $(wildcard src/data/map/*.c)
# DATA_INCBIN_CFILES: any src/data/<subdir>/*.c (depth >= 2, excluding map/ which
# has no INCBIN macros and is already in CFILES) compiled with preproc first so
# INCBIN_U8/INCBIN_U16/INCBIN_U32 expand before cpp sees them.  Mirror of the US
# DATA_SRC_C_OBJECTS rule.  Adding a new data-C subsystem under src/data/<new>/
# gets the preproc pipeline automatically -- no per-subsystem Makefile edit needed.
DATA_INCBIN_CFILES  := $(shell find src/data -mindepth 2 -name '*.c' -not -path '*/map/*' 2>/dev/null)
DATA_INCBIN_OBJECTS := $(DATA_INCBIN_CFILES:.c=.o)
# asm/baserom.s + asm/jp_syms.s are GENERATED from the layout/ manifests by
# scripts/gen_layout.py (gitignored, regenerated at build time). Manage them
# explicitly rather than via the wildcard, which would miss them on a fresh
# checkout (they don't exist until the first build regenerates them).
GENERATED_S := asm/baserom.s asm/jp_syms.s
# src/msg_data.c is GENERATED-AND-COMMITTED from the JP text source
# (texts/jp_texts.txt + textdefs + huffman tiebreaks) by scripts/texttools/msg_jp.py
# build-c. It re-Huffman-encodes the message block byte-identically as COMPILED C
# (3339 CompressedText_MSG arrays + gMsgHuffmanTable + gMsgTable), the same shape
# as the US src/msg_data.c -- so the bytes count as genuinely extracted data, not
# an opaque asm blob. Committed (like the US) so the src/*.c wildcard sees it on a
# fresh checkout with NO baserom dependency; editing texts/ regenerates it. See
# docs/text.md.
ASM_S_FILES := $(filter-out $(GENERATED_S),$(wildcard asm/*.s))
C_OBJECTS   := $(CFILES:.c=.o)
# Every committed asm/*.s is active source; generated layout glue is added explicitly.
ASM_OBJECTS := $(ASM_S_FILES:.s=.o) $(GENERATED_S:.s=.o)
# close_baserom_gaps.py may add committed asm/gap_*.s providers. Keep each
# generated object tied to the exact committed binary it includes.
GAP_ASM_S_FILES := $(wildcard asm/gap_*.s)
GAP_OBJECTS := $(GAP_ASM_S_FILES:.s=.o)
# SRC_S_OBJECTS: hand-written real-source assembly under src/ (e.g. libagbsyscall.s,
# the BIOS svc wrappers), like fe8u's src/*.s. Use git ls-files so the COMMITTED
# sources are picked up but the generated src/<fn>.s intermediates (from the src/*.c
# compile pipeline, uncommitted) are NOT double-counted. These count as matching-C.
SRC_S_FILES := $(shell git ls-files 'src/*.s' 2>/dev/null)
SRC_S_OBJECTS := $(SRC_S_FILES:.s=.o)

# --- D311 editable music: per-song mid2agb .s built from committed .mid ---------
# Each song is the descriptive m4a-bytecode .s that mid2agb emits from the original
# FE8 .mid; assembled and linked at its JP song address (with its voicegroup symbol
# bound to the JP voicegroup address via baseline_syms) it reproduces the JP ROM
# song body byte-for-byte (docs/sound.md, D311). sound/songs.mk holds the per-song
# mid2agb flags (one `%.s: %.mid` rule per converted song).
include sound/songs.mk
SONG_MIDS := $(wildcard sound/songs/midi/*.mid)
SONG_OBJECTS := $(SONG_MIDS:.mid=.o)

# --- D311 editable music: voicegroups as fe8u-style voice_* macro tables --------
# Each sound/voicegroups/voicegroup<NNN>.s is the descriptive voice_* instrument
# table (ported verbatim from ../fireemblem8u/sound/voicegroups/). Its embedded
# sample/voicegroup pointers are SYMBOLIC relocations (.4byte DirectSoundData_* /
# voicegroup*), which the linker resolves to the JP absolute addresses (the JP
# sample set + voicegroup layout are byte-identical to the US decomp's, so the
# instrument bytes + resolved pointers reproduce the JP ROM byte-for-byte). This
# replaces the opaque committed data/sound/voicegroup<NNN>.bin INCBIN with an
# editable, relocatable source -- baserom.gba is NOT in this chain (docs/sound.md).
VOICEGROUP_S := $(wildcard sound/voicegroups/*.s)
VOICEGROUP_OBJECTS := $(VOICEGROUP_S:.s=.o)

# --- D312 editable gSongTable: fe8u-style `song <label>,<player>,<unk>` array ----
# sound/song_table.s is the descriptive m4a `song` macro array (ported verbatim
# from ../fireemblem8u/sound/song_table.s -- all 1000 entries' labels + fields are
# byte-identical to the JP table). Each `.4byte \label` is a SYMBOLIC relocation to
# the per-song header symbol the linker resolves to its JP address (the .mid-built
# song .o symbols + 6 named aliases for the un-decompiled JP-only / placeholder
# songs). sound/songs/dummy_song.s is the 4-byte all-zero placeholder header at the
# end of the table (fe8u-ported). This replaces the opaque gSongTable .bin INCBIN
# with editable source -- baserom.gba is NOT in this chain (docs/sound.md, D312).
SONG_TABLE_OBJECTS := sound/song_table.o sound/songs/dummy_song.o

# BA1 battle-animation pipeline (fe8u-parity): a SINGLE pre-linked + per-resource
# LZ-compressed blob built from editable banim/*_motion.s + graphics/banim/*.png +
# *.agbpal by scripts/arm_compressing_linker.py (linker_script_banim.txt). It is
# placed at the JP banim base 0x08C02000 by ldscript.txt (carved_rom.tsv row) AND
# its symbol table is fed back into the final ROM link via -R $(BANIM_OBJECT).sym.o
# (the rest of the ROM references banim_*_script / sheet symbols). This replaces
# the opaque src/data/banimdata/data_banim.c INCBIN-of-.lz/.bin form with the
# editable .s source. baserom.gba is NOT in this chain.
BANIM_OBJECT := banim/data_banim.o


# --- S1 editable m4a engine tables: fe8u-style descriptive .s (was opaque .bin) ----
# sound/music_player_table.s   -- gMPlayTable rodata as symbolic `music_player` macro
#   entries (gMPlayInfo_* from baseline_syms + gMPlayTrack_* .bss it defines at the JP
#   base 0x03001DE0 via layout/carved_ram.d) -- replaces data/sound/gMPlayTable.bin.
# sound/programmable_wave_data.s -- the 11 programmable-wave samples (wave000-010)
#   .incbin'd from sound/programmable_wave_samples/*.pcm (region-same, fe8u-ported) --
#   replaces the data_08214004 residue incbin.
# sound/keysplit_tables.s      -- the (FE8-unused) keysplit byte table, region-same,
#   ported verbatim from fe8u -- split out of the old voicegroup092_ref .bin.
# All three are committed editable source; baserom.gba is NOT in this chain.
M4A_TABLE_OBJECTS := sound/music_player_table.o sound/programmable_wave_data.o sound/keysplit_tables.o

ALL_OBJECTS := $(C_OBJECTS) $(DATA_INCBIN_OBJECTS) $(ASM_OBJECTS) $(SRC_S_OBJECTS) $(SONG_OBJECTS) $(VOICEGROUP_OBJECTS) $(SONG_TABLE_OBJECTS) $(BANIM_OBJECT) $(M4A_TABLE_OBJECTS)

# --- NON_MATCHING staging (D26): readable C that DOCUMENTS a region-different
# function whose byte source is still asm/<fn>.s. PROVE-BUILDS ONLY -- NEVER
# linked into $(ELF), NEVER checksummed by `make compare`. `$(wildcard src/*.c)`
# above does NOT recurse into src/nonmatching/, so the oracle excludes these for
# free; and NONMATCH_OBJECTS is deliberately kept OUT of ALL_OBJECTS so $(ELF)
# and `compare` can never see them. See docs/nonmatching.md.
NONMATCH_CFILES  := $(wildcard src/nonmatching/*.c)
NONMATCH_OBJECTS := $(NONMATCH_CFILES:.c=.o)

#### Targets ####

all: $(ROM)
	@$(SHASUM) -c checksum.sha1

# `make compare` is the build's only test: SHA-1 of the built ROM vs the original.
compare: $(ROM)
	$(SHASUM) -c checksum.sha1

#### Shiftability harness (scripts/shiftcheck/) ####
# Detects hardcoded pointers (raw absolute addresses that bypass the symbol system)
# which would break if the ROM layout shifted. Entirely separate from the matching
# build: never touches $(ROM)/$(ELF)/compare. See scripts/shiftcheck/README.md.
#
# fe8j vs fe8u (D313): the CI gate is the STATIC layers only (build-addr audit +
# reloc-coverage + cross-resource offset). fe8u's Layer-2 differential shift is NOT
# applicable to fe8j's fully-packed, no-slack, absolute-NOLOAD-overlay ldscript, so
# shiftcheck-diff is a separate non-gating target (it exits with a clear "no slack"
# message). fe8j has no separate banim linker script on main yet, so fe8u's
# --banim-ldscript / BANIM_OBJECT plumbing is dropped (wire it when BA1 lands).
RELOCS_ELF   := fireemblem8_relocs.elf
SHIFTDIR     := build/shiftcheck
SHIFT        ?= 0x40000
SHIFT2       ?= 0x80000
SHIFTCHECK   := scripts/shiftcheck
# fe8j links $(ALL_OBJECTS) directly (no response file in the $(ELF) rule); the
# harness drives the relink through a generated response file so its command line
# cannot overflow the shell arg limit with ~8k objects.
OBJECTS_LST  := objects.lst

# Write the object list with GNU make's $(file ...) function, NOT `echo ... > $@`:
# fe8j's $(ALL_OBJECTS) expands to ~8900 objects / ~290 KB, which overflows the
# shell's single-argument limit (MAX_ARG_STRLEN, 128 KiB) and dies with "Argument
# list too long" -- the exact wall the `clean:` rule comment below documents.
# $(file ...) writes directly (no shell), so it is immune. Needs GNU make >= 4.0.
$(OBJECTS_LST): $(ALL_OBJECTS)
	$(file >$@,$(ALL_OBJECTS))
	@echo "wrote $@ ($(words $(ALL_OBJECTS)) objects)"

# Layer 0: audit hardcoded addresses in the build system (Makefile/ldscript).
shiftcheck-build:
	$(PYTHON) $(SHIFTCHECK)/scan_build_addrs.py --makefile Makefile \
	    --ldscript $(LDSCRIPT)

# Layer 1: relink with --emit-relocs, then flag ROM-pointer words with no relocation.
$(RELOCS_ELF): $(ALL_OBJECTS) $(OBJECTS_LST) $(LDSCRIPT) $(BANIM_OBJECT)
	LD='$(LD)' OBJECTS_LST='$(OBJECTS_LST)' \
	    $(SHIFTCHECK)/emit_relocs_link.sh $@ $(LDSCRIPT) -q -R $(BANIM_OBJECT).sym.o

shiftcheck-static: $(RELOCS_ELF) $(ROM) $(MAP)
	$(PYTHON) $(SHIFTCHECK)/scan_relocs.py --elf $(RELOCS_ELF) --gba $(ROM) \
	    --map $(MAP) --ref-elf $(ELF) --prefix $(PREFIX) \
	    --allowlist $(SHIFTCHECK)/allowlist.txt

# Layer 1b: flag relocations against the WRONG base symbol -- a stored pointer written
# "ResourceA + hardcoded offset" that lands in a different resource B (breaks if A is resized).
shiftcheck-offsets: $(RELOCS_ELF) $(ROM) $(MAP)
	$(PYTHON) $(SHIFTCHECK)/scan_offsets.py --elf $(RELOCS_ELF) --gba $(ROM) \
	    --map $(MAP) --ref-elf $(ELF) --prefix $(PREFIX)

# Layer 1c: reject false relocations in packed talk-table metadata words
# (u16 flag/msg/chapter pairs that can numerically look like ROM pointers).
shiftcheck-talk: $(RELOCS_ELF) $(ELF)
	$(PYTHON) $(SHIFTCHECK)/scan_talk_table_relocs.py --elf $(RELOCS_ELF) --ref-elf $(ELF)

# Layer 1d: reject source-level pointer-classification mistakes plus false ROM
# ABS32 decodes identified from the relocation-bearing final ELF: STT_FUNC
# interiors, zero-size semantic resources with huge addends, and proven packed
# AREA/header/compressed-stream scalar words.
shiftcheck-ptraudit: $(RELOCS_ELF) $(ELF)
	$(PYTHON) $(SHIFTCHECK)/audit_pointer_classification.py --elf $(ELF) \
	    --relocs-elf $(RELOCS_ELF) --fail-on-suspects

# Layer 1e: reject raw ROM-address-shaped numeric literals in linked C code.
# agbcc emits these as literal-pool words without R_ARM_ABS32, so the linked-ELF
# relocation scanners cannot see this class. Three narrow packed-value contexts
# are classified explicitly by the source scanner.
shiftcheck-codeliterals: $(OBJECTS_LST)
	$(PYTHON) $(SHIFTCHECK)/scan_code_rom_literals.py --objects-list $(OBJECTS_LST)

# Layer 1f: decode self-referential words in structureless opaque providers. Known
# LZ/PCM/orphan byte floors must match their narrow evidence manifest exactly; any
# new candidate or evidence drift is unresolved pointer debt and fails the real gate.
shiftcheck-selfrefs: $(RELOCS_ELF) $(ELF) $(ROM)
	$(PYTHON) scripts/audit_pointers.py --true-debt --gate

# Focused unit tests for the relocation scanners. Keep these in the normal gate:
# path-sensitive debug-section layouts must not change shiftcheck's ROM verdict.
shiftcheck-tests: $(RELOCS_ELF) $(ELF) $(ROM)
	$(PYTHON) -m unittest discover -s $(SHIFTCHECK) -p 'test_*.py'

# Layer 2: differential two-shift build (NON-gating; not applicable to fe8j's packed
# ROM -- exits with a clear "no slack" message). Kept for documentation parity.
shiftcheck-diff: $(ROM) $(MAP) $(OBJECTS_LST)
	LD='$(LD)' OBJCOPY='$(OBJCOPY)' OBJECTS_LST='$(OBJECTS_LST)' \
	    $(PYTHON) $(SHIFTCHECK)/diff_shift.py --base-gba $(ROM) --ldscript $(LDSCRIPT) \
	    --map $(MAP) --ref-elf $(ELF) --prefix $(PREFIX) --shifts $(SHIFT),$(SHIFT2) \
	    --outdir $(SHIFTDIR) --allowlist $(SHIFTCHECK)/allowlist.txt

# The CI gate (no emulator): build-system audit + reloc scan + cross-resource offsets
# + packed talk-table false-relocation scan + pointer-classification audit.
shiftcheck: shiftcheck-build shiftcheck-static shiftcheck-offsets shiftcheck-talk shiftcheck-ptraudit shiftcheck-codeliterals shiftcheck-selfrefs shiftcheck-tests

.PHONY: shiftcheck shiftcheck-build shiftcheck-static shiftcheck-offsets shiftcheck-talk shiftcheck-ptraudit shiftcheck-codeliterals shiftcheck-selfrefs shiftcheck-tests shiftcheck-diff

# The carve glue (ldscript.txt + asm/baserom.s + asm/jp_syms.s) is GENERATED from
# the layout/ manifests and is gitignored, so the build regenerates it whenever a
# manifest changes -- the monolith <name>.tsv OR any per-task fragment under
# <name>.d/. Per-task fragments are what let many carves run in parallel without
# conflicting on these shared generated files. (Grouped target: one gen_layout
# run produces all three; needs GNU make >= 4.3.)
#
# The inputs include the per-task fragment files AND their .d directories: a
# directory's mtime changes when a fragment is added OR REMOVED, so a fragment
# DELETION (e.g. a carve revert) also triggers a regenerate -- a plain file
# wildcard cannot notice deletions. gen_layout.py writes each output only when its
# content actually changes (write_if_changed), so an unchanged rebuild stays
# incremental (no needless downstream relink).
GEN_LAYOUT_INPUTS := scripts/gen_layout.py ldscript.template.txt \
	$(wildcard layout/carved_rom.tsv    layout/carved_rom.d    layout/carved_rom.d/*.tsv) \
	$(wildcard layout/carved_ram.tsv    layout/carved_ram.d    layout/carved_ram.d/*.tsv) \
	$(wildcard layout/baseline_syms.tsv layout/baseline_syms.d layout/baseline_syms.d/*.tsv)

$(LDSCRIPT) $(GENERATED_S) &: $(GEN_LAYOUT_INPUTS)
	$(PYTHON) scripts/gen_layout.py

# `make layout` stays as a manual force-regenerate alias (e.g. for carve scripts).
layout:
	$(PYTHON) scripts/gen_layout.py

# --- JP message text (Huffman-compressed) -----------------------------------
# Regenerate src/msg_data.c from the committed bracket-annotated JP text whenever
# the text source changes. msg_jp.py build-c re-Huffman-encodes the block as
# COMPILED C (byte-identical to ROM after link). The file is committed (the src/*.c
# wildcard must see it on a fresh checkout); this rule keeps it in sync when texts/
# change. It does NOT read baserom.gba -- the block is producible from committed
# source. See docs/text.md.
TEXT_TOOLS  := scripts/texttools
MSG_JP      := $(PYTHON) $(TEXT_TOOLS)/msg_jp.py
MSG_SOURCES := texts/jp_texts.txt texts/jp_textdefs.txt texts/jp_huffman_tiebreaks.txt

src/msg_data.c: $(MSG_SOURCES) $(TEXT_TOOLS)/msg_jp.py
	$(MSG_JP) build-c

# Convenience: verify the rebuilt block is byte-identical to baserom.gba (dev only).
text-verify:
	$(MSG_JP) verify

# Build the IDA Pro reverse-engineering database (tools/ida/fe8j.i64) from the
# 32-bit ARM ELF, for the headless Hex-Rays decompiler MCP. Needs the local
# idalib venv (which has the `idapro` module). See docs/reverse-engineering.md.
# Re-run after meaningful decomp progress to refresh symbols.
IDA_PY ?= $(HOME)/ida-mcp-venv/bin/python
ida-db: $(ELF)
	$(IDA_PY) scripts/ida/build_ida_db.py

# Build the cached Ghidra project (the open-source second-opinion decompiler).
# One-time and slow; see docs/reverse-engineering.md. Needs JDK 21 + Ghidra
# (installed under ~/ghidra-tools) — paths are set in scripts/ghidra/ghidra_env.sh.
ghidra-db: $(ELF)
	scripts/ghidra/build_ghidra_project.sh

# Refresh Copilot CLI's isolated copy of the Ghidra project (fe8j -> fe8j-cp) so
# Claude and Copilot can run their `ghidra` MCP servers concurrently without
# contending on the project's exclusive lock. Run after `ghidra-db`. See
# docs/reverse-engineering.md and docs/decisions.md (D18).
ghidra-cp:
	scripts/ghidra/clone_copilot_project.sh

.PHONY: all compare clean check check-nonmatching nonmatching layout ida-db ghidra-db ghidra-cp

# NOTE: baserom.gba is NO LONGER a build input. Every ROM byte is produced from committed
# source (matching C, descriptive asm, extracted assets, committed data/*.bin). asm/baserom.s
# is generated empty (0 incbins). baserom.gba is kept ONLY as the verification reference and
# the source for one-time asset re-extraction (scripts/extract_*). `make` builds with it absent.

$(ASM_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@

ifneq ($(strip $(GAP_OBJECTS)),)
$(GAP_OBJECTS): asm/gap_%.o: data/residual/gap_%.bin
endif

# Hand-written real-source assembly under src/ (libagbsyscall, BIOS svc wrappers).
$(SRC_S_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@

# D311 song objects: the mid2agb-generated .s (built by the per-song %.s: %.mid
# rules in sound/songs.mk) assembled with MPlayDef.s on the include path (ASFLAGS
# already has -I include). The .s is a generated intermediate; keep it (do not
# auto-delete) so a clean tree shows the descriptive assembly form.
$(SONG_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@
.PRECIOUS: sound/songs/midi/%.s

# D311 voicegroup objects: the hand-ported voice_* macro tables (committed source,
# no generated intermediate). music_voice.inc is found via ASFLAGS -I . include path.
$(VOICEGROUP_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@

# D312 song table + dummy_song placeholder: committed descriptive .s assembled
# with m4a.inc / MPlayDef.s on the include path (ASFLAGS already has -I . -I include).
$(SONG_TABLE_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@

#### Battle animation recipes (BA1, fe8u-parity) ####
# The compressing linker lays every banim resource end-to-end at base 0x08C02000
# in linker_script_banim.txt order, LZ-compressing per the `>lz` flag, and emits
# one ELF object (banim/data_banim.o) + its symbols-only sidecar (.sym.o). Its
# prerequisites are produced dynamically by the `-m` mode (every `obj` field of the
# linker script: the sheet .4bpp.lz, .agbpal.lz, oam .bin.lz, motion .o, modes .bin)
# so make builds each via its own pattern rule first. Mirrors ../fireemblem8u.
$(BANIM_OBJECT): $(shell $(PYTHON) ./scripts/arm_compressing_linker.py -t linker_script_banim.txt -m)
	$(PYTHON) ./scripts/arm_compressing_linker.py -o $@ -t linker_script_banim.txt -b 0x8c02000 -l $(LD) --objcopy $(OBJCOPY) -c ./scripts/compressor.py

# Extract a flat section from an assembled motion object (one objcopy per section).
# Three separate pattern rules -- NOT a grouped target: each objcopy -j emits a
# single file, so make runs the right one(s) on demand. Mirrors ../fireemblem8u.
%_modes.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.modes $< $@

%_oam_l.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_l $< $@

%_oam_r.bin: %_motion.o
	$(OBJCOPY) -O binary -j .data.oam_r $< $@

# Assemble a banim motion .s; scaninc tracks the three .include "../include/banim_*.inc"
# so editing a macro rebuilds the motion objects. (-I "" so the relative ../include
# path in the .s resolves; ASFLAGS already carries -I include -I .)
ifeq ($(NODEP),1)
banim/%.o:    banim_dep :=
else
banim/%.o:    banim_dep = $(shell $(SCANINC) -I include -I "" banim/$*.s)
endif
.SECONDEXPANSION:
banim/%.o: banim/%.s $$(banim_dep)
	$(AS) $(ASFLAGS) -g $< -o $@

# S1 m4a engine tables: music_player_table.s (.include asm/macros/m4a.inc),
# programmable_wave_data.s (.incbin .pcm), keysplit_tables.s. Committed descriptive
# .s assembled with the include path already set in ASFLAGS (-I . -I include).
$(M4A_TABLE_OBJECTS): %.o: %.s
	$(AS) $(ASFLAGS) -g $< -o $@

#### Sound asset rules (Phase 1 Music) ####
# Turn committed AIFF (.aif) sample source into the raw GBA direct-sound PCM
# blob (.bin) via the vendored aif2pcm. The live
# src/data/sound_pcm/direct_sound_data.c provider includes the rebuilt .bin, so
# the 3.27 MB sample section reproduces byte-for-byte without baserom.gba. The
# generated object prerequisites live in layout/data_incbin_deps.mk.
#
#   foo.aif (committed) --aif2pcm--> foo.bin --INCBIN_U8--> direct_sound_data.o
#
# A `.aif` with no recipe stops make from trying to "rebuild" the committed source.
%.aif: ;
sound/%.bin: sound/%.aif
	$(AIF2PCM) $< $@

#### Asset (graphics) rules ####
# Generic source-asset pipeline, ported from ../fireemblem8u. These turn the
# COMMITTED editable source (PNG / JASC .pal) into the raw GBA bytes the ROM
# contains, via the vendored gbagfx (scripts/tools/gbagfx/setup.sh). The build
# intermediates (*.4bpp *.8bpp *.gbapal *.lz *.rl) are gitignored and regenerated.
#
#   png (committed) --4bpp--> .4bpp --lz--> .4bpp.lz --.incbin--> object --> ROM
#
# baserom.gba is NEVER in this chain: an asset region built this way reproduces
# byte-for-byte with baserom removed (the Phase-0 self-containment goal).
#
# Bit depth is taken from the OUTPUT extension; -width is passed where a decode
# needs it (encode infers width from the PNG). LZ_FLAGS pins gbagfx's -mindist
# PER ASSET (1/2/3) so the recompressed bytes match the original FE8 compressor.
# A `.s` with no recipe and these stop make from trying to "rebuild" committed
# sources via a chain of implicit rules.
%.png: ;
%.pal: ;
# Committed editable map sources (D309): .mar/.json chapter-map layouts and .S tile
# configs have no recipe so make treats them as leaves (never tries to regenerate a
# committed source via an implicit chain).
%.mar: ;
graphics/map/%.S: ;

%.1bpp: %.png  ; $(GBAGFX) $< $@
%.4bpp: %.png  ; $(GBAGFX) $< $@
%.8bpp: %.png  ; $(GBAGFX) $< $@
%.gbapal: %.pal ; $(PAL2GBAPAL) $< $@
%.gbapal: %.png ; $(GBAGFX) $< $@
%.lz: % ; $(GBAGFX) $< $@ $(LZ_FLAGS)
%.rl: % ; $(GBAGFX) $< $@

# Statscreen TSAs built from editable .tmap tilemaps (fireemblem8u source), not
# committed .bin blobs. Per-file --width/--height (zero-based) match the ROM TSA
# dimensions; tmap2tsa output is byte-identical to the JP ROM (gated by make
# compare). The %.bin.lz chain then LZ-compresses these via the generic %.lz rule.
graphics/gmapunit/Tsa_StatscreenBG.bin: %.bin: %.tmap
	$(TMAP2TSA) $< $@ --width 29 --height 19

graphics/gmapunit/Tsa_StatscreenHalo.bin: %.bin: %.tmap
	$(TMAP2TSA) $< $@ --width 17 --height 6

graphics/gmapunit/Tsa_StatscreenEquipmentBG.bin: %.bin: %.tmap
	$(TMAP2TSA) $< $@ --width 15 --height 5

# --- FE6 SIO multiboot payload, built from source (mgfembp submodule) ----------
# asm/fe6sio.s (the FE8J link-arena FE6 SIO routines + ROM header) incbins
# fe6sio_payload.bin.lz: the LZ77-compressed FE6 multiboot program FE8 sends to a
# linked FE6 cartridge over SIO. fireemblem8u builds this payload FROM SOURCE via
# the mgfembp git submodule (StanHash/mgfembp, "Mysterious Gba Fire Emblem
# MultiBoot Payload") rather than committing the opaque blob -- so baserom.gba
# stays out of this chain and the payload is editable. mgfembp builds with its own
# agbcc variant (fetched by its installer) into mgfembp/mgfembp.bin
# (sha1 8a81a47d88f6b0a3f91c49784b9f7b317382abac, region-invariant); gbagfx then
# LZ-compresses it (-mindist 1, the original compressor's minimum match distance)
# to exactly the JP ROM's bytes. The explicit fe6sio_payload.bin.lz rule overrides
# the generic %.lz pattern so it sources mgfembp.bin, not a committed .bin.
#
# C_INCLUDE_PATH is unset for the sub-build: the build image exports it to point at
# agbcc's newlib headers for the main ROM compile, but it leaks into the host-gcc
# build of mgfembp's own tools (embed, gbagfx), pulling newlib's <stdio.h> and
# breaking the link against the host libc. mgfembp supplies agbcc headers via -I
# itself. CPP=cpp because arm-none-eabi-cpp may be absent.
mgfembp/tools/agbcc/bin/agbcc:
	cd mgfembp && env -u C_INCLUDE_PATH bash tools/install_agbcc.sh

mgfembp/mgfembp.bin: mgfembp/tools/agbcc/bin/agbcc FORCE
	env -u C_INCLUDE_PATH $(MAKE) -C mgfembp CPP=cpp PREFIX="$(PREFIX)" tools
	env -u C_INCLUDE_PATH $(MAKE) -C mgfembp CPP=cpp PREFIX="$(PREFIX)" mgfembp.bin

fe6sio_payload.bin.lz: mgfembp/mgfembp.bin
	$(GBAGFX) $< $@ -mindist 1

# asm/fe6sio.o incbins the freshly-built payload, so it must rebuild when the
# payload changes (the asm has no other recipe-level dependency on it).
asm/fe6sio.o: fe6sio_payload.bin.lz

FORCE:
.PHONY: FORCE

# Chapter map tilemaps (D309): an editable layout (.mar grid + .json metadata under
# graphics/map/layout/) is converted by MARTOMAP into the ROM's flat map .bin, which
# the %.lz rule then compresses for incbin. The 63 chapter maps build from these
# editable sources instead of committed binary blobs. The .bin lands at top-level
# graphics/map/ (not graphics/map/layout/) so it matches the JP INCBIN_U8 paths
# ("graphics/map/<name>.bin.lz") that const_data_chapter_maps already references.
# (../fireemblem8u keeps the .bin in layout/ next to the .mar; JP's incbins point at
# graphics/map/ so the rule output dir differs from fe8u -- intentional.)
graphics/map/%.bin: graphics/map/layout/%.mar
	$(MARTOMAP) $< $@

# Map tileset configuration (D309): assemble the editable .S (metatile/terrain
# macros, includes graphics/map/tile_config.inc + terrains.inc) to a flat binary,
# which the %.lz rule then compresses for incbin. Mirrors ../fireemblem8u Makefile
# lines 319-322. The 11 TileConfiguration*.bin build from these instead of committed
# blobs. A TileConfiguration name has a .S but no .mar, and a chapter-map name has a
# .mar but no .S, so the two graphics/map/%.bin pattern rules never both apply to the
# same target (no ambiguous double-match).
graphics/map/%.bin: graphics/map/%.S graphics/map/tile_config.inc graphics/map/terrains.inc
	$(AS) $(ASFLAGS) -g $< -o $(@:.bin=.o)
	$(OBJCOPY) -O binary $(@:.bin=.o) $@

# TSA battle-background graphics: an editable .png is converted by FETSATOOL into
# the ROM's deduplicated tile image (.feimg<N>.bin) + tilemap (.fetsa<N>.bin).
# Mirrors ../fireemblem8u Makefile lines 293-303. Per-asset --flip_y_indexes /
# --blank_tile_index / --pop_last_tile overrides live in graphics/btl_bg/btl_bg.mk
# (the same per-asset rules ../fireemblem8u keeps in graphics_file_rules.mk).
# `&:` grouped target (GNU make 4.3+): BOTH outputs come from ONE FETSATOOL run, so
# `make -j` never invokes the rule twice concurrently for the .feimg/.fetsa pair (which
# raced -> "Failed to read *.feimg3.bin" intermittently in parallel CI builds).
%.feimg1.bin %.fetsa1.bin &: %.png ; $(FETSATOOL) $< $*.feimg1.bin $*.fetsa1.bin
%.feimg2.bin %.fetsa2.bin &: %.png ; $(FETSATOOL) $< $*.feimg2.bin $*.fetsa2.bin
%.feimg3.bin %.fetsa3.bin &: %.png ; $(FETSATOOL) $< $*.feimg3.bin $*.fetsa3.bin
%.feimg4.bin %.fetsa4.bin &: %.png ; $(FETSATOOL) $< $*.feimg4.bin $*.fetsa4.bin

# OpAnim / IntelligentSystems TSA tilemaps, built from editable .png source via
# FETSATOOL (fireemblem8u graphics_file_rules.mk per-asset rules). These keep the
# JP Tsa_<name>.bin output name (the INCBIN target is the <name>.bin.lz produced by
# the generic %.lz rule), so the image-output arg names a throwaway .feimg<N>.bin
# only to select the dedup method (4 for OpAnim, 2 for IntelligentSystems). The
# per-asset --insert_indexes / --flip_y_indexes / --num_tiles flags are
# load-bearing (the generic %.fetsa4 rule's no-flag output does NOT byte-match);
# tmap output is byte-identical to the JP ROM (gated by make compare). The matching
# .feimg<N>.bin image side is the separate Img_<name> PNG chain (already built).
graphics/misc_gfx/Tsa_OpAnimWorldMap.bin: graphics/opanim/OpAnimWorldMap.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimWorldMap.feimg4.bin $@ --insert_indexes=0:23,511:1

graphics/misc_gfx/Tsa_OpAnimWorldMapFog.bin: graphics/opanim/OpAnimWorldMapFog.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimWorldMapFog.feimg4.bin $@ --blank_tile_index=255

graphics/misc_gfx/Tsa_OpAnimGenericCharacterBG.bin: graphics/misc_gfx/OpAnimGenericCharacterBG.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimGenericCharacterBG.feimg4.bin $@ --num_tiles=256 --insert_indexes=213:1 --padding=-1 --flip_y_indexes=16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,88,89,90,123,126,127,144,158,176,179,180,208,209,210,211,212,213,214,215,216,217,218,272,274,275,287,306,307,308,309,315,316,317,319,338,340,345,383,401,405,406,432,434,435,436,438,442,444,445,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,504,506,560,561,562,563,564,565,566,567,568,569,572,573,574,575,606,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639

graphics/misc_gfx/Tsa_OpAnimEphraim.bin: graphics/opanim/OpAnimEphraim.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimEphraim.feimg4.bin $@ --num_tiles=256 --insert_indexes=133:1

graphics/misc_gfx/Tsa_OpAnimEphraimBlur1.bin: graphics/misc_gfx/OpAnimEphraimBlur1.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimEphraimBlur1.feimg4.bin $@ --num_tiles=256 --insert_indexes=149:1

graphics/misc_gfx/Tsa_OpAnimEirika.bin: graphics/opanim/OpAnimEirika.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimEirika.feimg4.bin $@ --num_tiles=256 --insert_indexes=114:1

graphics/misc_gfx/Tsa_OpAnimEirikaBlur1.bin: graphics/misc_gfx/OpAnimEirikaBlur1.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimEirikaBlur1.feimg4.bin $@ --num_tiles=256 --insert_indexes=119:1

graphics/misc_gfx/Tsa_OpAnimEirikaBlur2.bin: graphics/misc_gfx/OpAnimEirikaBlur2.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimEirikaBlur2.feimg4.bin $@ --num_tiles=256 --insert_indexes=136:1

graphics/misc_gfx/Tsa_OpAnimEirikaBlur3.bin: graphics/misc_gfx/OpAnimEirikaBlur3.png
	$(FETSATOOL) $< $(@D)/Tsa_OpAnimEirikaBlur3.feimg4.bin $@ --num_tiles=256 --insert_indexes=161:1

graphics/misc_gfx3/Tsa_IntelligentSystems.bin: graphics/misc_gfx3/IntelligentSystems.png
	$(FETSATOOL) $< $(@D)/Tsa_IntelligentSystems.feimg2.bin $@

# .fk: FE "fake compression" -- a 4-byte LE header (total-size<<8, low byte 0 =
# uncompressed) followed by the raw bytes verbatim. Portrait tilesets (and similar
# graphics) are marked compressed in the ROM but stored raw under this header. The
# rule (matching ../fireemblem8u's `%.fk: % ; ./scripts/compressor.py $< fk`) is
# implemented inline so it needs no extra script.
%.fk: %
	$(PYTHON) -c "import sys,struct;d=open(sys.argv[1],'rb').read();open(sys.argv[2],'wb').write(struct.pack('<I',(len(d)+4)<<8)+d)" $< $@

# bin2c: emit a tiles blob as a C array header (used where a 4bpp must be a C
# `const` array rather than an incbin).
%.4bpp.h: %.4bpp
	$(BIN2C) $< $(subst .,_,$(notdir $<)) | sed 's/^const //' > $@

# --- PARALLEL-SAFE per-subsystem asset wiring (graphics/**/*.mk) -------------
# Per-asset -mindist pins and object->generated-asset dependencies used to live
# INLINE here, which made every graphics-extraction agent edit this one shared
# file -> merge conflicts. They now live in a TRACKED `*.mk` PER graphics
# subsystem (e.g. graphics/item_icon/item_icon.mk), auto-collected below. A new
# extraction batch adds a NEW file under its graphics/<subsystem>/ dir and never
# touches this Makefile -- so many graphics agents can run concurrently. Each
# .mk carries that subsystem's `LZ_FLAGS := -mindist N` overrides and its
# `asm/<file>.o: <generated assets>` deps. (find, not `wildcard graphics/**`,
# because GNU make does not expand the `**` globstar.)
GRAPHICS_MK := $(shell find graphics -name '*.mk' 2>/dev/null)
-include $(GRAPHICS_MK)
# src/data INCBIN objects -> their generated assets (clean-build ordering); see scripts/gen_data_incbin_deps.py
-include layout/data_incbin_deps.mk

# dat_fontgrp_data generates its 13 colour LUTs from this header via macros (it has
# no INCBIN, so gen_data_incbin_deps.py does not track it); name the #include so an
# edit to the LUT source triggers an incremental rebuild.
src/data/fontgrp_data/dat_fontgrp_data.o: src/data/fonts/color_lookup_tables.h

# DATA_INCBIN: src/data/**/*.c (any subdirectory, excluding map/) compiled with
# preproc first so INCBIN_U8/INCBIN_U16/INCBIN_U32 expand into .incbin directives
# before cpp sees them.  Mirror of the US DATA_SRC_C_OBJECTS rule.  These objects
# ARE in ALL_OBJECTS and are the live layout providers. A new subsystem under
# src/data/<new>/ automatically uses this recipe; no additional Makefile edit is
# required.
$(DATA_INCBIN_OBJECTS): %.o: %.c
	$(PREPROC) $< | $(CPP) $(CPPFLAGS) - | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $*.s
	printf '\t.text\n\t.align 2, 0\n' >> $*.s
	$(AS) $(ASFLAGS) $*.s -o $@
	@$(PYTHON) scripts/apply_patches.py $@

# C compile pipeline (agbcc): cpp -> iconv UTF-8->CP932 -> agbcc -> as.
# NONMATCH_OBJECTS reuse this exact recipe but are NOT in $(C_OBJECTS) /
# $(ALL_OBJECTS), so they compile under `make nonmatching` yet never link.
$(C_OBJECTS) $(NONMATCH_OBJECTS): %.o: %.c
	$(CPP) $(CPPFLAGS) $< | iconv -f UTF-8 -t CP932 | $(CC1) $(CC1FLAGS) -o $*.s
	printf '\t.text\n\t.align 2, 0\n' >> $*.s
	$(AS) $(ASFLAGS) $*.s -o $@
	@$(PYTHON) scripts/apply_patches.py $@

# --- NON_MATCHING staging target (D26) ---------------------------------------
# Compile the readable staging C purely to PROVE IT BUILDS. This target is NOT a
# dependency of $(ELF) or `compare`: NONMATCH_OBJECTS are absent from ALL_OBJECTS
# and the ldscript has no `*(.text)` catch-all, so a non-matching object cannot
# enter the oracle ROM. The byte source remains the existing asm/<fn>.s.
nonmatching: $(NONMATCH_OBJECTS)
	@echo "NON_MATCHING staging: PROVE-BUILDS ONLY -- compiled, NOT linked, NOT checksummed (oracle untouched)."

# Lint: every src/nonmatching/<fn>.c must have a committed byte source asm/<fn>.s
# (a readable staging body cannot exist for a function with no oracle byte source).
check-nonmatching:
	$(PYTHON) scripts/check_nonmatching.py

$(ELF): $(ALL_OBJECTS) $(LDSCRIPT)
	$(LD) --no-check-sections -T $(LDSCRIPT) -Map $(MAP) -o $@ $(ALL_OBJECTS) -R $(BANIM_OBJECT).sym.o -L tools/agbcc/lib -lc -lgcc

%.gba: %.elf
	$(OBJCOPY) --strip-debug -O binary --pad-to 0x9000000 --gap-fill=0xff $< $@

clean:
	# Remove EVERY .o under asm/ and src/ (recursively, incl. src/data/ and the
	# src/nonmatching/ staging objects) via `find` -- this also clears ORPHAN .o whose .s was
	# deleted by a carve (a wildcard-only clean would keep them and the local build false-greens
	# while CI's fresh checkout fails). `find` is COUNT-SAFE. Do NOT name the full object-list
	# variable here: make expands it even inside a recipe comment, and once the carve grows past
	# a few thousand objects that single expanded argument overflows the shell per-arg limit
	# (MAX_ARG_STRLEN, 128 KiB) and `make clean` dies with "Argument list too long".
	# NOTE: only *.o -- never `find -name '*.s'`: asm/*.s are the COMMITTED descriptive-asm sources.
	find asm src -name '*.o' -type f -delete
	$(RM) $(ROM) $(ELF) $(MAP) $(CFILES:.c=.s) $(DATA_INCBIN_CFILES:.c=.s) $(GENERATED_S) $(LDSCRIPT)
	$(RM) $(NONMATCH_CFILES:.c=.s)
	# Shiftability harness artifacts (scripts/shiftcheck/): the relinked relocs ELF +
	# its map, the link response file, and the shifted-build scratch dir.
	$(RM) $(RELOCS_ELF) $(RELOCS_ELF:.elf=.map) $(OBJECTS_LST)
	$(RM) -r $(SHIFTDIR)
	# D311 editable music: the song .o and the mid2agb-generated .s are gitignored
	# build outputs (the committed source is the .mid). Remove them so a clean tree
	# rebuilds them from the .mid via the sound/songs.mk %.s: %.mid rule.
	$(RM) $(SONG_OBJECTS) $(SONG_MIDS:.mid=.s)
	# Regenerated asset build intermediates (committed source is PNG/.pal; these
	# are rebuilt by the %.4bpp/%.lz/... rules). Delete ONLY gitignored ones --
	# `git clean -Xf` removes solely ignored files, so a COMMITTED asset such as
	# graphics/debug_font.4bpp.h (the hand-committed C array #included by
	# src/fontgrp.c) is preserved. A bare `find -name '*.4bpp.h' -delete` would
	# wrongly nuke it and break the build. Falls back to nothing outside a git tree.
	@git clean -Xf -- 'graphics/**/*.1bpp' 'graphics/**/*.4bpp' 'graphics/**/*.8bpp' \
		'graphics/**/*.gbapal' 'graphics/**/*.lz' 'graphics/**/*.rl' 'graphics/**/*.fk' 'graphics/**/*.4bpp.h' \
		'graphics/**/*.feimg*.bin' 'graphics/**/*.fetsa*.bin' \
		'graphics/*.1bpp' 'graphics/*.4bpp' 'graphics/*.8bpp' 'graphics/*.gbapal' \
		'graphics/*.lz' 'graphics/*.rl' 'graphics/*.fk' 'graphics/*.4bpp.h' >/dev/null 2>&1 || true
	# Sound build intermediates (committed source is .aif; .bin rebuilt by aif2pcm).
	# Gitignored, so `git clean -Xf` removes only them and never a committed .aif.
	@git clean -Xf -- 'sound/**/*.bin' >/dev/null 2>&1 || true
	# BA1 battle-animation intermediates: the motion .o, the objcopy-extracted
	# .bin (oam_l/oam_r/modes) + their .lz, and the compressing-linker outputs
	# banim/data_banim.o(.sym.o). All gitignored (committed source is banim/*.s),
	# so `git clean -Xf` removes only them and never a committed *_motion.s.
	# (The top-level `find asm src -name '*.o'` above does NOT reach banim/.)
	@git clean -Xf -- 'banim/*.o' 'banim/*.bin' 'banim/*.lz' 'banim/*.bak' >/dev/null 2>&1 || true

# Fast repo-consistency lint (no toolchain / no ROM needed): every object the build links
# has a git-tracked source. Catches the "layout row without a committed .s/.c" class that
# builds locally (stale .o) but fails CI's fresh checkout. Also enforced in CI.
check:
	$(PYTHON) scripts/check_layout.py
	$(PYTHON) scripts/check_no_empty_files.py

# Keep chained asset intermediates (e.g. the .4bpp produced en route from PNG to
# .4bpp.lz) instead of letting make treat them as deletable intermediates and
# rebuild them on every invocation.
.SECONDARY:
src/sub_80707BC.o: CC1FLAGS += -mjp-promote
src/eventscr_0800DD9C.o: CC1FLAGS += -mjp-promote
src/sub_800E11C.o: CC1FLAGS += -mjp-promote
src/sub_800DC40.o: CC1FLAGS += -mjp-promote

src/sub_800B88C.o: CC1FLAGS += -mjp-promote

src/efxLunaSCR_Loop.o: CC1FLAGS += -mjp-promote

src/UnitList_PutRow.o: CC1FLAGS += -mjp-promote
src/LoadClassReelFontPalette.o: CC1FLAGS += -mjp-promote
src/ProcCmd_CALL_ROUTINE_ARG.o: CC1FLAGS += -mjp-promote
src/StartSqMask.o: CC1FLAGS += -mjp-promote
src/DrawDifficultySprites_Loop.o: CC1FLAGS += -mjp-promote
src/PutTmSized.o: CC1FLAGS += -mjp-promote
src/AddAttr2dBitMap.o: CC1FLAGS += -mjp-promote
src/sub_8048FC0.o: CC1FLAGS += -fno-strength-reduce
src/sub_801FAA0.o: CC1FLAGS += -fno-strength-reduce
