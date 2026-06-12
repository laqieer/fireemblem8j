extern int PutWmMinimapGfx();
extern int PutWmMinimapSprites();
#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern s8 gWorldmapRadar_1[];

//! FE8U = 0x080C3D24
void GMapRadar_SlideIn(struct GMapRadarProc * proc)
{
    PutWmMinimapGfx(proc, gWorldmapRadar_1[proc->unk_34]);
    PutWmMinimapSprites(proc);

    proc->unk_34++;

    if (proc->unk_34 == 4)
    {
        proc->unk_34 = 0;
        Proc_Break(proc);
    }

    return;
}
