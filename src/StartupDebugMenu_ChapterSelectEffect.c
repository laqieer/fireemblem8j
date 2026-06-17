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




u8 StartupDebugMenu_ChapterSelectEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    InitRN(GetGameClock());
    InitUnits();

    if (gKeyStatusPtr->heldKeys & L_BUTTON) {
        WriteNewGameSave(0, 1, 0, -1);
    } else {
        WriteNewGameSave(0, 0, 0, -1);
    }

    SetTacticianName(GetStringFromIndex(0x1f1)); // "Mark"

    gPlaySt.chapterIndex = Debug_GetChapterId(menuItemProc->itemNumber);
    gPlaySt.chapterModeIndex = gDebugChapterModeIndex;

    WriteGameSave(SAVE_ID_GAME0);

    ChapterChangeUnitCleanup();
    Nop_Gamecontrol_0();

    return 2;
}
