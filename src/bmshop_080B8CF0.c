#include "global.h"

#include "bmunit.h"
#include "player_interface.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "uiutils.h"
#include "bmcontainer.h"
#include "mu.h"
#include "icon.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"
#include "bmmind.h"
#include "scene.h"
#include "prepscreen.h"
#include "bmshop.h"
#include "bmlib.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "gba_sprites.h"
#include "constants/faces.h"
#include "constants/items.h"
#include "constants/songs.h"

extern u16 CONST_DATA gDefaultShopInventory[];

int CONST_DATA gShopDialogueOffsetLut[] = {
    [SHOP_TYPE_ARMORY]      = 0,
    [SHOP_TYPE_VENDOR]      = 1,
    [SHOP_TYPE_SECRET_SHOP] = 2
};



extern struct ProcCmd CONST_DATA gProcScr_ShopFadeIn[];

extern struct ProcCmd CONST_DATA gProcScr_ShopFadeOut[];

extern struct ProcCmd CONST_DATA gProcScr_Shop[];

extern struct ProcCmd CONST_DATA ProcScr_ShopBuyInit[];

extern struct ProcCmd CONST_DATA ProcScr_ShopSellInit[];



extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];



extern EWRAM_DATA struct Text gShopItemTexts[SHOP_TEXT_LINES + 1];
extern EWRAM_DATA struct ShopState sShopState;
extern struct ShopState * CONST_DATA gShopState;
extern struct Text gText_GoldBox;

void StartShopDialogue(int baseMsgId, struct ProcShop * proc)
{
    int msgId = baseMsgId + gShopDialogueOffsetLut[proc->shopType];

    SetInitTalkTextFont();
    ClearTalkText();

    StartTalkExt(8, 2, GetStringFromIndex(msgId), proc);

    SetTalkPrintColor(0);

    SetTalkFlag(TALK_FLAG_INSTANTSHIFT);
    SetTalkFlag(TALK_FLAG_NOBUBBLE);
    SetTalkFlag(TALK_FLAG_NOSKIP);

    SetActiveTalkFace(1);
}
