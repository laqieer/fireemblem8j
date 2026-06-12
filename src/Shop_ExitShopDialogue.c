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

void Shop_ExitShopDialogue(struct ProcShop * proc)
{

    if (proc->unit == 0) {
        StartShopDialogue(0x838, proc);
        // SHOP_TYPE_ARMORY: "Come back again.[A]"
        // SHOP_TYPE_VENDOR: "Hope to see you again![A]"
        // SHOP_TYPE_SECRET_SHOP: "[N/A]"
    } else {
        StartShopDialogue(0x858, proc);
        // SHOP_TYPE_ARMORY: "Come back again.[A]"
        // SHOP_TYPE_VENDOR: "Drop in again.[A]"
        // SHOP_TYPE_SECRET_SHOP: "Hee hee... Buh-bye![.][A]"
    }
}
