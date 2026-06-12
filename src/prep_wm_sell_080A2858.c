#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"
#include "constants/songs.h"

/* prototypes for same-file helpers called by this run */
void WmSell_DrawPartyFunds(void);

//! FE8U = 0x080A05BC
void WmSell_ConfirmSellItem(struct WmSellProc* proc) {
    int count;

    AddPartyGoldAmount(GetItemSellPrice(proc->unit->items[proc->unk_30]));

    proc->unit->items[proc->unk_30] = 0;

    UnitRemoveInvalidItems(proc->unit);

    PlaySoundEffect(SONG_SE_MONEY);

    WmSell_DrawPartyFunds();

    count = GetUnitItemCount(proc->unit);
    if (count == 0) {
        DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &_PrepItemSuppyTexts->textArray[0], proc->unit, 0);

        Proc_Goto(proc, 3);
    } else {
        if (count == proc->unk_30) {
            proc->unk_30 = count - 1;
        }

        Proc_Goto(proc, 1);
    }

    return;
}
