#include "global.h"
#include "proc.h"


extern void SpriteTextScroll_OnIdle();
extern void SpriteTextScroll_OnInit();
extern void TalkPutSpriteText_OnEnd();
extern void TalkPutSpriteText_OnIdle();

/* #148 proc-script decomp-completeness: data_085B938C.
 *
 * 2 opaque proc script(s) decoded from the .data.residue.085B938C
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - ProcScr_Scene_0 (3 ProcCmd) @0x085B93A4
 *   - ProcScr_ScreenFlashing (5 ProcCmd) @0x085B93D4
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void ScreenFlash_FadeIn();
extern void ScreenFlash_FadeOut();
extern void ScreenFlash_Init();
extern void SpriteTextScroll_BlockWhileActive();
extern void SpriteTextScroll_OnEnd();

struct ProcCmd ProcScr_Scene_0[] __attribute__((section(".rodata.dat_ProcScr_Scene_0_ref"))) = {
    PROC_SET_END_CB(SpriteTextScroll_OnEnd),
    PROC_WHILE(SpriteTextScroll_BlockWhileActive),
    PROC_END,
};

struct ProcCmd ProcScr_ScreenFlashing[] __attribute__((section(".rodata.dat_ProcScr_ScreenFlashing_ref"))) = {
    PROC_YIELD,
    PROC_CALL(ScreenFlash_Init),
    PROC_REPEAT(ScreenFlash_FadeIn),
    PROC_REPEAT(ScreenFlash_FadeOut),
    PROC_END,
};

/* residue [085B938C,085B93A4) (24 B): byte-identical. */
struct ProcCmd data_085B938C[] SECTION(".data.residue.085B938C") = {
    PROC_SET_END_CB(TalkPutSpriteText_OnEnd + 0x1),
    PROC_REPEAT(TalkPutSpriteText_OnIdle + 0x1),
    PROC_END,
};


/* residue [085B93BC,085B93D4) (24 B): byte-identical. */
struct ProcCmd data_085B93BC[] SECTION(".data.residue.085B93BC") = {
    PROC_CALL(SpriteTextScroll_OnInit + 0x1),
    PROC_REPEAT(SpriteTextScroll_OnIdle + 0x1),
    PROC_END,
};


/* residue [085B93FC,085B943C) (64 B): byte-identical. */
__asm__(
"\t.section .data.residue.085B93FC, \"aw\", %progbits\n"
"data_085B93FC:\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000004\n"
"\t.4byte EventSpriteAnim_End + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventSpriteAnim_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EventSpriteAnim_Loop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000004\n"
"\t.4byte APProc_OnEnd + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte APProc_OnUpdate + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
