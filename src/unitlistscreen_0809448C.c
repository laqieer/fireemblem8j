#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_UnitListScreen_WorldMap[];

//! FE8U = 0x08092194
void StartUnitListScreenWorldMap(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_UnitListScreen_WorldMap, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_WorldMap, parent);
    }

    ResetUnitSprites();

    proc->mode = UNITLIST_MODE_WORLDMAP;

    return;
}
