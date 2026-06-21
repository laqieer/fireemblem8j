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

//! FE8U = 0x0801C0D4
u8 DebugMenu_FogIdle(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    if (DoesBMXFADEExist()) {
        return 0;
    }

    if (!(gKeyStatusPtr->newKeys & (A_BUTTON | DPAD_LEFT | DPAD_RIGHT))) {
        return 0;
    }

    if (gPlaySt.chapterVisionRange == 0) {
        UpdateMapViewWithFog(GetROMChapterStruct(gPlaySt.chapterIndex)->initialFogLevel);
    } else {
        UpdateMapViewWithFog(0);
    }

    DebugMenu_FogDraw(menuProc, menuItemProc);
    return 0;
}
