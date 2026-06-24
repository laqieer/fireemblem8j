#include "global.h"

#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

// TODO: bmudisp.h - implicit declaration
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, int isBlend);

extern const u8 gWorldmapGmapunit_0[];

//! FE8U = 0x080BAC78
void GmapUnit_Loop(struct GMapUnitProc * proc)
{
    s16 x;
    s16 y;
    s16 xOam1;
    s16 yOam0;

    if (!(proc->flags & GMAPUNIT_FLAG_DISPLAY))
    {
        return;
    }

    if (gGMData.state.bits.state_3)
    {
        GmapRm_GetPosition(&x, &y);
    }
    else
    {
        x = ((struct GmScreenProc *)(proc->proc_parent))->x;
        y = ((struct GmScreenProc *)(proc->proc_parent))->y;
    }

    xOam1 = proc->x - x;
    yOam0 = proc->y - y;

    if (((u16)(yOam0 + 0x20) < 0xe0) && ((u16)(xOam1 + 0x10) < 0x110))
    {
        xOam1 = xOam1 & 0x1ff;
        yOam0 = yOam0 & 0xff;

        if (proc->animId == 4)
        {
            int oam2;
            SetStandingMuFacingWM(gWorldmapGmapunit_0[proc->index], (void *)(0x06010000 + proc->unk_30 * 0x20));

            oam2 = proc->unk_30 + OAM2_PAL(proc->pal) + gWorldmapGmapunit_0[proc->index] + proc->unk_2e;
            SMS_DisplayOne(proc->unk_38, proc->unk_2c, xOam1, yOam0, oam2, proc->flags & GMAPUNIT_FLAG_BLEND);
        }
        else
        {
            if (proc->flags & GMAPUNIT_FLAG_BLEND)
            {
                yOam0 |= OAM0_BLEND;
            }

            if (proc->flags & GMAPUNIT_FLAG_UPDATEGFX)
            {
                proc->ap->gfxNeedsUpdate = 1;
                proc->flags &= ~GMAPUNIT_FLAG_UPDATEGFX;
            }

            AP_Update(proc->ap, xOam1, yOam0);
        }
    }

    return;
}
