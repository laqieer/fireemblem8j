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



//! FE8U = 0x0801C4B0
u8 DebugMenu_FogEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    return 0;
}

//! FE8U = 0x0801C4B4
u8 DebugContinueMenu_ReleaseEntry(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    StartGame();
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A);
}

//! FE8U = 0x0801C4C0
u8 DebugMenu_GNightEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    EnterSleepMode(0x300);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}
