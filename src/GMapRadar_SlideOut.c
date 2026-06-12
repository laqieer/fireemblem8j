extern int PutWmMinimapGfx();
extern int PutWmMinimapSprites();
#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern s8 gWorldmapRadar_2[];

//! FE8U = 0x080C3D5C
void GMapRadar_SlideOut(struct GMapRadarProc * proc)
{
    PutWmMinimapGfx(proc, gWorldmapRadar_2[proc->unk_34]);
    PutWmMinimapSprites(proc);

    proc->unk_34++;

    if (proc->unk_34 == 4)
    {
        proc->unk_34 = 0;
        proc->unk_29 = 0;
        Proc_Break(proc);
    }

    return;
}
