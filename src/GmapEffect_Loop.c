extern int GmapEffect_0();
#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapEffectPal[];

//! FE8U = 0x080C1324
void GmapEffect_Loop(struct GmapEffectProc * proc)
{
    struct GmapEffectProc * otherProc = Proc_Find(gProcScr_GmapEffectPal);

    if (otherProc == NULL)
    {
        Proc_Break(proc);
    }

    if (otherProc->unk_2b_0)
    {
        Proc_Break(proc);
    }

    if (proc->flags_0)
    {
        GmapEffect_0(proc);
    }

    return;
}
