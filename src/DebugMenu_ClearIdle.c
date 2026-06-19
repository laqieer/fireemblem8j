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




u8 DebugMenu_ClearIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    int i;
    struct GlobalSaveInfo info;

    if (gKeyStatusPtr->repeatedKeys & (DPAD_RIGHT | DPAD_LEFT)) {
        int count = GetGlobalCompletionCount();

        if (gKeyStatusPtr->repeatedKeys & DPAD_LEFT) {
            if (count >= 0) {
                count--;
            }
        }

        if (gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) {
            if (count < 12) {
                count++;
            }
        }

        ReadGlobalSaveInfo(&info);

        for (i = 0; i < MAX_SAVED_GAME_CLEARS; i++) {
            info.cleared_playthroughs[i] = 0;
        }

        for (i = 0; i < count; i++) {
            RegisterCompletedPlaythrough(&info, i + 1);
        }

        if (count == 0) {
            info.completed = 0;
        } else {
            info.completed = 1;
        }

        WriteGlobalSaveInfo(&info);

        DebugMenu_ClearDraw(menuProc, menuItemProc);
    }

    return 0;
}
