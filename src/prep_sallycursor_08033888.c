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

//! FE8U = 0x08033978
void PrepScreenProc_MapIdle(struct ProcPrepSallyCursor * proc)
{
    HandlePlayerCursorMovement();
    if (!DoesBMXFADEExist())
    {
        if (gKeyStatusPtr->newKeys & L_BUTTON)
        {
            TrySwitchViewedUnit(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }
        else
        {
            if (gKeyStatusPtr->newKeys & R_BUTTON)
            {
                if (gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])
                {
                    if (CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])))
                    {
                        EndAllMus();
                        EndPlayerPhaseSideWindows();
                        SetStatScreenConfig(
                            STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                            STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
                        StartStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]), proc);
                        Proc_Goto(proc, PL_SALLYCURSOR_POST_STATSCREEN_IDLE);
                        return;
                    }
                }
            }

            if (gKeyStatusPtr->newKeys & B_BUTTON)
            {
                EndPlayerPhaseSideWindows();
                gPlaySt.xCursor = gBmSt.playerCursor.x;
                gPlaySt.yCursor = gBmSt.playerCursor.y;
                Proc_Goto(proc, PL_SALLYCURSOR_OPEN_MAP_MENU);
                PlaySoundEffect(SONG_69);
                return;
            }

            if (gKeyStatusPtr->newKeys & A_BUTTON)
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

                switch (GetPlayerSelectKind(unit))
                {
                    case PLAYER_SELECT_NOUNIT:
                    case PLAYER_SELECT_TURNENDED:
                        EndPlayerPhaseSideWindows();
                        gPlaySt.xCursor = gBmSt.playerCursor.x;
                        gPlaySt.yCursor = gBmSt.playerCursor.y;

                        switch (gBmMapTerrain[gBmSt.playerCursor.y][gBmSt.playerCursor.x])
                        {
                            case TERRAIN_VENDOR:
                            case TERRAIN_ARMORY:
                                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                                Proc_Goto(proc, PL_SALLYCURSOR_SHOP);
                                return;
                            default:
                                Proc_Goto(proc, PL_SALLYCURSOR_OPEN_MAP_MENU);
                                PlaySoundEffect(SONG_69);
                                return;
                        }

                    case PLAYER_SELECT_CONTROL:
                        UnitBeginAction(unit);
                        gActiveUnit->state &= ~(US_HIDDEN);

                        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
                        {
                            Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SWAP);
                            return;
                        }

                        Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SELECTED);

                        return;

                    case PLAYER_SELECT_4:
                        if (proc->lastCmd == PREP_MAPMENU_FORMATION)
                        {
                            PlaySoundEffect(SONG_6C);
                            return;
                        }

                        // fallthrough

                    case PLAYER_SELECT_NOCONTROL:
                        UnitBeginAction(unit);
                        gActiveUnit->state &= ~(US_HIDDEN);

                        Proc_Goto(proc, PL_SALLYCURSOR_UNIT_SELECTED);

                        return;
                }
            }

            if (gKeyStatusPtr->newKeys & START_BUTTON)
            {
                EndPlayerPhaseSideWindows();
                StartMinimapPrepPhase(proc);
                Proc_Goto(proc, PL_SALLYCURSOR_MAP_IDLE);
                return;
            }
        }
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 0);

    return;
}
