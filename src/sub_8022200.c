#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"

/* JP-only screen-init proc-starter (region-different, fe8u sibling pattern).
 * Draws a fullscreen image into BG_CHR_ADDR(0x280), applies its palette and
 * TSA into gBG0TilemapBuffer, clears blending, and starts the screen proc. */

extern const u8 Img_Sub8022200[];   /* 0x085D14D4 */
extern const u8 Pal_Sub8022200[];   /* 0x085D188C */
extern const u8 Tsa_Sub8022200[];   /* 0x085D1A8C */
extern const struct ProcCmd ProcScr_085C3A08[]; /* ProcScr @ 0x085C3A08 */

void sub_8022200(ProcPtr parent)
{
    Decompress(Img_Sub8022200, BG_CHR_ADDR(0x280));
    ApplyPalettes(Pal_Sub8022200, 2, 1);

    Decompress(Tsa_Sub8022200, gGenericBuffer);
    CallARM_FillTileRect(gBG0TilemapBuffer + 2, gGenericBuffer, TILEREF(0x280, 2));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    SetDispEnable(1, 0, 0, 0, 0);

    SetBlendConfig(2, 0, 0, 0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 0, 0, 0);

    Proc_StartBlocking(ProcScr_085C3A08, parent);
}
