#include "global.h"
#include "proc.h"

/* #143 shiftability: gProcScr_DrawTitleSprites @ JP 0x08B3EDD0 and the adjacent
 * gProcScr_SkipTitleFxKeyListener @ 0x08B3EDE8 were the tail 48 bytes of the raw
 * INCBIN blob frontier_df4_ending_016_B3EC33 (.data.frontier_df4_ending.gap16).
 * Typed here as struct ProcCmd[] so the 3 interior code pointers become
 * R_ARM_ABS32 relocations instead of raw 0x080CA1E9/0x080CA1F9/0x080CA351 words
 * that stay un-relocated and bx into the pre-shift gap on the +0x40000 ROM (the
 * title character sprite proc). REGION_SAME structure vs fe8u src/titlescreen.c.
 *
 * The head 413 B of the blob stays an INCBIN at 0x08B3EC33; these two scripts are
 * carved into a new 4-aligned .rodata section placed at 0x08B3EDD0 by the layout
 * (the blob base 0x08B3EC33 is not 4-aligned, so an in-place split would insert
 * padding and desync the bytes). */

extern void DrawTitleSprites_Init(ProcPtr proc);
extern void DrawTitleSprites_Loop(ProcPtr proc);
extern void SkipTitleFx_Loop_KeyListener(ProcPtr proc);

struct ProcCmd gProcScr_DrawTitleSprites[] __attribute__((section(".rodata.dat_gProcScr_DrawTitleSprites_ref"))) = {
    PROC_CALL(DrawTitleSprites_Init),               /* B3EDD0  ptr@B3EDD4 = 080CA1E9 */
    PROC_REPEAT(DrawTitleSprites_Loop),             /* B3EDD8  ptr@B3EDDC = 080CA1F9 */
    PROC_END,                                       /* B3EDE0 */
};

struct ProcCmd gProcScr_SkipTitleFxKeyListener[] __attribute__((section(".rodata.dat_gProcScr_DrawTitleSprites_ref"))) = {
    PROC_YIELD,                                     /* B3EDE8 */
    PROC_REPEAT(SkipTitleFx_Loop_KeyListener),      /* B3EDF0  ptr@B3EDF4 = 080CA351 */
    PROC_END,                                       /* B3EDF8 */
};
