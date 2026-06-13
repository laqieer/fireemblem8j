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

//! FE8U = 0x0808C45C
void UnitMapUiUpdate(struct PlayerInterfaceProc * proc, struct Unit * unit)
{
    int frameCount = proc->unitClock;

    if (unit->statusIndex == UNIT_STATUS_RECOVER)
    {
        frameCount = 0;
    }

    if ((frameCount & 63) == 0)
    {
        if ((frameCount & 64) != 0)
        {
            PutUnitMapUiStatus(proc->statusTm, unit);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
        else
        {
            if (GetUnitCurrentHp(unit) >= 100)
            {
                StoreNumberStringOrDashesToSmallBuffer(0xFF);
            }
            else
            {
                StoreNumberStringOrDashesToSmallBuffer(GetUnitCurrentHp(unit));
            }

            proc->hpCurHi = gNumberStr[6] - '0';
            proc->hpCurLo = gNumberStr[7] - '0';

            if (GetUnitMaxHp(unit) >= 100)
            {
                StoreNumberStringOrDashesToSmallBuffer(0xFF);
            }
            else
            {
                StoreNumberStringOrDashesToSmallBuffer(GetUnitMaxHp(unit));
            }

            proc->hpMaxHi = gNumberStr[6] - '0';
            proc->hpMaxLo = gNumberStr[7] - '0';

            ClearUnitMapUiStatus(proc, proc->statusTm, unit);
            BG_EnableSyncByMask(BG0_SYNC_BIT);
        }
    }

    if ((proc->hideContents == false) && ((frameCount & 64) == 0 || (unit->statusIndex == UNIT_STATUS_NONE)))
    {
        int xDigits;
        int yDigits;

        int xDigit1;

        xDigits = proc->xHp * 8;
        xDigit1 = xDigits + 17;

        yDigits = proc->yHp * 8;

        if (proc->hpCurHi != (u8)(' ' - '0'))
        {
            CallARM_PushToSecondaryOAM(xDigit1, yDigits, gObject_8x8, proc->hpCurHi + OAM2_CHR(0x2E0) + OAM2_PAL(8));
        }

        CallARM_PushToSecondaryOAM(xDigits + 24, yDigits, gObject_8x8, proc->hpCurLo + OAM2_CHR(0x2E0) + OAM2_PAL(8));

        if (proc->hpMaxHi != (u8)(' ' - '0'))
        {
            CallARM_PushToSecondaryOAM(
                xDigits + 41, yDigits, gObject_8x8, proc->hpMaxHi + OAM2_CHR(0x2E0) + OAM2_PAL(8));
        }

        CallARM_PushToSecondaryOAM(xDigits + 48, yDigits, gObject_8x8, proc->hpMaxLo + OAM2_CHR(0x2E0) + OAM2_PAL(8));
    }

    return;
}
