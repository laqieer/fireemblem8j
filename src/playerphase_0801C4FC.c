#include "global.h"

#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmmap.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "statscreen.h"
#include "bmidoten.h"
#include "bmpatharrowdisp.h"
#include "event.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "prepscreen.h"
#include "bmtrick.h"
#include "bmio.h"
#include "hardware.h"
#include "bmphase.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "minimap.h"
#include "player_interface.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "eventinfo.h"

#include "playerphase.h"

#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

// clang-format off

extern struct ProcCmd CONST_DATA gProcScr_PlayerPhase[];



/* The move-limit-view open animation is 6 uniform frames of 4 tiles (32x8 px) each. */
#define LIMIT_VIEW_FRAME_SIZE (4 * CHR_SIZE)

extern u8 * CONST_DATA gOpenLimitViewImgLut[];





// clang-format on

//! FE8U = 0x0801C894
void PlayerPhase_Suspend(void)
{
    gActionData.suspendPointType = SUSPEND_POINT_PLAYERIDLE;
    WriteSuspendSave(SAVE_ID_SUSPEND);
    return;
}

//! FE8U = 0x0801C8AC
void HandlePlayerCursorMovement(void)
{
    if ((gKeyStatusPtr->heldKeys & B_BUTTON) && !(gBmSt.playerCursorDisplay.x & 7) &&
        !(gBmSt.playerCursorDisplay.y & 7))
    {
        HandleMapCursorInput(gKeyStatusPtr->newKeys2);

        HandleMoveMapCursor(8);
        HandleMoveCameraWithMapCursor(8);
    }
    else
    {
        HandleMapCursorInput(gKeyStatusPtr->repeatedKeys);

        HandleMoveMapCursor(4);
        HandleMoveCameraWithMapCursor(4);
    }

    if (((gBmSt.playerCursorDisplay.x | gBmSt.playerCursorDisplay.y) & 0xF) != 0)
    {
        gKeyStatusPtr->newKeys &= ~(A_BUTTON | B_BUTTON | START_BUTTON | R_BUTTON | L_BUTTON);
    }

    return;
}
