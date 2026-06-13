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

void TorchSelect_OnIdle(struct WarpSelectProc* proc)
{
    int xTorch = gBmSt.playerCursor.x;
    int yTorch = gBmSt.playerCursor.y;

    int canTorch = gMapRangeSigned[yTorch][xTorch];

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (canTorch)
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            Proc_Break(proc);

            gActionData.xOther = gBmSt.playerCursor.x;
            gActionData.yOther = gBmSt.playerCursor.y;

            SetStaffUseAction(gActiveUnit);

            return;
        }
        else
        {
            PlaySoundEffect(SONG_6C);
        }
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);

        Proc_Goto(proc, 99);

        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    }

    PutMapCursor(
        gBmSt.playerCursorDisplay.x,
        gBmSt.playerCursorDisplay.y,
        TRUE);
}
