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





void EkrLvupHBlank(void)
{
    /* line 160..226 */
    if (REG_DISPSTAT & DISPSTAT_VBLANK)
        return;

    REG_BG2HOFS = *gpBg2ScrollOffset++;
    REG_BG1HOFS = *gpBg1ScrollOffset++;
}

