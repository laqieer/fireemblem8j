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

//! FE8U = 0x0801C65C
void DebugMenuMapIdleCore(struct MenuItemProc* menuItemProc, int x, int y) {
    int chapterId;
    const char* internalNameStr;
    const char* modeStr;

    const char* strings[4] = {
        "-------",
        "Tuto",
        "Eirik",
        "Ephraim"
    };

    if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
        menuItemProc->itemNumber++;
        if ((u8)menuItemProc->itemNumber > 0x3b) {
            menuItemProc->itemNumber = 0;
        }
    } else if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
        menuItemProc->itemNumber--;
        if (menuItemProc->itemNumber < 0) {
            menuItemProc->itemNumber = 0x3b;
        }
    }

    chapterId = Debug_GetChapterId(menuItemProc->itemNumber);

    switch (chapterId) {
        case CHAPTER_L_PROLOGUE:
        case CHAPTER_L_1:
        case CHAPTER_L_2:
        case CHAPTER_L_3:
        case CHAPTER_L_4:
        case CHAPTER_L_5:
        case CHAPTER_L_5X:
        case CHAPTER_L_6:
        case CHAPTER_L_7:
        case CHAPTER_L_8:
            gDebugChapterModeIndex = CHAPTER_MODE_COMMON;
            break;

        case CHAPTER_I_9:
        case CHAPTER_I_10:
        case CHAPTER_I_11:
        case CHAPTER_I_12:
        case CHAPTER_I_13:
        case CHAPTER_I_14:
        case CHAPTER_I_15:
        case CHAPTER_I_16:
        case CHAPTER_I_17:
        case CHAPTER_I_18:
        case CHAPTER_I_19:
        case CHAPTER_I_20:
        case CHAPTER_I_21:
        case CHAPTER_I_21X:
            gDebugChapterModeIndex = CHAPTER_MODE_EPHRAIM;
            break;

        default:
            if (!(gKeyStatusPtr->heldKeys & (R_BUTTON))) {
                gDebugChapterModeIndex = CHAPTER_MODE_EIRIKA;
            } else {
                gDebugChapterModeIndex = CHAPTER_MODE_EPHRAIM;
            }
            break;

        case CHAPTER_E_9:
        case CHAPTER_E_10:
        case CHAPTER_E_11:
        case CHAPTER_E_12:
        case CHAPTER_E_13:
        case CHAPTER_E_14:
        case CHAPTER_E_15:
        case CHAPTER_E_16:
        case CHAPTER_E_17:
        case CHAPTER_E_18:
        case CHAPTER_E_19:
        case CHAPTER_E_20:
        case CHAPTER_E_21:
        case CHAPTER_E_21X:
            gDebugChapterModeIndex = CHAPTER_MODE_EIRIKA;
            break;
    }

    internalNameStr = GetROMChapterStruct(chapterId)->internalName;
    modeStr = strings[gDebugChapterModeIndex];

    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y),     "                    ");
    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y + 1), "                    ");
    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y),     internalNameStr);
    PrintDebugStringToBG(gBG0TilemapBuffer + TILEMAP_INDEX(x, y + 1), modeStr);

    BG_EnableSyncByMask(1);

    EnablePaletteSync();

    return;
}
