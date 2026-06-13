#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "ap.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmbattle.h"
#include "bmtarget.h"
#include "bmtrick.h"
#include "uiutils.h"
#include "uimenu.h"
#include "uiselecttarget.h"
#include "playerphase.h"
#include "bb.h"
#include "face.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "bmmenu.h"
#include "menu_def.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/terrains.h"
#include "bmitemuse.h"
#include "constants/songs.h"

void WarpSelect_OnIdle(struct WarpSelectProc* proc)
{
    int warpAllowed = gMapMovementSigned[gBmSt.playerCursor.y][gBmSt.playerCursor.x] != -1;

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (warpAllowed)
        {
            Proc_Break(proc);

            gActionData.xOther = gBmSt.playerCursor.x;
            gActionData.yOther = gBmSt.playerCursor.y;

            SetStaffUseAction(gActiveUnit);

            BG_Fill(gBG2TilemapBuffer, 0);
            BG_EnableSyncByMask(BG2_SYNC_BIT);

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            return;
        }
        else
        {
            PlaySoundEffect(SONG_6C);
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        Proc_Goto(proc, 99);

        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);

        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    }

    if (warpAllowed != proc->prevWarpAllowed)
    {
        AP_SwitchAnimation(proc->ap, warpAllowed ? 0 : 1);
    }

    AP_Update(proc->ap,
        gBmSt.playerCursorDisplay.x - gBmSt.camera.x,
        gBmSt.playerCursorDisplay.y - gBmSt.camera.y);

    proc->prevWarpAllowed = warpAllowed;
}
