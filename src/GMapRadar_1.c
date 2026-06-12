extern int GMapRadar_0();
#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u8 const gWorldmapRadar_0[];

// clang-format on

//! FE8U = 0x080C3AB8
void GMapRadar_1(struct GMapRadarProc * proc)
{
    int state;

    if ((gGMData.state.bits.state_2) != 0)
    {
        proc->unk_34 = 0;
        proc->unk_2a = GetWMCursorScreenQuadrant(0x20, 0x20, 0x30, 0x30);

        state = ((gWorldmapRadar_0[proc->unk_2a + (gGMData.state.bits.state_4_5) * 5] & 3) << 4);
        gGMData.state.bits.state_4_5 = 0;
        gGMData.state.raw |= state;

        GMapRadar_0(proc);

        *&proc->unk_2d = gGMData.ix >> 8;
        *&proc->unk_2e = gGMData.iy >> 8;

        proc->unk_2b = proc->unk_2d;
        proc->unk_2c = proc->unk_2e;

        Proc_Break(proc);
    }

    return;
}
