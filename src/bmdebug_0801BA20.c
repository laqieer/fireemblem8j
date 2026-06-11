//
// Created by laqieer on 2020/3/3.
//
#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmsave.h"
#include "chapterdata.h"
#include "bm.h"
#include "rng.h"
#include "scene.h"
#include "gamecontrol.h"
#include "bmdebug.h"
#include "soundroom.h"
#include "menu_def.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sio.h"

#include "constants/faces.h"
#include "constants/msg.h"
#include "constants/chapters.h"

void PrintDebugBuildDateAndTime(u16 *bg);



/* prototypes for same-file helpers called by this run */
int DebugMapMenu_DisplayInfoDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc);

//! FE8U = 0x0801BD58
u8 DebugMapMenu_DisplayInfoIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    struct DebugPrintProc* debugPrintProc = Proc_Find(ProcScr_DebugMonitor);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_RIGHT | DPAD_LEFT)) {
        debugPrintProc->unk_66 ^= 1;
        DebugMapMenu_DisplayInfoDraw(menuProc, menuItemProc);
        SetupDebugFontForOBJ(-1, 9);
    }
    return 0;
}

//! FE8U = 0x0801BDA0
u8 DebugMapMenu_DisplayInfoEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    return 0;
}
