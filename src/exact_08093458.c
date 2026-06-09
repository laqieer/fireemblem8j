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

//! FE8U = 0x08091180
void UnitList_Init(struct UnitListScreenProc * proc)
{
    proc->unk_29 = 0;
    proc->unk_31 = 1;
    proc->unk_2c = 0;
    proc->unk_2d = 0;
    proc->unk_30 = 0;

    if (proc->mode == UNITLIST_MODE_SOLOANIM)
    {
        proc->page = 0;
    }
    else
    {
        proc->page = 1;
    }

    proc->pageTarget = proc->page;

    proc->unk_3e = 0;
    proc->unk_32 = 1;
    proc->unk_2a = 0;
    proc->unk_33 = 1;
    proc->unk_34 = 0;
    proc->unk_35 = 0;

    UnitList_SetupDisplay(proc);

    return;
}
