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



extern struct ProcCmd CONST_DATA gProcScr_SALLYCURSOR[];

/* prototypes for same-file helpers called by this run */
int GetPlayerLeaderPid(void);

//! FE8U = 0x080338C0
void InitPrepScreenCursorPosition(void)
{
    const struct UnitDefinition * uDef;
    s8 x;
    s8 y;

    struct Unit * unit = GetUnitFromCharId(GetPlayerLeaderPid());

    if (unit != NULL && PrepGetDeployedUnitAmt() != 0)
    {
        SetCursorMapPosition(unit->xPos, unit->yPos);
    }
    else
    {
        uDef = GetChapterAllyUnitDataPointer();
        uDef = uDef + CalcForceDeployedUnitCounts();
        GenUnitDefinitionFinalPosition(uDef, &x, &y, false);
        SetCursorMapPosition(x, y);
    }

    gBmSt.camera.x = GetCameraCenteredX(gBmSt.playerCursor.x * 16);
    gBmSt.camera.y = GetCameraCenteredY(gBmSt.playerCursor.y * 16);

    return;
}
