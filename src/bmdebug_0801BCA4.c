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



//! FE8U = 0x0801C014
u8 DebugMenu_ClearEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR);
}

//! FE8U = 0x0801C018
u8 DebugMenu_ErasedEffect(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    ClearBg0Bg1();
    StartOrphanMenu(&gDebugClearMenuDef);
    return (MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A);
}

//! FE8U = 0x0801C030
u8 DebugClearMenu_ClearFile(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    SavePlayThroughData();
    gPlaySt.chapterStateBits &= ~(PLAY_FLAG_PREPSCREEN);
    ChapterChangeUnitCleanup();

    WriteGameSave(ReadLastGameSaveId());
    SoftReset(0xff);

    // return 0; // BUG
}

//! FE8U = 0x0801C05C
int DebugMenuInit(void) {
    gDebugChapterModeIndex = gPlaySt.chapterModeIndex;

    PrintDebugStringToBG(gBG0TilemapBuffer + 0x67, GetROMChapterStruct(0)->internalName);
    BG_EnableSyncByMask(1);

    // return; // BUG - Should be void
}

//! FE8U = 0x0801C090
void DEBUGONLY_Startup(void) {
    struct MenuProc* menuProc;

    SetMainUpdateRoutine(OnMain);
    SetInterrupt_LCDVBlank(OnVBlank);

    RefreshBMapGraphics();

    SetupDebugFontForBG(2, 0);

    SetTalkUnkStr("mou dame po");

    menuProc = StartOrphanMenu(&gDebugContinueMenuDef);

    gBmSt.gameStateBits |= BM_FLAG_LINKARENA;
    StartMuralBackground(menuProc, (void *)0x0600B000, -1);
    gBmSt.gameStateBits &= ~(BM_FLAG_LINKARENA);

    PrintDebugBuildDateAndTime(gBG2TilemapBuffer + 0x20);

    return;
}
