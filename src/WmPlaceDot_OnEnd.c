extern int EndAllWmDotPalAnim();
#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WmPlaceDot[];

//! FE8U = 0x080C2E70
void WmPlaceDot_OnEnd(struct ProcWmPlaceDot * proc)
{
    if (CountProcs(ProcScr_WmPlaceDot) == 1)
    {
        EndAllWmDotPalAnim();
    }

    if (((proc->unk_2a & 2) != 0) && (proc->effectProc != NULL))
    {
        EndGmapEffectProc(proc->effectProc);
    }

    return;
}
