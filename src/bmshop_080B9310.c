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
void RegisterShopState(u16 head_loc, u16 item_cnt, u16 lines, u16 hand_loc, int bg2_base, ShopFunc func, struct ProcShop * proc);

void Shop_InitSellState(struct ProcShop * proc)
{
    RegisterShopState(
        proc->head_loc,
        proc->unitItemCount,
        5,
        0,
        72,
        ShopDrawSellItemLine,
        proc);
}
