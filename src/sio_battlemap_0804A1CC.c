#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

/* prototypes for same-file helpers called by this run */
int LinkArenaBattleMap_FindUnitSlot(u8 target);

//! FE8U = 0x080493D0
void LinkArenaBattleMap_StartUnitMoveOut(u8 a, int b, u8 * c, int * xOut, int * yOut)
{
    struct Unit * unit;

    // clang-format off

    u8 gUnknown_080D9FA0[8] =
    {
        MOVE_CMD_MOVE_UP,
        MOVE_CMD_HALT,

        MOVE_CMD_MOVE_LEFT,
        MOVE_CMD_HALT,

        MOVE_CMD_MOVE_DOWN,
        MOVE_CMD_HALT,

        MOVE_CMD_MOVE_RIGHT,
        MOVE_CMD_HALT,
    };

    s8 gUnknown_080D9FA8[8] =
    {
        +0, -1,
        -1, +0,
        +0, +1,
        +1, +0,
    };

    // clang-format on

    int var = LinkArenaBattleMap_FindUnitSlot(a);
    int index = Div(var, 5) << 1;

    *c = var;

    unit = GetUnit(gUnk_42[var]);

    if ((unit->state & US_BIT9) == 0)
    {
        gUnk_46[b] = StartMu(unit);
        DisableMuCamera(gUnk_46[b]);
        SetMuMoveScript(gUnk_46[b], gUnknown_080D9FA0 + index);
    }

    unit->state |= US_HIDDEN;

    RefreshUnitSprites();

    *xOut = unit->xPos + gUnknown_080D9FA8[index + 0];
    *yOut = unit->yPos + gUnknown_080D9FA8[index + 1];

    if ((unit->state & US_BIT9) != 0)
    {
        unit->xPos = *xOut;
        unit->yPos = *yOut;

        *xOut = *xOut - gUnknown_080D9FA8[index + 0];
        *yOut = *yOut - gUnknown_080D9FA8[index + 1];

        gUnk_46[b] = NULL;
    }

    return;
}
