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

void Shop_NoSendToConvoyDialogue(struct ProcShop * proc)
{
    if (HasConvoyAccess())
    {
        StartShopDialogue(0x867, proc);
        // SHOP_TYPE_ARMORY: "No? Too bad. You could[NL]take it if you made room.[.][A]"
        // SHOP_TYPE_VENDOR: "That's a shame. You could[.][NL]carry it if you made room.[A]"
        // SHOP_TYPE_SECRET_SHOP: "Ah, well... You could take[NL]it if you made room.[A]"
    }
    else
    {
        StartShopDialogue(0x86A, proc);
        // SHOP_TYPE_ARMORY: "Too bad you don't have a[NL]supply convoy to send it to.[A]"
        // SHOP_TYPE_VENDOR: "If you had some storage,[NL]I could send it there...[A]"
        // SHOP_TYPE_SECRET_SHOP: "If you had some storage,[NL]I could send it to you.[.][A]"
    }
}
