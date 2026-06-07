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

























struct ShopState * CONST_DATA gShopState = &sShopState;
struct Text gText_GoldBox;

/* prototypes for same-file helpers called by this run */
int ShopTryMoveHand(int pos, int pre, bool hscroll_en);
void ShopSt_SetHeadLocBak(int unk);
int ShopTryScrollPage(int head_loc, int total, int lines, int hand_loc);

int ShopUpdateBg2Offset(int off, int tar, int trig)
{
    int ret, diff = off - tar;

    if (diff >= 0)
    {
        if (diff < trig)
            return tar;

        diff = tar - off;
    }
    else
    {
        diff = tar - off;
        if (diff < trig)
            return tar;
    }

    if (diff <= 0)
    {
        ret = off;
        if (diff < 0)
            ret = off - trig;
    }
    else
    {
        ret = off + trig;
    }

    off = ret;
    return off;
}

void RegisterShopState(u16 head_loc, u16 item_cnt, u16 lines, u16 hand_loc, int bg2_base, ShopFunc func, struct ProcShop * proc)
{

    ShopSt_SetHeadLocBak(head_loc);

    gShopState->head_loc = head_loc;
    gShopState->item_cnt = item_cnt;
    gShopState->lines = lines;
    gShopState->hand_loc = hand_loc;
    gShopState->px_per_line = 16;
    gShopState->trig = 4;
    gShopState->draw_line = func;
    gShopState->proc = proc;
    gShopState->bg2_base = -bg2_base;
    gShopState->bg2_off = hand_loc * 16;
}

void Shop_TryMoveHandPage(void)
{

    gShopState->head_loc = ShopTryMoveHand(gShopState->head_loc, gShopState->item_cnt, 0);

    switch (ShopTryScrollPage(gShopState->head_loc, gShopState->item_cnt, gShopState->lines, gShopState->hand_loc)) {
    case 0:
        break;

    case +1:
        gShopState->hand_loc++;
        gShopState->draw_line(gShopState->proc, gShopState->hand_loc + gShopState->lines - 1);
        break;

    case -1:
        gShopState->hand_loc--;
        gShopState->draw_line(gShopState->proc, gShopState->hand_loc);
        break;
    }

    gShopState->bg2_off = ShopUpdateBg2Offset(
                            gShopState->bg2_off,
                            gShopState->hand_loc * gShopState->px_per_line,
                            gShopState->trig);
}

u16 ShopSt_GetHeadLoc(void)
{
    return gShopState->head_loc;
}

int ShopSt_GetBg2Offset(void)
{
    return gShopState->bg2_base + gShopState->bg2_off;
}

u16 ShopSt_GetHandLoc(void)
{
    return gShopState->hand_loc;
}

void ShopSt_SetLineHeight(int px)
{
    gShopState->px_per_line = px;
}

void ShopSt_SetSetPageScrollTrigOffset(int trig)
{
    gShopState->trig = trig;
}
