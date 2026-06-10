#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrlevelup.h"
#include "hardware.h"
#include "mapanim.h"
#include "ctc.h"
#include "bmlib.h"

void EfxPartsofScroll2HBlank(void)
{
    /* line 160..226 */
    if (REG_DISPSTAT & DISPSTAT_VBLANK)
        return;

    REG_BG2VOFS = gLCDControlBuffer.bgoffset[2].y + *gpBg2ScrollOffset++;
    REG_BG1VOFS = gLCDControlBuffer.bgoffset[1].y + *gpBg1ScrollOffset++;
}
