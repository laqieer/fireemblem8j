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

//! FE8U = 0x0801BCCC
u8 EndMenuAndClear(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    EndMenu(menuProc);
    EndFaceById(0);
    ClearBg0Bg1();

    return 1;
}
