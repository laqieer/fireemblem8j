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












 // equipped item icons

// clang-format off











/* prototypes for same-file helpers called by this run */
void UnitList_SetupDisplay(struct UnitListScreenProc * proc);

//! FE8U = 0x080906AC
void UnitList_ResetFromStatScreen(struct UnitListScreenProc * proc)
{
    UnitList_SetupDisplay(proc);
    SetDispEnable(0, 0, 0, 0, 0);

    return;
}
