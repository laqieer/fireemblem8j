#include "global.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x0809A274
void PrepItem_PutUnitGridSprites(struct PrepItemScreenProc * proc)
{
    int i;

    for (i = 0; i < PrepGetUnitAmount(); i++)
    {
        int x = (i % 3) * 64;
        u32 y = (i / 3) * 16 - proc->scrollOffset;

        if (y + 20 > 68)
        {
            continue;
        }

        if (proc->unitSelected && IsCoordHiddenByMinimug(x, y))
        {
            continue;
        }

        if (gGMData.state.bits.state_0 && GetGMapBaseMenuKind() == SHOP_TYPE_SECRET_SHOP)
        {
            PutClassSpriteForSecretShop(GetUnitFromPrepList(i), (x + 24) & 0xffff, (y + 4) & 0xff);
        }
        else
        {
            PutUnitSprite(0, (x + 24), (y + 4) & 0xff, GetUnitFromPrepList(i));
        }
    }

    SyncUnitSpriteSheet();

    return;
}
