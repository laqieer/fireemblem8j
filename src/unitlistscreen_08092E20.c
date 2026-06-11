#include "global.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "constants/songs.h"

//! FE8U = 0x08090B48
void UnitList_AddUnit(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int supporterCount;
    int i;
    int supportCountNow;

    if ((unit->state & US_NOT_DEPLOYED) == 0)
    {
        proc->deployedCount++;
    }

    gSortedUnitsBuf[gUnitlistscreen_8].unit = unit;

    BattleGenerateUiStats(unit, -1);

    gSortedUnitsBuf[gUnitlistscreen_8].battleAttack = ((gBattleActor.battleAttack + 1) & 0xff) - 1;
    gSortedUnitsBuf[gUnitlistscreen_8].battleHitRate = ((gBattleActor.battleHitRate + 1) & 0xff) - 1;
    gSortedUnitsBuf[gUnitlistscreen_8].battleAvoidRate = ((gBattleActor.battleAvoidRate + 1) & 0xff) - 1;

    supporterCount = GetUnitSupporterCount(unit);
    supportCountNow = 0;

    for (i = 0; i < supporterCount; i++)
    {
        if (CanUnitSupportNow(unit, i))
        {
            supportCountNow++;
        }
    }

    if (supportCountNow > 3)
    {
        if (proc->unk_2e < ((supportCountNow - 1) / 3) + 6)
        {
            proc->unk_2e = ((supportCountNow - 1) / 3) + 6;
        }
    }

    gSortedUnitsBuf[gUnitlistscreen_8].supportCount = supportCountNow;
    gSortedUnits[gUnitlistscreen_8] = &gSortedUnitsBuf[gUnitlistscreen_8];

    gUnitlistscreen_8++;

    UseUnitSprite(GetUnitSMSId(unit));

    return;
}
