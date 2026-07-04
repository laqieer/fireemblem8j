#include "global.h"
#include "proc.h"

/* #143 shiftability: gProcScr_SupportScreen @ JP 0x08A95B70 (28 ProcCmd, 224 B)
 * and gProcScr_SupportUnitSubScreen @ 0x08A95C94 (41 ProcCmd, 328 B) were buried
 * inside the raw INCBIN blob frontier_df4_menu_021_A95B4E (.data.frontier_df4_menu
 * .gap21). Their interior code pointers were raw un-relocated words that bx into
 * the pre-shift gap on the +0x40000 shifted ROM. Typed here as struct ProcCmd[]
 * so every pointer becomes an R_ARM_ABS32 relocation.
 *
 * The gap21 blob base 0x08A95B4E is only 2-aligned, so an in-place split would
 * force struct-align-4 padding and desync every following byte. Instead each table
 * is carved into its OWN 4-aligned .rodata section that the layout places at its
 * exact address (A95B70 / A95C94); the surrounding data stays as three INCBIN
 * slices in frontier_df4_menu.c (gap21 head 0x22 / gap21b mid 0x44 / gap21c tail
 * 0x680). Contiguous 0x22 -> 0xE0 -> 0x44 -> 0x148 -> 0x680 = 0x90E, byte-exact.
 * REGION_SAME structure; make compare (sha1) is the only oracle. */

extern void SupportScreen_SetupUnits(ProcPtr proc);
extern void SupportScreen_OnInit(ProcPtr proc);
extern void SupportScreen_SetupGraphics(ProcPtr proc);
extern void IsMusicProc2Running(ProcPtr proc);
extern void StartMidFadeFromBlack(ProcPtr proc);
extern void WaitForFade(ProcPtr proc);
extern void MusicProc4Exists(ProcPtr proc);
extern void SupportScreen_UpdateBlend(ProcPtr proc);
extern void SupportScreen_Loop_KeyHandler(ProcPtr proc);
extern void NewFadeOut(ProcPtr proc);
extern void FadeOutExists(ProcPtr proc);
extern void SupportScreen_OnEnd(ProcPtr proc);
extern void SupportScreen_StartUnitSubMenu(ProcPtr proc);
extern void SupportScreen_RestartSourceScreenMusic(ProcPtr proc);
extern void StartMidFadeToBlack(ProcPtr proc);

extern void SupportSubScreen_Init(ProcPtr proc);
extern void SupportSubScreen_SetupGraphics(ProcPtr proc);
extern void NewFadeIn(ProcPtr proc);
extern void FadeInExists(ProcPtr proc);
extern void SupportSubScreen_Loop_KeyHandler(ProcPtr proc);
extern void SupportSubScreen_PrepareSupportConvo(ProcPtr proc);
extern void SupportSubScreen_OnEnd(ProcPtr proc);
extern void SupportSubScreen_StartSupportConvo(ProcPtr proc);
extern void EventEngineExists(ProcPtr proc);
extern void SupportSubScreen_RestoreBgm(ProcPtr proc);
extern void SupportSubScreen_StartSwapPage(ProcPtr proc);
extern void SupportSubScreen_SwapPageOut_ToLeft(ProcPtr proc);
extern void SupportSubScreen_ReinitAfterSwapPage(ProcPtr proc);
extern void SupportSubScreen_SwapPageIn_FromRight(ProcPtr proc);
extern void SupportSubScreen_EndSwapPage(ProcPtr proc);
extern void SupportSubScreen_SwapPageOut_ToRight(ProcPtr proc);
extern void SupportSubScreen_SwapPageIn_FromLeft(ProcPtr proc);

struct ProcCmd gProcScr_SupportScreen[] __attribute__((section(".rodata.dat_ProcScr_SupportScreen_ref"))) = {
    PROC_SLEEP(0), PROC_CALL(SupportScreen_SetupUnits), PROC_CALL(SupportScreen_OnInit), PROC_SLEEP(0),
    PROC_LABEL(0), PROC_CALL(SupportScreen_SetupGraphics), PROC_WHILE(IsMusicProc2Running),
    PROC_CALL(StartMidFadeFromBlack), PROC_REPEAT(WaitForFade), PROC_WHILE(MusicProc4Exists),
    PROC_LABEL(1), PROC_CALL(SupportScreen_UpdateBlend), PROC_REPEAT(SupportScreen_Loop_KeyHandler),
    PROC_GOTO(1), PROC_LABEL(2), PROC_CALL_ARG(NewFadeOut, 8), PROC_WHILE(FadeOutExists),
    PROC_CALL(SupportScreen_OnEnd), PROC_CALL(SupportScreen_StartUnitSubMenu), PROC_SLEEP(0), PROC_GOTO(0),
    PROC_LABEL(3), PROC_CALL(SupportScreen_RestartSourceScreenMusic), PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade), PROC_CALL(SupportScreen_OnEnd), PROC_WHILE(IsMusicProc2Running), PROC_END,
}; /* 28 entries = 224B, ends 0xA95C50 */

struct ProcCmd gProcScr_SupportUnitSubScreen[] __attribute__((section(".rodata.dat_ProcScr_SupportUnitSubScreen_ref"))) = {
    PROC_SLEEP(0), PROC_CALL(SupportSubScreen_Init), PROC_LABEL(0), PROC_CALL(SupportSubScreen_SetupGraphics),
    PROC_CALL_ARG(NewFadeIn, 8), PROC_WHILE(FadeInExists), PROC_WHILE(MusicProc4Exists), PROC_LABEL(1),
    PROC_REPEAT(SupportSubScreen_Loop_KeyHandler), PROC_LABEL(2), PROC_CALL(SupportSubScreen_PrepareSupportConvo),
    PROC_CALL_ARG(NewFadeOut, 8), PROC_WHILE(FadeOutExists), PROC_CALL(SupportSubScreen_OnEnd), PROC_SLEEP(0),
    PROC_WHILE(MusicProc4Exists), PROC_CALL(SupportSubScreen_StartSupportConvo), PROC_SLEEP(0),
    PROC_WHILE(EventEngineExists), PROC_CALL(SupportSubScreen_RestoreBgm), PROC_SLEEP(8), PROC_GOTO(0),
    PROC_LABEL(4), PROC_CALL(SupportSubScreen_StartSwapPage), PROC_REPEAT(SupportSubScreen_SwapPageOut_ToLeft),
    PROC_CALL(SupportSubScreen_ReinitAfterSwapPage), PROC_REPEAT(SupportSubScreen_SwapPageIn_FromRight),
    PROC_CALL(SupportSubScreen_EndSwapPage), PROC_GOTO(1), PROC_LABEL(5), PROC_CALL(SupportSubScreen_StartSwapPage),
    PROC_REPEAT(SupportSubScreen_SwapPageOut_ToRight), PROC_CALL(SupportSubScreen_ReinitAfterSwapPage),
    PROC_REPEAT(SupportSubScreen_SwapPageIn_FromLeft), PROC_CALL(SupportSubScreen_EndSwapPage), PROC_GOTO(1),
    PROC_LABEL(3), PROC_CALL_ARG(NewFadeOut, 8), PROC_WHILE(FadeOutExists), PROC_CALL(SupportSubScreen_OnEnd), PROC_END,
}; /* 41 entries = 328B, ends 0xA95DDC */
