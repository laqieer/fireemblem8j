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





int CONST_DATA gShopPortraitLut[] = {
    [SHOP_TYPE_ARMORY]      = FID_SHOP_ARMORY,
    [SHOP_TYPE_VENDOR]      = FID_SHOP_VENDOR,
    [SHOP_TYPE_SECRET_SHOP] = FID_SHOP_SECRET
};



















struct Text gText_GoldBox;

int Shop_GetPortraitIndex(struct ProcShop * proc)
{
    return gShopPortraitLut[proc->shopType];
}
