extern int PutWmMinimapSprites();
#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u8 const gWorldmapRadar_0[];

//! FE8U = 0x080C3B40
void GMapRadar_2(struct GMapRadarProc * proc)
{
    int var;

    PutWmMinimapSprites(proc);

    proc->unk_2b = proc->unk_2d;
    proc->unk_2c = proc->unk_2e;

    proc->unk_2d = gGMData.ix >> 8;
    proc->unk_2e = gGMData.iy >> 8;

    if ((gGMData.state.bits.state_2) != 0)
    {
        if ((s8)gGMData.sprite_disp < 1)
        {
            return;
        }

        if ((proc->unk_2d == proc->unk_2b) && (proc->unk_2e == proc->unk_2c))
        {
            return;
        }

        var = GetWMCursorScreenQuadrant(0x20, 0x20, 0x30, 0x30);

        if (var == proc->unk_2a)
        {
            return;
        }

        if (gGMData.state.bits.state_4_5 == gWorldmapRadar_0[var + gGMData.state.bits.state_4_5 * 5])
        {
            return;
        }
    }

    proc->unk_29 = 1;
    Proc_Break(proc);

    return;
}
