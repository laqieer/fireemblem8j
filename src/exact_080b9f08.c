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
void DisplayUiVArrow(int x, int y, u16 oam2Base, int flip_en);
bool ShouldDisplayUpArrow(void);
bool ShouldDisplayDownArrow(void);

void DisplayShopUiArrows(void)
{
    if (ShouldDisplayUpArrow())
        DisplayUiVArrow(
            120, 64,
            OBJ_PALETTE(OBJPAL_SHOP_SPINARROW) + OBJ_CHAR(OBJCHR_SHOP_SPINARROW),
            true);

    if (ShouldDisplayDownArrow())
        DisplayUiVArrow(
            120, 152,
            OBJ_PALETTE(OBJPAL_SHOP_SPINARROW) + OBJ_CHAR(OBJCHR_SHOP_SPINARROW),
            false);
}
