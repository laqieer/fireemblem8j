#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "chapterdata.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "bmusemind.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmmind.h"
#include "bmbattle.h"
#include "mu.h"
#include "ekrbattle.h"
#include "mapanim.h"
#include "bmtrick.h"
#include "ctc.h"
#include "muctrl.h"
#include "cgtext.h"
#include "eventcall.h"
#include "constants/items.h"

extern struct Unknown03000600 gUnk_38[0x40];

void LoadUnitWordStructs(void)
{
    struct Unknown03000600 * it;

    for (it = gUnk_38; it->pid != 0; it++)
    {
        struct Unit * unit = GetUnitFromCharId(it->pid);
        unit->xPos = it->x;
        unit->yPos = it->y;

        if (it->x < 0)
        {
            unit->state |= US_NOT_DEPLOYED;
        }
        else
        {
            unit->state &= ~(US_NOT_DEPLOYED);
        }
    }
    return;
}
