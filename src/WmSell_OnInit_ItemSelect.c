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



void WmSell_DrawSellOptionSpriteText(void);
void WmSell_DrawItemGoldValue(int item);
void WmSell_ShowDialoguePrompt(int index, ProcPtr parent);

void WmSell_OnInit_ItemSelect(struct WmSellProc* proc) {
    DrawPrepScreenItems(gBG0TilemapBuffer + 0x122, &_PrepItemSuppyTexts->textArray[0], proc->unit, 0);

    WmSell_DrawItemGoldValue(proc->unit->items[proc->unk_30]);

    ClearUiCursorHandConfig(0);

    Proc_End(GetParallelWorker(WmSell_DrawSellOptionSpriteText));

    ShowSysHandCursor(16, proc->unk_30 * 16 + 72, 11, 0x400);
    WmSell_ShowDialoguePrompt(0, proc);

    return;
}
