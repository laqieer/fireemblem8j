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





//! FE8U = 0x08034090
void PrepScreenProc_RefreshAfterStatScreen(ProcPtr proc)
{
    if (gActiveUnit == NULL)
    {
        RefreshBMapGraphics();
        Proc_Goto(proc, PL_SALLYCURSOR_0C); // NOTE: Label does not exist
        return;
    }

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = gActiveUnit->index;
    gActiveUnit->state &= ~US_HIDDEN;

    RefreshBMapGraphics();

    gBmMapUnit[gActiveUnit->yPos][gActiveUnit->xPos] = 0;
    gActiveUnit->state |= US_HIDDEN;

    Proc_Goto(proc, PL_SALLYCURSOR_0B);

    return;
}

//! FE8U = 0x0803410C
void StartPrepSaveScreen(ProcPtr proc)
{
    gPlaySt.save_menu_type = 2;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_COMPLETE))
    {
        u32 mapKind = GetBattleMapKind();
        if (mapKind == BATTLEMAP_KIND_DUNGEON || mapKind == BATTLEMAP_KIND_SKIRMISH)
        {
            gPlaySt.save_menu_type = 4;
        }
    }

    StartBgmVolumeChange(0x100, 0x80, 0x20, NULL);
    SyncUnitDeploymentState();
    Make6C_SaveMenuPostChapter(proc);

    return;
}

//! FE8U = 0x08034168
void PrepScreenProc_RestoreBgmAfterSave(void)
{
    StartBgmVolumeChange(0x80, 0x100, 0x20, NULL);
    gPlaySt.save_menu_type = 2;
    return;
}
