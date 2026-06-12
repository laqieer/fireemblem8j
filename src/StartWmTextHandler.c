#include "global.h"
#include "ctc.h"
#include "scene.h"
#include "hardware.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_WorldMapTextHandler[];

//! FE8U = 0x080C368C
ProcPtr StartWmTextHandler(ProcPtr parent)
{
    return Proc_Start(ProcScr_WorldMapTextHandler, parent);
}
