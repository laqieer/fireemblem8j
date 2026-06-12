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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmapUnitContainer[];

// clang-format on

//! FE8U = 0x080BB1E8
ProcPtr NewGmapUnitContainer(ProcPtr parent, int layer, int chr)
{
    struct GMapUnitContainerProc * proc = Proc_Start(ProcScr_GmapUnitContainer, parent);
    proc->layer = layer;
    proc->unk_30 = chr;

    return proc;
}
