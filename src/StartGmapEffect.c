#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_GmapEffect[];

// clang-format on

//! FE8U = 0x080C1370
struct GmapEffectProc * StartGmapEffect(ProcPtr parent, int unk)
{
    struct GmapEffectProc * proc;

    if (parent != NULL)
    {
        if (gGMData.state.bits.state_3)
        {
            // TODO: Was this intended to be non-blocking?
            proc = Proc_StartBlocking(gProcScr_GmapEffect, parent);
        }
        else
        {
            proc = Proc_StartBlocking(gProcScr_GmapEffect, parent);
        }
    }
    else
    {
        if (gGMData.state.bits.state_3)
        {
            proc = Proc_Start(gProcScr_GmapEffect, PROC_TREE_3);
        }
        else
        {
            proc = Proc_StartBlocking(gProcScr_GmapEffect, PROC_TREE_3);
        }
    }

    proc->unk_2a = unk;

    return proc;
}
