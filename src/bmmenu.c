#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmenu.h"
#include "playerphase.h"
#include "uichapterstatus.h"
#include "uiselecttarget.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "icon.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmidoten.h"
#include "uiutils.h"
#include "bksel.h"
#include "bmbattle.h"
#include "bmdifficulty.h"
#include "bmitemuse.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "bmtrick.h"
#include "mu.h"
#include "bmarch.h"
#include "event.h"
#include "bb.h"
#include "bmarena.h"
#include "face.h"
#include "uiconfig.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "menu_def.h"
#include "worldmap.h"
#include "savemenu.h"
#include "prepscreen.h"
#include "bmguide.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "unitlistscreen.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/terrains.h"
#include "constants/items.h"
#include "constants/songs.h"

extern u16 gBattleForecast_2[];

extern u8 gSummonConfig[4][2];



struct ProcCmd CONST_DATA gProcScr_BackToUnitMenu[] = {
    PROC_CALL(LockGame),

    PROC_CALL(BackToUnitMenu_CamWatch),
    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_CALL(BackToUnitMenu_RestartMenu),

    PROC_CALL(UnlockGame),

    PROC_END,
};



u8 MenuEffect_CloseMenuVoid(void) {
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 EffectWait(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_WAIT;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 GenericSelection_BackToUM(ProcPtr proc, struct SelectTarget * target) {
    EndTargetSelection(proc);

    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ResetTextFont();

    HideMoveRangeGraphics();

    EnsureCameraOntoPosition(
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22),
        gActiveUnit->xPos,
        gActiveUnit->yPos
    );

    return MENU_ACT_SKIPCURSOR | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

void BackToUnitMenu_CamWatch(ProcPtr proc) {

    if (IsCameraNotWatchingPosition(gActiveUnit->xPos, gActiveUnit->yPos)) {

        int y = gActiveUnit->yPos;

        Proc_EndEach(ProcScr_CamMove);

        if (GetCameraAdjustedY(y << 4) > gBmSt.cameraMax.y) {
            y = (gBmSt.cameraMax.y >> 4) + 2;
        }

        EnsureCameraOntoPosition(proc, gActiveUnit->xPos, y);
    }

    return;
}

void BackToUnitMenu_RestartMenu(void) {
    StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22);

    return;
}

u8 GenericSelection_BackToUM_CamWait(ProcPtr proc, struct SelectTarget * target) {

    EndTargetSelection(proc);

    BG_Fill(gBG2TilemapBuffer,0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    HideMoveRangeGraphics();

    ResetTextFont();

    Proc_Start(gProcScr_BackToUnitMenu, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

u8 ItemMenu_ButtonBPressed(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ResetTextFont();

    StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 22);

    HideMoveRangeGraphics();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR | MENU_ACT_ENDFACE;
}

u8 RescueSelection_OnHelp(ProcPtr proc, struct SelectTarget * target) {
    return 0;
}
