#include "global.h"
#include "proc.h"

/* #143 shiftability: gProcScr_DrawTitleSprites @ JP 0x08B3EDD0 and the adjacent
 * gProcScr_SkipTitleFxKeyListener @ 0x08B3EDE8 were formerly the tail 48 bytes
 * of a raw ending provider. Typed here as struct ProcCmd[] so the 3 interior
 * code pointers become R_ARM_ABS32 relocations instead of baked words that
 * stay un-relocated and branch into the pre-shift gap on the +0x40000 ROM.
 * REGION_SAME structure vs fe8u src/titlescreen.c.
 *
 * The preceding 413 B are now owned by the subtitle TSA and typed title-sprite
 * CTC providers. These scripts remain in their 4-aligned .rodata section at
 * 0x08B3EDD0 so the three callback pointers stay relocatable. */

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
