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

// clang-format off

extern struct PlayerInterfaceConfigEntry CONST_DATA sPlayerInterfaceConfigLut[4];

extern s8 CONST_DATA gUnitBurstMapUiTextXTable[6];

extern s8 CONST_DATA gUnitBurstMapUiTextYTable[18];

extern s8 CONST_DATA gUnitBurstMapUiXOffsetTable[6];

extern s8 CONST_DATA gUnitBurstMapUiYOffsetTable[6];

extern u16 * CONST_DATA gPlayerInterface_0[6];

extern u16 * CONST_DATA gPlayerInterface_1[6];









extern struct ProcCmd CONST_DATA gProcScr_TerrainDisplay[];

extern struct ProcCmd CONST_DATA gProcScr_UnitDisplay_MinimugBox[];

extern struct ProcCmd CONST_DATA gProcScr_UnitDisplay_Burst[];

extern struct ProcCmd CONST_DATA gProcScr_SideWindowMaker[];

extern s8 CONST_DATA sGoalSlideInWidthLut[5];



extern struct ProcCmd CONST_DATA gProcScr_GoalDisplay[];

extern struct ProcCmd CONST_DATA gProcScr_PrepMap_MenuButtonDisplay[];

//! FE8U = 0x0808C388
void PutUnitMapUiStatus(u16 * buffer, struct Unit * unit)
{
    int offset;

    int tileIdx = TILEREF(0x16F, 0);

    if (unit == NULL)
    {
        return;
    }

    switch (unit->statusIndex)
    {
    case UNIT_STATUS_POISON:
        offset = 0;
        break;

    case UNIT_STATUS_SLEEP:
        offset = 0xA0;
        break;

    case UNIT_STATUS_SILENCED:
        offset = 0x140;
        break;

    case UNIT_STATUS_BERSERK:
        offset = 0x1E0;
        break;

    case UNIT_STATUS_ATTACK:
        offset = 0x280;
        break;

    case UNIT_STATUS_DEFENSE:
        offset = 0x320;
        break;

    case UNIT_STATUS_CRIT:
        offset = 0x3C0;
        break;

    case UNIT_STATUS_AVOID:
        offset = 0x460;
        break;

    case UNIT_STATUS_PETRIFY:
    case UNIT_STATUS_13:
        offset = 0x500;
        break;

    case UNIT_STATUS_NONE:
    case UNIT_STATUS_SICK:
    case UNIT_STATUS_RECOVER:
        return;

    case UNIT_STATUS_12:
        break;
    }

    CpuFastCopy(gGfx_StatusText + offset, BG_CHR_ADDR(0x16F), 5 * CHR_SIZE);

    buffer[0] = tileIdx++;
    buffer[1] = tileIdx++;
    buffer[2] = tileIdx++;
    buffer[3] = tileIdx++;
    buffer[4] = tileIdx++;
    buffer[5] = 0;
    buffer[6] = TILEREF(0x128 + unit->statusDuration, 1);

    return;
}
