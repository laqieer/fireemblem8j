#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GMapScreen[];

// clang-format on

//! FE8U = 0x080BABF0
ProcPtr NewMapScreen(ProcPtr parent)
{
    struct GmScreenProc * proc = Proc_Start(ProcScr_GMapScreen, parent);
    proc->gmroute = StartGMapRoute(proc, &gGMData.openPaths, 0x5000, 0xe);
    return proc;
}
