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

















u16 CONST_DATA Sprite_ShopGoldBox[] = {
    6,
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8, OAM2_LAYER(1),
    OAM0_SHAPE_32x8, OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x2) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8, OAM2_CHR(0x6) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(8), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0x8) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8, OAM2_CHR(0xC) + OAM2_LAYER(1),
    OAM0_SHAPE_32x8 + OAM0_Y(16), OAM1_SIZE_32x8 + OAM1_X(32), OAM2_CHR(0xE) + OAM2_LAYER(1),
};

extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];




extern EWRAM_DATA struct ShopState sShopState;
extern struct ShopState * CONST_DATA gShopState;
struct Text gText_GoldBox;

/* prototypes for same-file helpers called by this run */
u16 GetItemSellPrice(int item);

bool IsItemSellable(int item)
{
    if (GetItemAttributes(item) & IA_UNSELLABLE)
        return false;

    if (GetItemSellPrice(item) == 0)
        return false;

    return true;
}

void GoldBox_OnLoop(struct ProcShop * proc)
{
    CallARM_PushToSecondaryOAM(
        proc->goldbox_x,
        proc->goldbox_y,
        Sprite_ShopGoldBox,
        proc->goldbox_oam2);
}

void InitShopScreenConfig(void)
{
    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 0, 0);

    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    ResetText();
    LoadUiFrameGraphics();
    ResetIconGraphics_();
    LoadIconPalettes(BGPAL_SHOP_4);
    LoadHelpBoxGfx(0, -1);
}
