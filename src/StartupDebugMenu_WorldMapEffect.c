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




u8 StartupDebugMenu_WorldMapEffect(void) {
    InitRN(GetGameClock());
    InitUnits();
    WriteNewGameSave(0, 0, 0, -1);
    SetTacticianName(GetStringFromIndex(0x1f1)); // "Mark"

    gPlaySt.chapterIndex = 1;

    WriteGameSave(SAVE_ID_GAME0);
    ChapterChangeUnitCleanup();

    RestartGameAndGoto7();

    return 2;
}
