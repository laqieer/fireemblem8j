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
extern struct Text * CONST_DATA gpBonusClaimText;
extern struct BonusClaimConfig * CONST_DATA gpBonusClaimConfig;

int LoadBonusContentData(void*);

//! FE8U = 0x080B13BC
void BonusClaim_DrawItemSentPopup(struct BonusClaimProc * proc)
{
    const char* itemNameStr;
    const char* otherStr;
    int width;
    int x;
    struct Text* th;
    char buf[32];
    struct BonusClaimEnt* ent;
    struct BonusClaimEnt* ent2;
    int itemId;

    int idx = gpBonusClaimItemList[proc->menuIndex].unk_00;

    ent = gpBonusClaimData;
    ent += idx;
    itemId = ent->itemId;

    th = gpBonusClaimText + 14;

    gLCDControlBuffer.dispcnt.win0_on = 0;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);

    BonusClaim_DrawMainWindowFrame();

    BG_EnableSyncByMask(3);

    BonusClaim_EndTargetSpriteWorker(proc);

    WriteGameSave(ReadLastGameSaveId());

    proc->timer = 0;
    ClearUiCursorHandConfig(0);

    ShowSysHandCursor(40, proc->menuIndex * 16 + 56 - proc->unk_2c, 19, 0x800);

    ClearText(th);
    Text_SetParams(th, 0, TEXT_COLOR_SYSTEM_WHITE);
    Text_SetCursor(th, 0);

    itemNameStr = GetItemName(itemId);
    otherStr = GetStringFromIndexInBuffer(0x823, buf); // TODO: msgid "Sent[.]"

    width = ((GetStringTextLen(itemNameStr) + GetStringTextLen(otherStr) + 7) / 8) + 4;
    x = 15 - width / 2;

    Text_DrawString(th, itemNameStr);
    Text_DrawString(th, otherStr);

    PutText(th, gBG0TilemapBuffer + x + 0x143);

    DrawIcon(gBG0TilemapBuffer + x + 0x141, GetItemIconId(itemId), 0x4000);

    ent2 = gpBonusClaimData;
    ent2 += idx;
    switch (ent2->kind) {
        case BONUSKIND_ITEM0:
        case BONUSKIND_ITEM1:
            PlaySoundEffect(SONG_5A);
            break;
        case BONUSKIND_MONEY:
            PlaySoundEffect(SONG_SE_MONEY);
            break;
    }

    DrawUiFrame(gBG1TilemapBuffer, x, 10, width, 3, 0, 1);

    gLCDControlBuffer.dispcnt.win0_on = 1;
    gLCDControlBuffer.dispcnt.win1_on = 1;
    gLCDControlBuffer.dispcnt.objWin_on = 0;

    gLCDControlBuffer.wincnt.win0_enableBg0 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg1 = 1;
    gLCDControlBuffer.wincnt.win0_enableBg2 = 0;
    gLCDControlBuffer.wincnt.win0_enableBg3 = 1;
    gLCDControlBuffer.wincnt.win0_enableObj = 0;

    gLCDControlBuffer.win0_left = x * 8;
    gLCDControlBuffer.win0_top = 80;
    gLCDControlBuffer.win0_right = (x + width) * 8;
    gLCDControlBuffer.win0_bottom = 104;

    BG_EnableSyncByMask(3);

    BG_SetPosition(0, 0, -4);

    return;
}
