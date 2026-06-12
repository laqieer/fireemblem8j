#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809D644
void PrepItemSupply_DrawGiveTakeText(struct PrepItemSupplyProc * proc)
{
    int color;
    struct Text* th;

    int convoyItemCount = GetConvoyItemCount_();
    int unitItemCount = GetUnitItemCount(proc->unit);

    SetTextFont(&PrepItemSuppyTexts.font);
    SetTextFontGlyphs(0);

    SpriteText_DrawBackgroundExt(&PrepItemSuppyTexts.th[0xf], 0);
    th = &PrepItemSuppyTexts.th[0xf];

    color = 0;
    if ((convoyItemCount == CONVOY_ITEM_COUNT) || (unitItemCount == 0))
        color = 1;

    Text_InsertDrawString(
        th,
        0,
        color,
        GetStringFromIndex(0x529) // TODO: msgid "Give"
    );

    Text_InsertDrawString(
        &PrepItemSuppyTexts.th[0xf],
        0x40,
        unitItemCount == UNIT_ITEM_COUNT ? 1 : 0,
        GetStringFromIndex(0x52A) // TODO: msgid "Take"
    );

    SetTextFont(NULL);
}
