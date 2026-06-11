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

void TalkChoice_OnBuy(void)
{
    struct ProcShop * proc = Proc_Find(gProcScr_Shop);
    if (proc->buy_or_sel != SHOP_ST_BUY)
        ShopInitTexts_OnBuy(proc);
}

void TalkChoice_OnSell(void)
{
    struct ProcShop * proc = Proc_Find(gProcScr_Shop);
    if (proc->buy_or_sel != SHOP_ST_SELL)
        ShopInitTexts_OnSell(proc);
}
