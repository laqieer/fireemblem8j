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
void DebugMenuMapIdleCore(struct MenuItemProc* menuItemProc, int x, int y);

//! FE8U = 0x0801C224
u8 StartupDebugMenu_ChapterSelectIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    DebugMenuMapIdleCore(menuItemProc, menuProc->rect.x + 2, menuProc->rect.y + 11);
    return 0;
}
