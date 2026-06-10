#include "global.h"
#include "hardware.h"
#include "bm.h"
#include "bb.h"

/* bldyLut is the JP region-different data at 0x085C6646 (named `bldyLut.10` by
 * the data carve). Referenced as an extern so the literal pool relocates against
 * that fixed address instead of emitting a private copy. */
extern const u8 SubtitleHelpDarkener_BldyLut[];

void SubtitleHelpDarkenerOnHBlank()
{
    u16 vcount = REG_VCOUNT;

    if ((vcount < 140) || (vcount > 160)) {
        REG_BLDCNT = *(u16*)(&gLCDControlBuffer.bldcnt);
        REG_BLDALPHA = *(u16*)(&gLCDControlBuffer.blendCoeffA);
        REG_BLDY = gLCDControlBuffer.blendY;
    } else {
        int bldy;

        bldy = SubtitleHelpDarkener_BldyLut[vcount - 128];
        bldy = bldy - gBmSt.altBlendACa;

        if (bldy < 0) {
            bldy = 0;
        }

        REG_BLDCNT =
            BLDCNT_EFFECT_DARKEN |
            BLDCNT_TGT1_BG2 |
            BLDCNT_TGT1_BG3 |
            BLDCNT_TGT1_BD;

        REG_BLDY = bldy;
    }

    return;
}
