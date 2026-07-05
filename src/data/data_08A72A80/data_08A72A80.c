#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_08A72A80 (stat-screen / help-box).
 *
 * Four opaque proc scripts inside the `.data.residue.08A72A80` blob are decoded
 * (structure ported from fe8u src/statscreen.c, pointers resolved against the JP
 * ELF) into typed `struct ProcCmd NAME[]` in their OWN 4-aligned
 * `.rodata.dat_NAME_ref` sections at their exact JP addresses:
 *   - gProcScr_SSBgOffsetCtrl  (2 ProcCmd)  @0x08A72A80
 *   - gProcScr_StatScreen      (24 ProcCmd) @0x08A72A90
 *   - gProcScr_HelpBox         (7 ProcCmd)  @0x08A72B50
 *   - gProcScr_HelpBoxMoveCtrl (6 ProcCmd)  @0x08A72B88
 * These names are provided by the residue slice directly (NOT via baseline
 * jp_syms), so no drop file is needed -- removing the .s and adding the typed
 * defs keeps the symbols. gProcScr_StatScreen START_CHILD/END_EACHes its sibling
 * ctrl scripts (gProcScr_SSGlowyBlendCtrl / _SSPageNameCtrl / _SSPageNumCtrl /
 * _SSBgOffsetCtrl) by DIRECT symbol (data pointer, no Thumb bit, not base+offset
 * -> no shiftcheck HIGH). The blob was previously labelled "region-diff" only in
 * the byte-completeness (INCBIN) sense: its pointer *values* differ from US so
 * it cannot be raw-INCBIN'd -- but the *structure* is identical to fe8u, so
 * symbolization reproduces the exact JP bytes. FUNC targets are bare (ld ORs the
 * Thumb bit). The ONLY correctness oracle is `make compare` (sha1).
 */

extern void BgOffCtrl_OnLoop();
extern void StatScreen_BlackenScreen();
extern void BMapDispSuspend();
extern void StatScreen_InitDisplay();
extern void StartGreenText();
extern void StatScreen_Display();
extern void StatScreen_ResumeFromHelp();
extern void StatScreen_OnIdle();
extern void StatScreen_OnClose();
extern void BMapDispResume();
extern void EndAllMus();
extern void EndGreenText();
extern void HelpBox_OnOpen();
extern void HelpBox_OnLoop();
extern void HelpBox_OnClose();
extern void HelpBox_WaitClose();
extern void HbMoveCtrl_OnInitBox();
extern void HbMoveCtrl_OnIdle();
extern void CloseHelpBox();

/* Sibling ctrl scripts (in an earlier object) referenced by direct symbol. */
extern struct ProcCmd gProcScr_SSGlowyBlendCtrl[];
extern struct ProcCmd gProcScr_SSPageNameCtrl[];
extern struct ProcCmd gProcScr_SSPageNumCtrl[];

struct ProcCmd gProcScr_SSBgOffsetCtrl[] __attribute__((section(".rodata.dat_gProcScr_SSBgOffsetCtrl_ref"))) = {
    PROC_REPEAT(BgOffCtrl_OnLoop),
    PROC_END,
};

struct ProcCmd gProcScr_StatScreen[] __attribute__((section(".rodata.dat_gProcScr_StatScreen_ref"))) = {
    PROC_CALL(StatScreen_BlackenScreen),
    PROC_CALL(BMapDispSuspend),
    PROC_SLEEP(2),
    PROC_CALL(StatScreen_InitDisplay),
    PROC_CALL(StartGreenText),
    PROC_CALL(StatScreen_Display),
    PROC_START_CHILD(gProcScr_SSGlowyBlendCtrl),
    PROC_START_CHILD(gProcScr_SSPageNameCtrl),
    PROC_START_CHILD(gProcScr_SSPageNumCtrl),
    PROC_START_CHILD(gProcScr_SSBgOffsetCtrl),
    PROC_GOTO(1),
    PROC_LABEL(0),
    PROC_CALL(StatScreen_ResumeFromHelp),
    PROC_LABEL(1),
    PROC_SLEEP(2),
    PROC_REPEAT(StatScreen_OnIdle),
    PROC_LABEL(10),
    PROC_SLEEP(2),
    PROC_END_EACH(gProcScr_SSGlowyBlendCtrl),
    PROC_CALL(StatScreen_OnClose),
    PROC_CALL(BMapDispResume),
    PROC_CALL(EndAllMus),
    PROC_CALL(EndGreenText),
    PROC_END,
};

struct ProcCmd gProcScr_HelpBox[] __attribute__((section(".rodata.dat_gProcScr_HelpBox_ref"))) = {
    PROC_SLEEP(0),
    PROC_CALL(HelpBox_OnOpen),
    PROC_REPEAT(HelpBox_OnLoop),
    PROC_LABEL(0x63),
    PROC_CALL(HelpBox_OnClose),
    PROC_REPEAT(HelpBox_WaitClose),
    PROC_END,
};

struct ProcCmd gProcScr_HelpBoxMoveCtrl[] __attribute__((section(".rodata.dat_gProcScr_HelpBoxMoveCtrl_ref"))) = {
    PROC_SLEEP(1),
    PROC_LABEL(0),
    PROC_CALL(HbMoveCtrl_OnInitBox),
    PROC_REPEAT(HbMoveCtrl_OnIdle),
    PROC_CALL(CloseHelpBox),
    PROC_END,
};
