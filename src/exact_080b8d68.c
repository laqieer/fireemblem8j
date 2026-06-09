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

























struct Text gText_GoldBox;

/* prototypes for same-file helpers called by this run */
void StartShopScreen(struct Unit * unit, const u16 * inventory, u8 shopType, ProcPtr parent);

void StartArmoryScreen(struct Unit * unit, u16 * shopItems, ProcPtr parent)
{
    StartShopScreen(unit, shopItems, SHOP_TYPE_ARMORY, parent);
}
