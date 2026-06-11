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





//! FE8U = 0x08033F34
void PrepScreenProc_MapMovementLoop(ProcPtr proc)
{
    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
    {
        EndAllMus();
        gActiveUnit->state &= ~US_HIDDEN;
        gBmSt.gameStateBits &= ~BM_FLAG_3;

        HideMoveRangeGraphics();
        RefreshEntityBmMaps();
        RefreshUnitSprites();

        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        Proc_Goto(proc, PL_SALLYCURSOR_MAP_IDLE);
        return;
    }

    if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        u8 uid = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

        if (gActiveUnitMoveOrigin.x == gBmSt.playerCursor.x && gActiveUnitMoveOrigin.y == gBmSt.playerCursor.y)
        {
            uid = gActiveUnit->index;
        }

        if (uid != 0)
        {
            struct Unit * unit = GetUnit(uid);
            if (CanShowUnitStatScreen(unit))
            {
                EndAllMus();
                SetStatScreenConfig(
                    STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                    STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
                StartStatScreen(GetUnit(uid), proc);
                Proc_Goto(proc, PL_SALLYCURSOR_POST_STATSCREEN_MOVE);
            }
        }
    }

    if (gKeyStatusPtr->newKeys & L_BUTTON)
    {
        if (gActiveUnit)
        {
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 1);

    return;
}
