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

int ShopTryScrollPage(int head_loc, int total, int lines, int hand_loc)
{
    int * _head_loc_bak = &sShopState.head_loc_bak;
    int __head_loc_bak = *_head_loc_bak;

    *_head_loc_bak = head_loc;

    if (head_loc == __head_loc_bak || lines > total)
        return false;

    if (head_loc < __head_loc_bak)
    {
        if ((hand_loc != 0) && ((head_loc - hand_loc) < 1))
            return -1;
    }
    else if (((lines + hand_loc) != total) && ((head_loc - hand_loc) >= (lines - 1)))
        return +1;

    return false;
}
