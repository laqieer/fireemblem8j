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

//! FE8U = 0x0801C30C
u8 DebugChuudanMenu_ManualSave(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    if (menuItemProc->availability != MENU_ENABLED) {
        return MENU_ACT_SND6B;
    }

    WriteSuspendSave(SAVE_ID_SUSPEND_ALT);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}
