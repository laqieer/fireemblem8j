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


extern EWRAM_OVERLAY(0) struct SortedUnitEnt * gSortedUnits[0x40];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_7[0x1000];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_8;
extern EWRAM_OVERLAY(0) u32 gUnitlistscreen_9[8]; // equipped item icons

// clang-format off











//! FE8U = 0x080906F8
void UnitListScreenSprites_Init(struct UnitListScreenSpritesProc * proc)
{
    proc->unk_2c = proc->proc_parent;
    proc->unk_3b = 0;
    proc->unk_3c = 0;
    proc->unk_38 = proc->unk_2c->unk_3e;
    proc->unk_3a = 0;

    proc->unk_34 = StartMenuScrollBar(proc);
    PutMenuScrollBarAt(224, 64);
    UpdateMenuScrollBarConfig(10, proc->unk_2c->unk_3e, gUnitlistscreen_8, 6);
    InitMenuScrollBarImg(0x7200, 1);

    ForceSyncUnitSpriteSheet();

    proc->unk_3e = 7;
    proc->unk_40 = 225;
    proc->unk_44 = 0;
    proc->unk_42 = 0;
    proc->unk_48 = 4;
    proc->unk_46 = 4;

    Decompress(gImg_UiSpinningArrow_Horizontal, (void *)0x06010280);

    return;
}
