#include "global.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "player_interface.h"
#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

//! FE8U = 0x0808CE50
void MMB_CheckForUnit(struct PlayerInterfaceProc * proc)
{
    struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

    if (unit == NULL)
    {
        Proc_Goto(proc, 3);
    }
    else
    {
        DrawUnitMapUi(proc, unit);
        PutUnitMapUiWindow(proc);
    }

    return;
}
