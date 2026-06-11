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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd gProcScr_SquareSelectWarp[];

void WarpSelect_OnConfirm(struct WarpSelectProc* proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndSubtitleHelp();

    SetCursorMapPosition(
        gActiveUnit->xPos,
        gActiveUnit->yPos);

    EnsureCameraOntoPosition(proc,
        gActiveUnit->xPos,
        gActiveUnit->yPos);
}

void WarpSelect_OnCancel(struct WarpSelectProc* proc)
{
    ResetTextFont();
    HideMoveRangeGraphics();
    EndSubtitleHelp();

    SetCursorMapPosition(
        gActiveUnit->xPos,
        gActiveUnit->yPos);

    Proc_Start(gProcScr_BackToUnitMenu, PROC_TREE_3);
}

void WarpSelect_OnEnd(struct WarpSelectProc* proc)
{
    HideMoveRangeGraphics();
    AP_Delete(proc->ap);
}

u8 WarpOnSelectTarget(ProcPtr proc, struct SelectTarget* target)
{
    EndTargetSelection(proc);

    gActionData.targetIndex = target->uid;

    Proc_Start(gProcScr_SquareSelectWarp, PROC_TREE_3);

    return TARGETSELECTION_ACTION_SE_6A;
}
