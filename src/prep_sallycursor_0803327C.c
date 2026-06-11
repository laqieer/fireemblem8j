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





/* prototypes for same-file helpers called by this run */
void EndPrepScreenMenu_(void);

//! FE8U = 0x0803336C
void PrepMapMenu_OnFormation(struct ProcPrepSallyCursor * proc)
{
    s16 x;
    s16 y;

    proc->lastCmd = PREP_MAPMENU_FORMATION;

    x = gBmSt.playerCursor.x;
    y = gBmSt.playerCursor.y;

    TrySwitchViewedUnit(x, y);

    x = gBmSt.playerCursorDisplay.x;
    y = gBmSt.playerCursorDisplay.y;

    PutMapCursor(x, y, 0);

    Proc_Break(proc);
    EndPrepScreenMenu_();

    return;
}

//! FE8U = 0x080333A4
bool PrepMapMenu_OnStartPress(ProcPtr proc)
{
    if (PrepGetDeployedUnitAmt() == 0)
    {
        return false;
    }

    Proc_Goto(proc, PL_SALLYCURSOR_END_PREP);

    return true;
}
