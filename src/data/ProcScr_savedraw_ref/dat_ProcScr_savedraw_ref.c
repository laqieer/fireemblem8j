#include "global.h"
#include "proc.h"

/* #143 shiftability: ProcScr_savedraw @ JP 0x08A9D5D4 (6 ProcCmd),
 * gProcScr_SaveDrawCursor @ 0x08A9D604 (4 ProcCmd) and gProcScr_Savedraw_0 @
 * 0x08A9D624 (5 ProcCmd) are the contiguous 120 B block [0x08A9D5D4, 0x08A9D64C)
 * that was buried inside the raw INCBIN blob frontier_df4_menu_027_A9D462
 * (.data.frontier_df4_menu.gap27). Typed here as struct ProcCmd[] so their ten
 * interior pointers become R_ARM_ABS32 relocations (8 code + 2 name) instead of
 * raw un-relocated words that bx into the pre-shift gap on the +0x40000 shifted
 * ROM. The main/save menu crashes at faulting PC 0x080AF54C = SaveDraw_Init (the
 * PROC_CALL below) and blacks out until these pointers are relocated.
 *
 * REGION_SAME structure vs fe8u src/savedraw.c (identical opcodes/dataImm; only
 * the linker-resolved pointers differ). The JP build re-uses the two proc-name
 * strings that already live inside frontier_df4_voice_000_1F578C at +0x5C
 * ("savedraw") and +0x70 ("savedrawcursor") rather than emitting fresh .rodata
 * literals, so PROC_NAME points there via sym+addend.
 *
 * The blob base 0x08A9D462 is only 2-aligned, so an in-place split would force
 * struct-align-4 padding and desync every following byte; instead the 0x172 B
 * head stays an INCBIN in .data.frontier_df4_menu.gap27, these three scripts are
 * carved into this new 4-aligned .rodata section that the layout places at
 * 0x08A9D5D4, and the tail (0x08A9D64C onward, incl. data_08A9D688) returns to a
 * new gap27c section -- contiguous 0x172 -> 0x78 -> 0x20A, byte-identical. */

extern u8 frontier_df4_voice_000_1F578C[];

extern void SaveDraw_OnEnd(void);
extern void SaveDraw_Init(ProcPtr proc);
extern void SaveDraw_Loop_Main(ProcPtr proc);
extern void SaveDrawCursor_Init(ProcPtr proc);
extern void SaveDrawCursor_Loop(ProcPtr proc);
extern void EndBgVerticalScroll(void);
extern void SaveBgFog_Init(ProcPtr proc);
extern void SaveDraw_ScrollFogBG(ProcPtr proc);

struct ProcCmd ProcScr_savedraw[] __attribute__((section(".rodata.dat_ProcScr_savedraw_ref"))) = {
    PROC_NAME(&frontier_df4_voice_000_1F578C[0x5C]), /* A9D5D4  name@A9D5D8 = 081F57E8 "savedraw" */
    PROC_MARK(PROC_MARK_SAVEDRAW),                   /* A9D5DC  imm = 0x000C */
    PROC_SET_END_CB(SaveDraw_OnEnd),                 /* A9D5E4  ptr@A9D5E8 = 080AF541 */
    PROC_CALL(SaveDraw_Init),                        /* A9D5EC  ptr@A9D5F0 = 080AF54D  <- fault PC 080AF54C */
    PROC_REPEAT(SaveDraw_Loop_Main),                 /* A9D5F4  ptr@A9D5F8 = 080AFD75 */
    PROC_END,                                        /* A9D5FC */
};

struct ProcCmd gProcScr_SaveDrawCursor[] __attribute__((section(".rodata.dat_ProcScr_savedraw_ref"))) = {
    PROC_NAME(&frontier_df4_voice_000_1F578C[0x70]), /* A9D604  name@A9D608 = 081F57FC "savedrawcursor" */
    PROC_CALL(SaveDrawCursor_Init),                  /* A9D60C  ptr@A9D610 = 080AFDE9 */
    PROC_REPEAT(SaveDrawCursor_Loop),                /* A9D614  ptr@A9D618 = 080AFE15 */
    PROC_END,                                        /* A9D61C */
};

struct ProcCmd gProcScr_Savedraw_0[] __attribute__((section(".rodata.dat_ProcScr_savedraw_ref"))) = {
    PROC_SET_END_CB(EndBgVerticalScroll),            /* A9D624  ptr@A9D628 = 08014E65 */
    PROC_SLEEP(0),                                   /* A9D62C */
    PROC_CALL(SaveBgFog_Init),                       /* A9D634  ptr@A9D638 = 080B01DD */
    PROC_REPEAT(SaveDraw_ScrollFogBG),               /* A9D63C  ptr@A9D640 = 080AF4B9 */
    PROC_END,                                        /* A9D644 */
};
