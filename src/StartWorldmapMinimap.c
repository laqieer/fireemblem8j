#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldmapMinimapWrapper[];

// clang-format on

//! FE8U = 0x080C3E80
ProcPtr StartWorldmapMinimap(ProcPtr parent)
{
    return Proc_Start(ProcScr_WorldmapMinimapWrapper, parent);
}
