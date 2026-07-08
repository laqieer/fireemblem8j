#include "global.h"
#include "proc.h"


extern void BonusClaimHelp_Init();
extern void BonusClaimHelp_Loop();
extern void MixPalette_Loop();
extern void sub_80B33AC();

/* #148 proc-script decomp-completeness: data_08A9DCD4 (sysutil box/fade scripts).
 *
 * Five opaque proc scripts inside the `.data.residue.08A9DCD4` blob are decoded
 * (structure ported from fe8u src/sysutil.c, pointers resolved against the JP
 * ELF) into typed `struct ProcCmd NAME[]` in their OWN 4-aligned
 * `.rodata.dat_NAME_ref` sections, placed at their exact JP addresses:
 *   - ProcScr_SysBrownBox (4 ProcCmd) @0x08A9DCD4
 *   - ProcScr_SysboxText  (3 ProcCmd) @0x08A9DCF4
 *   - ProcScr_BmFadeIN    (5 ProcCmd) @0x08A9DD0C
 *   - ProcScr_BmFadeOUT   (6 ProcCmd) @0x08A9DD34
 *   - ProcScr_BmBgfx      (5 ProcCmd) @0x08A9DD64
 * Their redundant baseline `.set NAME,0xADDR` aliases are dropped so the real
 * typed symbols win. The 80-byte trail (two non-worklist un-named scripts:
 * MixPalette + BonusClaimHelp) stays byte-identical as a *relocated* `.4byte`
 * slice so its ROM func pointers are not left un-relocated (= shiftcheck HIGH).
 * The external aliases data_08A9DCD4 (Proc_Find'd by sub_80B2708.c) and
 * data_08A9DD64 (Proc_Find'd by sub_80B3220.c) are preserved byte-neutrally as
 * `.set` onto ProcScr_SysBrownBox / ProcScr_BmBgfx. FUNC targets in typed tables
 * are bare (ld ORs the Thumb bit). REGION_SAME; the ONLY correctness oracle is
 * `make compare` (sha1).
 */

extern void SysBrownBox_Init();
extern void SysBrownBox_Loop();
extern void SysboxTextMain();
extern void FadeInOut_DisableGfx();
extern void FadeInOut_Init();
extern void FadeIn_Loop();
extern void EnableAllGfx();
extern void FadeOut_Loop();
extern void BmBgfx_Init();
extern void BmBgfx_Loop();
extern void BmBgfx_End();

struct ProcCmd ProcScr_SysBrownBox[] __attribute__((section(".rodata.dat_ProcScr_SysBrownBox_ref"))) = {
    PROC_CALL(SysBrownBox_Init),
    PROC_YIELD,
    PROC_REPEAT(SysBrownBox_Loop),
    PROC_END,
};

/* Byte-neutral external alias: data_08A9DCD4 == ProcScr_SysBrownBox (0x08A9DCD4). */
extern const u32 data_08A9DCD4 __attribute__((alias("ProcScr_SysBrownBox")));

struct ProcCmd ProcScr_SysboxText[] __attribute__((section(".rodata.dat_ProcScr_SysboxText_ref"))) = {
    PROC_YIELD,
    PROC_REPEAT(SysboxTextMain),
    PROC_END,
};

struct ProcCmd ProcScr_BmFadeIN[] __attribute__((section(".rodata.dat_ProcScr_BmFadeIN_ref"))) = {
    PROC_CALL(FadeInOut_DisableGfx),
    PROC_YIELD,
    PROC_CALL(FadeInOut_Init),
    PROC_REPEAT(FadeIn_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_BmFadeOUT[] __attribute__((section(".rodata.dat_ProcScr_BmFadeOUT_ref"))) = {
    PROC_YIELD,
    PROC_CALL(EnableAllGfx),
    PROC_CALL(FadeInOut_Init),
    PROC_REPEAT(FadeOut_Loop),
    PROC_CALL(FadeInOut_DisableGfx),
    PROC_END,
};

struct ProcCmd ProcScr_BmBgfx[] __attribute__((section(".rodata.dat_ProcScr_BmBgfx_ref"))) = {
    PROC_CALL(BmBgfx_Init),
    PROC_YIELD,
    PROC_REPEAT(BmBgfx_Loop),
    PROC_CALL(BmBgfx_End),
    PROC_END,
};

/* Byte-neutral external alias: data_08A9DD64 == ProcScr_BmBgfx (0x08A9DD64). */
extern const u32 data_08A9DD64 __attribute__((alias("ProcScr_BmBgfx")));

/* Trail [0x08A9DD8C,0x08A9DDDC) (80 B): two un-named scripts (MixPalette +
 * BonusClaimHelp) kept as a relocated `.4byte` slice. */
struct ProcCmd data_08A9DD8C[] SECTION(".data.residue.08A9DD8C") = {
    PROC_SLEEP(0),
    PROC_CALL(sub_80B33AC + 0x1),
    PROC_REPEAT(MixPalette_Loop + 0x1),
    PROC_END,
};

struct ProcCmd ProcScr_BonusClaimHelp_Init_08A9DD8C_0[] SECTION(".data.residue.08A9DD8C") = {
    PROC_SLEEP(0),
    PROC_CALL(BonusClaimHelp_Init + 0x1),
    PROC_SLEEP(8),
    PROC_REPEAT(BonusClaimHelp_Loop + 0x1),
    PROC_SLEEP(8),
    PROC_END,
};

