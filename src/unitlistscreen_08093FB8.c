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

//! FE8U = 0x08091CC0
void UnitList_StartPageChange(struct UnitListScreenProc * proc)
{
    int i;

    TileMap_FillRect(gUnitlistscreen_0[0], 31, 31, 0);

    for (i = proc->unk_3e / 16; i < proc->unk_3e / 16 + 6 && i < gUnitlistscreen_8; i++)
    {
        UnitList_PutRow(proc, i, gUnitlistscreen_0[0], proc->page, 0);
    }

    TileMap_FillRect(gUnitlistscreen_1[0], 31, 1, 0);

    UnitList_DrawColumnNames(gUnitlistscreen_1[0], proc->page);

    proc->unk_3c = 0;
    proc->unk_37 = proc->page;
    proc->unk_38 = 0;

    return;
}
