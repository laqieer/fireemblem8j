#include "global.h"
#include "proc.h"


extern void DrawDifficultySprite_Init();
extern void DrawDifficultySprites_Loop();

/* #148 proc-script decomp-completeness: data_08A9D904.
 *
 * 1 opaque proc script(s) decoded from the .data.residue.08A9D904
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - gProcScr_SaveBgUp (17 ProcCmd) @0x08A9D978
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * External blob aliases preserved byte-neutrally: data_08A9D978==gProcScr_SaveBgUp.
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void DifficultySelect_Init();
extern void DifficultySelect_Loop_KeyHandler();
extern void DifficultySelect_OnEnd();
extern void DisableAllDisplay();
extern void EnableAllGfx();
extern void FadeInExists();
extern void FadeOutExists();
extern void NewFadeIn();
extern void NewFadeOut();
extern void nullsub_86();

struct ProcCmd gProcScr_SaveBgUp[] __attribute__((section(".rodata.dat_gProcScr_SaveBgUp_ref"))) = {
    PROC_SET_END_CB(DifficultySelect_OnEnd),
    PROC_CALL(DisableAllDisplay),
    PROC_YIELD,
    PROC_CALL(DifficultySelect_Init),
    PROC_SLEEP(1),
    PROC_CALL(EnableAllGfx),
    PROC_CALL_ARG(NewFadeIn, 0x8),
    PROC_WHILE(FadeInExists),
    PROC_LABEL(0),
    PROC_REPEAT(DifficultySelect_Loop_KeyHandler),
    PROC_LABEL(1),
    PROC_SLEEP(10),
    PROC_LABEL(2),
    PROC_CALL_ARG(NewFadeOut, 0x8),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(nullsub_86),
    PROC_END,
};

/* Byte-neutral external alias: data_08A9D978 == gProcScr_SaveBgUp. */
__asm__(
"\t.global data_08A9D978\n"
"\t.set data_08A9D978, gProcScr_SaveBgUp\n"
);

/* residue [08A9D904,08A9D978) (116 B): byte-identical. */
__asm__(
"\t.section .data.residue.08A9D904, \"aw\", %progbits\n"
"\t.global data_08A9D904\n"
"data_08A9D904:\n"
"\t.4byte data_08A9D688 + 0x124\n"
"\t.4byte data_08A9D688 + 0x13E\n"
"\t.4byte data_08A9D688 + 0x158\n"
"\t.4byte data_08A9D688 + 0x172\n"
"\t.4byte data_08A9D688 + 0x186\n"
"\t.4byte data_08A9D688 + 0x19A\n"
"\t.4byte data_08A9D688 + 0x1B4\n"
"\t.4byte data_08A9D688 + 0x20\n"
"\t.4byte data_08A9D688 + 0x3A\n"
"\t.4byte data_08A9D688 + 0x5A\n"
"\t.4byte data_08A9D688 + 0x6E\n"
"\t.4byte data_08A9D688 + 0x94\n"
"\t.4byte data_08A9D688 + 0xB4\n"
"\t.4byte data_08A9D688 + 0xC8\n"
"\t.4byte data_08A9D688 + 0x3A\n"
"\t.4byte data_08A9D688 + 0xF0\n"
"\t.4byte data_08A9D688 + 0x10A\n"
"\t.4byte data_08A9D688 + 0xDC\n"
"\t.4byte gSprite_SavemenuData_20\n"
"\t.4byte gSprite_SavemenuData_21\n"
"\t.4byte gSprite_SavemenuData_22\n"
"\t.4byte gSprite_SavemenuData_17\n"
"\t.4byte gSprite_SavemenuData_18\n"
"\t.4byte gSprite_SavemenuData_19\n"
"\t.4byte 0x00002000\n"
"\t.4byte 0x00004000\n"
"\t.4byte 0x00006000\n"
"\t.4byte 0x08330832\n"
"\t.4byte 0x00000834\n"
);

/* residue [08A9DA00,08A9DAA4) (164 B): byte-identical. */
__asm__(
    ".section .data.residue.08A9DA00, \"aw\", %progbits\n"
    "data_08A9DA00:\n"
    "	.4byte 0x00000001\n"
    "	.4byte 0x045C8000\n"
    "	.4byte 0x40000002\n"
    "	.4byte 0x0840C000\n"
    "	.4byte 0xC0404000\n"
    "	.4byte 0x00030848\n"
    "	.4byte 0x80104008\n"
    "	.4byte 0x40080850\n"
    "	.4byte 0x08548030\n"
    "	.4byte 0x80504008\n"
    "	.4byte 0x00020858\n"
    "	.4byte 0xC0004000\n"
    "	.4byte 0x40000840\n"
    "	.4byte 0x0848C040\n"
    "	.4byte 0x40080003\n"
    "	.4byte 0x08C08018\n"
    "	.4byte 0x80384008\n"
    "	.4byte 0x000808C4\n"
    "	.4byte 0x08C84058\n"
    "	.4byte 0x40080002\n"
    "	.4byte 0x08CA8020\n"
    "	.4byte 0x80404008\n"
    "	.4byte 0x000308CE\n"
    "	.4byte 0x80104008\n"
    "	.4byte 0x40080890\n"
    "	.4byte 0x08948030\n"
    "	.4byte 0x80504008\n"
    "	.4byte 0x00000898\n"
    "	.4byte data_08A9D978 + 0xC0\n"
    "	.4byte data_08A9D978 + 0xD4\n"
    "	.4byte data_08A9D978 + 0xE2\n"
    "	.4byte 0x03020100\n"
    "	.4byte 0x00010203\n"
);

struct ProcCmd data_08A9DA84[] SECTION(".data.residue.08A9DA00") = {
    PROC_CALL(DrawDifficultySprite_Init + 0x1),
    PROC_SLEEP(0),
    PROC_REPEAT(DrawDifficultySprites_Loop + 0x1),
    PROC_END,
};

