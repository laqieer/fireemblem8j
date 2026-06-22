#include "global.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmtrick.h"
#include "event.h"
#include "hardware.h"
#include "prepscreen.h"
#include "ekrbattle.h"
#include "bmmap.h"
#include "bksel.h"
#include "chapterdata.h"

//! FE8U = 0x0800BF3C
struct Unit * GetUnitStructFromEventParameter(s16 pid)
{
    int p = pid;

    if (p < -3)
        return NULL;

    switch (p) {
    case CHAR_EVT_SLOT2:
    {
        s16 * slots = (s16 *)gEventSlots;
        p = slots[4];
    }
        break;

    case CHAR_EVT_POSITION_AT_SLOTB:
    {
        struct Unit * ptr;

        if (gBmMapUnit[((u16 *)(gEventSlots + 0xB))[1]][((u16 *)(gEventSlots + 0xB))[0]] != 0)
        {
            ptr = GetUnit(gBmMapUnit[((u16 *)(gEventSlots + 0xB))[1]][((u16 *)(gEventSlots + 0xB))[0]]);
        }
        else
        {
            ptr = NULL;
        }

        return ptr;
    }

    case CHAR_EVT_ACTIVE_UNIT:
        return gActiveUnit;

    case CHAR_EVT_PLAYER_LEADER:
        p = (s16)GetPlayerLeaderPid();
        break;
    }

    return GetUnitFromCharId(p);
}
