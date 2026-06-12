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

void WarpSelect_OnInit(struct WarpSelectProc* proc)
{
    struct APHandle* ap;

    StartSubtitleHelp(proc, GetStringFromIndex(0x7EF)); // TODO: msgid "Select warp point."

    EnsureCameraOntoPosition(proc,
        GetUnit(gActionData.targetIndex)->xPos,
        GetUnit(gActionData.targetIndex)->yPos);

    HideMoveRangeGraphics();

    FillWarpRangeMap(gActiveUnit, GetUnit(gActionData.targetIndex));

    gBmSt.gameStateBits &= ~BM_FLAG_1;

    DisplayMoveRangeGraphics(1);

    SetCursorMapPosition(
        GetUnit(gActionData.targetIndex)->xPos,
        GetUnit(gActionData.targetIndex)->yPos);

    ap = AP_Create(gUnkData_2, 0);

    ap->tileBase = OAM2_CHR(0) + OAM2_PAL(0);
    AP_SwitchAnimation(ap, 0);

    proc->ap = ap;
    proc->prevWarpAllowed = 2; // neither TRUE nor FALSE
}
