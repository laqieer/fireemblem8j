#include "global.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "player_interface.h"
#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

//! FE8U = 0x0808D200
void DrawGoalDisplayWindow(struct PlayerInterfaceProc * proc)
{
    TileMap_FillRect(gUiTmScratchB + TILEMAP_INDEX(20, 10), 11, 9, 0);
    TileMap_FillRect(gUiTmScratchA + TILEMAP_INDEX(20, 12), 11, 9, 0);

    if (proc->unitClock == 0)
    {
        CallARM_FillTileRect(gUiTmScratchB + TILEMAP_INDEX(20, 10), gTSA_GoalBox_OneLine, TILEREF(0x0, 1));
        PutText(proc->texts, gUiTmScratchA + TILEMAP_INDEX(21, 13));
    }

    if (proc->unitClock == 1)
    {
        CallARM_FillTileRect(gUiTmScratchB + TILEMAP_INDEX(20, 10), gTSA_GoalBox_TwoLines, TILEREF(0x0, 1));
        PutText(&proc->texts[0], gUiTmScratchA + TILEMAP_INDEX(21, 13));
        PutText(&proc->texts[1], gUiTmScratchA + TILEMAP_INDEX(21, 15));
    }
}
