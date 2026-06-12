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

extern struct BonusClaimEnt * CONST_DATA gpBonusClaimData;
extern struct BonusClaimEnt * CONST_DATA gpBonusClaimDataUpdated;
extern struct BonusClaimItemEnt * CONST_DATA gpBonusClaimItemList;
extern int* CONST_DATA gpBonusClaimItemCount;
extern struct BonusClaimConfig * CONST_DATA gpBonusClaimConfig;

int LoadBonusContentData(void*);

/* prototypes for same-file helpers called by this run */
void BonusClaim_DrawMainWindowFrame(void);
void BonusClaim_EndTargetSpriteWorker(struct BonusClaimProc * proc);

//! FE8U = 0x080B1350
void BonusClaim_EndSelectTargetSubMenu(struct BonusClaimProc * proc){
    BonusClaim_EndTargetSpriteWorker(proc);

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG0TilemapBuffer, 0);

    BonusClaim_DrawMainWindowFrame();

    BG_EnableSyncByMask(3);

    ClearUiCursorHandConfig(0);

    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    return;
}
