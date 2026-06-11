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
u8 Debug_GetChapterId(int menuItemNumber);

u8 DebugMenu_MapEffect(struct MenuProc *menuProc, struct MenuItemProc *menuItemProc)
{
    EndBMapMain();
    gPlaySt.chapterIndex = Debug_GetChapterId(menuItemProc->itemNumber);
    gPlaySt.chapterModeIndex = gDebugChapterModeIndex;
    ChapterChangeUnitCleanup();
    Nop_Gamecontrol_0();
    gPlaySt.save_menu_type = 2;
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801BB98
int DebugMenu_BgmDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    int songId;
    int i;

    int totalSongs = CountTotalSoundRoomSongs();

    menuItemProc->itemNumber = 0;

    songId = GetCurrentBgmSong();
    for (i = 0; i < totalSongs; i++) {
        if (songId == i) {
            menuItemProc->itemNumber = i;
            break;
        }
    }

    ClearText(&menuItemProc->text);

    // BUG: Text ID is used without "GetStringFromIndex"
    Text_InsertDrawString(&menuItemProc->text, 0, TEXT_COLOR_SYSTEM_WHITE, (const char *)gSoundRoomTable[menuItemProc->itemNumber].nameTextId);
    PutText(&menuItemProc->text,  gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    // return 0; // BUG
}

//! FE8U = 0x0801BC1C
int DebugMenu_BgmIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        menuItemProc->itemNumber++;
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        menuItemProc->itemNumber--;
    }

    if (menuItemProc->itemNumber < 0) {
        menuItemProc->itemNumber = 0;
    }

    if (gSoundRoomTable[menuItemProc->itemNumber].bgmId < 0) {
        menuItemProc->itemNumber--;
    }

    if (gKeyStatusPtr->repeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        ClearText(&menuItemProc->text);

        // BUG: Text ID is used without "GetStringFromIndex"
        Text_InsertDrawString(&menuItemProc->text, 0, TEXT_COLOR_SYSTEM_WHITE, (const char *)gSoundRoomTable[menuItemProc->itemNumber].nameTextId);
        PutText(&menuItemProc->text,  gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));
    }

    return 0;
}
