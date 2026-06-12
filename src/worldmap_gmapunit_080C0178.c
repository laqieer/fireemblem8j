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

/* prototypes for same-file helpers called by this run */
u16 GmapUnitFade_InterpolateColor(int arg0, int arg1, int arg2, int arg3, int arg4);

//! FE8U = 0x080BB348
void GmapUnitFade_Loop(struct GMapUnitFadeProc * proc)
{
    u16 * palIt;

    proc->unk_2e++;

    palIt = gPaletteBuffer + OBPAL_OFFSET(0xA);

    if (proc->unk_2e < proc->unk_2c)
    {
        int i;
        int var = _DivArm1(proc->unk_2e, proc->unk_2c, 0);

        for (i = 0; i < 0x10; i++)
        {
            *palIt++ = GmapUnitFade_InterpolateColor(proc->unk_29, i, proc->unk_2a, i, var);
        }
    }
    else
    {
        if (proc->unk_2a >= 0)
        {
            CpuCopy16(gPaletteBuffer + proc->unk_2a * 0x10 + 0x100, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
        }
        else
        {
            CpuFill16(0, gPaletteBuffer + OBPAL_OFFSET(0xA), 0x20);
        }

        Proc_Break(proc);
    }

    EnablePaletteSync();

    return;
}
