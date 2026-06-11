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

extern EWRAM_OVERLAY(0) struct SortedUnitEnt gSortedUnitsBuf[0x40];
extern EWRAM_OVERLAY(0) struct SortedUnitEnt * gSortedUnits[0x40];
extern EWRAM_OVERLAY(0) u16 gUnitlistscreen_0[0x20][0x20];
extern EWRAM_OVERLAY(0) u16 gUnitlistscreen_1[2][0x20];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_7[0x1000];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_8;
extern EWRAM_OVERLAY(0) u32 gUnitlistscreen_9[8]; // equipped item icons

// clang-format off

extern struct ProcCmd CONST_DATA ProcScr_UnitListScreen_Field[];

extern struct ProcCmd CONST_DATA ProcScr_UnitListScreen_PrepMenu[];

extern struct ProcCmd CONST_DATA ProcScr_UnitListScreen_SoloAnim[];





//! FE8U = 0x08092164
void StartUnitListScreenUnk(ProcPtr parent)
{
    struct UnitListScreenProc * proc;

    if (parent == NULL)
    {
        proc = Proc_Start(ProcScr_UnitListScreen_PrepMenu, PROC_TREE_3);
    }
    else
    {
        proc = Proc_StartBlocking(ProcScr_UnitListScreen_PrepMenu, parent);
    }

    proc->mode = UNITLIST_MODE_4;

    return;
}
