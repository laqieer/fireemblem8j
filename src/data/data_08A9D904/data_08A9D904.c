#include "global.h"
#include "proc.h"

extern u8 frontier_df4_menu_gap27c_4090[];

extern const u8 data_08A9D688[];
extern const u8 gSprite_SavemenuData_17[];
extern const u8 gSprite_SavemenuData_18[];
extern const u8 gSprite_SavemenuData_19[];
extern const u8 gSprite_SavemenuData_20[];
extern const u8 gSprite_SavemenuData_21[];
extern const u8 gSprite_SavemenuData_22[];


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
extern const u32 data_08A9D978 __attribute__((alias("gProcScr_SaveBgUp")));

/* residue [08A9D904,08A9D978) (116 B): byte-identical. */
u32 data_08A9D904[] __attribute__((section(".data.residue.08A9D904"))) = {
    (u32)&data_08A9D688 + 0x124,
    (u32)&data_08A9D688 + 0x13E,
    (u32)&data_08A9D688 + 0x158,
    (u32)&data_08A9D688 + 0x172,
    (u32)&data_08A9D688 + 0x186,
    (u32)&data_08A9D688 + 0x19A,
    (u32)&data_08A9D688 + 0x1B4,
    (u32)&frontier_df4_menu_gap27c_4090,
    (u32)&data_08A9D688 + 0x3A,
    (u32)&data_08A9D688 + 0x5A,
    (u32)&data_08A9D688 + 0x6E,
    (u32)&data_08A9D688 + 0x94,
    (u32)&data_08A9D688 + 0xB4,
    (u32)&data_08A9D688 + 0xC8,
    (u32)&data_08A9D688 + 0x3A,
    (u32)&data_08A9D688 + 0xF0,
    (u32)&data_08A9D688 + 0x10A,
    (u32)&data_08A9D688 + 0xDC,
    (u32)&gSprite_SavemenuData_20,
    (u32)&gSprite_SavemenuData_21,
    (u32)&gSprite_SavemenuData_22,
    (u32)&gSprite_SavemenuData_17,
    (u32)&gSprite_SavemenuData_18,
    (u32)&gSprite_SavemenuData_19,
    0x00002000,
    0x00004000,
    0x00006000,
    0x08330832,
    0x00000834,
};

/* residue [08A9DA00,08A9DAA4) (164 B): byte-identical. */
u32 data_08A9DA00[] __attribute__((section(".data.residue.08A9DA00"))) = {
    0x00000001,
    0x045C8000,
    0x40000002,
    0x0840C000,
    0xC0404000,
    0x00030848,
    0x80104008,
    0x40080850,
    0x08548030,
    0x80504008,
    0x00020858,
    0xC0004000,
    0x40000840,
    0x0848C040,
    0x40080003,
    0x08C08018,
    0x80384008,
    0x000808C4,
    0x08C84058,
    0x40080002,
    0x08CA8020,
    0x80404008,
    0x000308CE,
    0x80104008,
    0x40080890,
    0x08948030,
    0x80504008,
    0x00000898,
    (u32)&gProcScr_SaveBgUp + 0xC0,
    (u32)&gProcScr_SaveBgUp + 0xD4,
    (u32)&gProcScr_SaveBgUp + 0xE2,
    0x03020100,
    0x00010203,
};

struct ProcCmd data_08A9DA84[] SECTION(".data.residue.08A9DA00") = {
    PROC_CALL(DrawDifficultySprite_Init + 0x1),
    PROC_SLEEP(0),
    PROC_REPEAT(DrawDifficultySprites_Loop + 0x1),
    PROC_END,
};

