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





//! FE8U = 0x08033DD8
void PrepScreenProc_RecenterOnActiveUnit(ProcPtr proc)
{
    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);
    EnsureCameraOntoPosition(proc, gActiveUnit->xPos, gActiveUnit->yPos);
    return;
}

//! FE8U = 0x08033E08
void PrepScreen_StartUnitSwapAnim(ProcPtr proc)
{
    struct Unit * activeUnit = gActiveUnit;
    struct Unit * targetUnit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);
    if (targetUnit == NULL)
    {
        StartPrepUnitSwap(proc, activeUnit, gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    }
    else
    {
        StartPrepUnitSwap(proc, activeUnit, targetUnit->xPos, targetUnit->yPos);
        StartPrepUnitSwap(proc, targetUnit, activeUnit->xPos, activeUnit->yPos);
    }

    PlaySoundEffect(SONG_61);
    return;
}

//! FE8U = 0x08033E8C
void InitMapChangeGraphicsIfFog(void)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderBmMapOnBg2();
    }

    return;
}

//! FE8U = 0x08033EA4
void DisplayMapChangeIfFog(void)
{
    if (gPlaySt.chapterVisionRange != 0)
    {
        RenderBmMap();
        NewBMXFADE(0);
    }

    return;
}

//! FE8U = 0x08033EC0
void PrepScreenProc_StartConfigMenu(ProcPtr proc)
{
    Proc_StartBlocking(ProcScr_Config_PrepMapMenu, proc);
    return;
}
