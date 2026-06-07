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

//! FE8U = 0x08033458
void PrepMapMenu_OnSave(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_SAVE;
    Proc_Goto(proc, PL_SALLYCURSOR_SAVE);
    return;
}

//! FE8U = 0x08033468
void PrepMapMenu_OnDebug_Unused(struct ProcPrepSallyCursor * proc)
{
    proc->lastCmd = PREP_MAPMENU_DEBUG;
    EndPrepScreenMenu_();
    StartOrphanMenu(&gDebugMenuDef);
    Proc_Goto(proc, PL_SALLYCURSOR_POST_DEBUG_MENU);
    return;
}

//! FE8U = 0x0803348C
void PrepScreenProc_SetCameraOnSupply(ProcPtr proc)
{
    EnsureCameraOntoPosition(
        proc, GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosX,
        GetROMChapterStruct(gPlaySt.chapterIndex)->merchantPosY);
    return;
}
