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
int DebugChargeMenu_Draw(struct MenuProc* param_1, struct MenuItemProc* menuItemProc);

//! FE8U = 0x0801C588
u8 DebugChargeMenu_Idle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    int state;

    if (!(gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_LEFT | DPAD_RIGHT))) {
        return 0;
    }

    if (menuItemProc->itemNumber != 0) {
        state = gPlaySt.config.debugControlGreen;
    } else {
        state = gPlaySt.config.debugControlRed;
    }

    if (gKeyStatusPtr->newKeys & DPAD_LEFT) {
        state--;
    }

    if (gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_RIGHT)) {
        state++;
    }

    if (state > 2) {
        state = 2;
    }

    if (state < 0) {
        state = 0;
    }

    if (menuItemProc->itemNumber != 0) {
        gPlaySt.config.debugControlGreen = state;
    } else {
        gPlaySt.config.debugControlRed = state;
    }

    DebugChargeMenu_Draw(menuProc, menuItemProc);

    return 0;
}
