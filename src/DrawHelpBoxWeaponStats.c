#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "face.h"
#include "scene.h"
#include "bmio.h"
#include "bmlib.h"
#include "savemenu.h"
#include "cgtext.h"
#include "helpbox.h"
#include "constants/songs.h"

void DrawHelpBoxWeaponStats(int item)
{
    Text_InsertDrawString(&gHelpBoxSt.text[0], 12, 7, GetItemDisplayRankString(item)) /* JP x12 (US 32) */;
    Text_InsertDrawString(&gHelpBoxSt.text[0], 57, 7, GetItemDisplayRangeString(item)) /* JP x57 (US 67) */;
    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[0], 129, 7, GetItemWeight(item));

    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[1], 32, 7, GetItemMight(item));
    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[1], 81, 7, GetItemHit(item));
    Text_InsertDrawNumberOrBlank(&gHelpBoxSt.text[1], 129, 7, GetItemCrit(item));
}
