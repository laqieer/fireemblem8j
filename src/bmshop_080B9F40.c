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



















extern struct ProcCmd CONST_DATA gProcScr_GoldBox[];




extern EWRAM_DATA struct ShopState sShopState;
extern struct ShopState * CONST_DATA gShopState;
struct Text gText_GoldBox;

/* prototypes for same-file helpers called by this run */
void UpdateShopItemCounts(struct ProcShop * proc);
void DisplayGoldBoxText(u16 * tm);
void DrawShopSoldItems(struct ProcShop * proc);
u16 GetItemPurchasePrice(struct Unit * unit, int item);

void UnpackUiVArrowGfx(int chr, int pal)
{
    Decompress(Img_SpinningArrow, OBJ_VRAM0 + CHR_SIZE * OBJ_CHAR(chr));
    ApplyPalette(Pal_SpinningArrow, pal + 0x10);
}

void DisplayUiVArrow(int x, int y, u16 oam2Base, int flip_en)
{
    int vflip;
    int offset = Div(DivRem(GetGameClock(), 40), 8) * 2;

    vflip = 0;
    if (flip_en == 0)
        vflip = ATTR1_FLIP_Y;

    PutSpriteExt(
        2,
        x | vflip,
        y,
        gObject_16x8,
        (oam2Base) + offset
    );
}

void HandleShopBuyAction(struct ProcShop * proc)
{
    PlaySeDelayed(0xB9, 8);

    gActionData.unitActionType = UNIT_ACTION_SHOPPED;

    SetPartyGoldAmount(
        GetPartyGoldAmount() - GetItemPurchasePrice(proc->unit, proc->shopItems[proc->head_loc]));

    UpdateShopItemCounts(proc);
    DrawShopSoldItems(proc);

    DisplayGoldBoxText(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 6));
}
