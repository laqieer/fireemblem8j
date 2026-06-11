#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "statscreen.h"
#include "ap.h"
#include "proc.h"
#include "eventinfo.h"
#include "bmdifficulty.h"
#include "playerphase.h"
#include "minimap.h"
#include "uichapterstatus.h"
#include "player_interface.h"
#include "bb.h"
#include "bmshop.h"
#include "uiconfig.h"
#include "helpbox.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "muctrl.h"
#include "menu_def.h"
#include "worldmap.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bmsave.h"
#include "bmlib.h"
#include "eventcall.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/terrains.h"
#include "constants/songs.h"

// TODO: Implicit declaration?
int CanShowUnitStatScreen(struct Unit * unit);
int CheckInLinkArena(void);

// clang-format off





// clang-format on

//! FE8U = 0x08033258
int GetPlayerLeaderPid(void)
{
    int i;
    int pid;

    switch (gPlaySt.chapterModeIndex)
    {
        case CHAPTER_MODE_COMMON:
        case CHAPTER_MODE_EIRIKA:
            pid = CHARACTER_EIRIKA;
            break;

        case CHAPTER_MODE_EPHRAIM:
            pid = CHARACTER_EPHRAIM;
            break;
    }

    if ((u8)gPlaySt.chapterIndex == CHAPTER_L_5X)
    {
        return CHARACTER_EPHRAIM;
    }

    do
    {
        struct Unit * unit;

        if (GetBattleMapKind() == BATTLEMAP_KIND_STORY)
        {
            return pid;
        }

        unit = GetUnitFromCharId(pid);

        if (unit != NULL && !(unit->state & US_NOT_DEPLOYED))
        {
            return pid;
        }

        for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
        {
            unit = GetUnit(i);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if (unit->state & US_UNAVAILABLE)
            {
                continue;
            }

            return unit->pCharacterData->number;
        }
    } while (0);

    return pid;
}

//! FE8U = 0x080332D0
void Prep_ShowDeployableTiles(void)
{
    s8 xTmp;
    s8 yTmp;

    const struct UnitDefinition * uDef = GetChapterAllyUnitDataPointer();

    BmMapFill(gBmMapRange, 0);
    BmMapFill(gBmMapMovement, -1);

    uDef += CalcForceDeployedUnitCounts();

    for (; uDef->charIndex != 0; uDef++)
    {
        GenUnitDefinitionFinalPosition(uDef, &xTmp, &yTmp, false);
        gBmMapRange[yTmp][xTmp] = 1;
    }

    DisplayMoveRangeGraphics(0x10);

    return;
}
