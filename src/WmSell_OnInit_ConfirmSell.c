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
void WmSell_ShowDialoguePrompt(int index, ProcPtr parent);

void WmSell_OnInit_ConfirmSell(struct WmSellProc* proc) {
    proc->unk_31 = 1;

    StartParallelWorker(WmSell_DrawSellOptionSpriteText, proc);

    SetUiCursorHandConfig(0, 16, proc->unk_30 * 16 + 72, 2);
    ShowSysHandCursor(proc->unk_31 * 32 + 164, 111, 0, 0x400);
    WmSell_ShowDialoguePrompt(1, proc);

    return;
}
