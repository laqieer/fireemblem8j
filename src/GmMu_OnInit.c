#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/classes.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GMapMuPrim[];

// clang-format on

//! FE8U = 0x080BDC04
void GmMu_OnInit(struct GMapMuProc * proc)
{
    int i;

    for (i = 0; i < 7; i++)
    {
        proc->unk_2c[i] = Proc_Start(ProcScr_GMapMuPrim, proc->proc_parent);
    }

    return;
}
