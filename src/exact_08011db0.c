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

//! FE8U = 0x08011CCC
void ChangeUnitAi(struct Unit * unit, u8 ai1, u8 ai2, u8 unused)
{
    if (unit->state & (US_HIDDEN | US_DEAD))
    {
        return;
    }

    if (ai1 != AI_A_INVALID)
    {
        unit->ai1 = ai1;
        unit->ai_a_pc = 0;
    }

    if (ai2 != AI_B_INVALID)
    {
        unit->ai2 = ai2;
        unit->ai_b_pc = 0;

        if (ai2 == AI_B_0C)
        {
            unit->aiFlags |= AI_UNIT_FLAG_3;
        }
    }

    return;
}
