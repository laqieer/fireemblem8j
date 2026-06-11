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



//! FE8U = 0x0801C328
u8 DebugContinueMenu_IsManualContinueAvailable(const struct MenuItemDef* def, int number) {
    return (IsValidSuspendSave(SAVE_ID_SUSPEND_ALT))
        ? MENU_ENABLED
        : MENU_DISABLED;
}

//! FE8U = 0x0801C340
u8 DebugContinueMenu_ManualContinue(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {

    if (menuItemProc->availability != MENU_ENABLED) {
        return MENU_ACT_SND6B;
    }

    if (Proc_Find(gProc_BMapMain)) {
        EndBMapMain();
    }

    ReadSuspendSave(SAVE_ID_SUSPEND_ALT);
    RestartGameAndGoto8();

    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C370
u8 DebugContinueMenu_InitializeFile(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    if (menuItemProc->availability != MENU_ENABLED) {
        return MENU_ACT_SND6B;
    }

    if (Proc_Find(gProc_BMapMain)) {
        EndBMapMain();
    }

    RestartGameAndGoto12();

    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C39C
u8 DebugContinueMenu_IsContinueChapterAvailable(const struct MenuItemDef* def, int number) {
    return IsValidSuspendSave(SAVE_ID_SUSPEND)
        ? MENU_ENABLED
        : MENU_DISABLED;
}
