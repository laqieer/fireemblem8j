#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "icon.h"
#include "bmitemuse.h"
#include "face.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "sysutil.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809B830
void DrawPrepScreenItemIcons(u16 * tm, struct Unit* unit) {
    int i;

    int itemCount = GetUnitItemCount(unit);

    for (i = 0; i < itemCount; i++) {
        DrawIcon(tm + i * 0x40, GetItemIconId(unit->items[i]), 0x4000);
    }

    return;
}
