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

void DrawShopItemPriceLine(struct Text * th, int item, struct Unit * unit, u16 * dst)
{
    int unuseable;

    int price = GetItemPurchasePrice(unit, item);

    if (unit == 0)
        unuseable = true;
    else
        unuseable = IsItemDisplayUsable(unit, item);

    DrawItemMenuLine(th, item, unuseable, dst);

    PutNumber(
        dst + 0x11,
        (int)GetPartyGoldAmount() >= price
            ? TEXT_COLOR_SYSTEM_BLUE
            : TEXT_COLOR_SYSTEM_GRAY,
        price
    );
}
