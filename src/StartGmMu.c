#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "mu.h"
#include "spline.h"
#include "worldmap.h"
#include "constants/classes.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GMapMu[];

// clang-format on

//! FE8U = 0x080BDC28
ProcPtr StartGmMu(ProcPtr parent)
{
    return Proc_Start(ProcScr_GMapMu, parent);
}
