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

void Shop_EntryDialogue(struct ProcShop * proc)
{

    if (!proc->unit)
    {
        Proc_Goto(proc, PL_SHOP_PREP_ENTRY);
    }
    else
    {
        StartShopDialogue(0x83A, proc);
        // SHOP_TYPE_ARMORY: "Welcome to the armory.[A][NL2][NL]I deal in all sorts of goods.[.][NL][BuySell]"
        // SHOP_TYPE_VENDOR: "Welcome to the general store.[.][A][NL2][NL]How can I help you?[.][NL][BuySell]"
        // SHOP_TYPE_SECRET_SHOP: "Shhh... Hee hee...[A][NL2][NL]This is a secret shop![NL][BuySell]"
    }
}
