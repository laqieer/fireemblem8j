#include "global.h"
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void BgAffinAnchoring(u8 bg, s16 q0_x, s16 q0_y, s16 p0_x, s16 p0_y)
{
    /**
     * vector q0: origin in screen space
     * vector p0: origin in texture space
     *
     * See tonc 12.3: https://www.coranac.com/tonc/text/affbg.htm:
     *
     * bgaff->dx= asx->tex_x - (pa*asx->scr_x + pb*asx->scr_y);
     * bgaff->dy= asx->tex_y - (pc*asx->scr_x + pd*asx->scr_y);
     */
    int qx = (s16)q0_x;
    int qy = (s16)q0_y;
    int px = (s16)p0_x;
    int py = (s16)p0_y;
    struct BgAffineDstData * affin = NULL;
    if (bg == BG_2)
        affin = &gLCDControlBuffer.bg2affin;

    affin->dx = affin->pa * (-qx) + affin->pb * (-qy) + px * 0x100;
    affin->dy = affin->pc * (-qx) + affin->pd * (-qy) + py * 0x100;
}
