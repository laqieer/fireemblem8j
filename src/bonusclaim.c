#include "global.h"

#include "ctc.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "uiutils.h"
#include "hardware.h"
#include "fontgrp.h"
#include "icon.h"
#include "bm.h"
#include "bmcontainer.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bonusclaim.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/songs.h"






 // maybe lower








int LoadBonusContentData(void*);

/* prototypes for same-file helpers called by this run */
void BonusClaim_DrawMainWindowFrame(void);

//! FE8U = 0x080B15E8
void BonusClaim_Loop_PopupDisplayTimer(struct BonusClaimProc * proc)
{
    proc->timer++;

    if ((proc->timer > 30) && (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)))
    {
        Proc_Break(proc);
        return;
    }

    if (proc->timer > 120)
        Proc_Break(proc);
}

//! FE8U = 0x080B1620
void BonusClaim_ClearItemSentPopup(void)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BonusClaim_DrawMainWindowFrame();
    BG_EnableSyncByMask(3);
    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;
    BG_SetPosition(0, 0, 0);
}
