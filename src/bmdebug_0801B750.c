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



// do nothing, return directly
void DummyFunction2(void)
{

}

void DebugPrintWithProc(struct DebugPrintProc *proc)
{
    struct Text Textr;

    int x = proc->x;
    int y = proc->y;
    int width = proc->width;
    const char *text = proc->text;
    InitText(&Textr, width);
    Text_DrawString(&Textr, text);
    DrawUiFrame2(x, y, width + 2, 4, 0);
    PutText(&Textr, gBG0TilemapBuffer + TILEMAP_INDEX(x + 1, y + 1));
    BG_EnableSyncByMask(3);
}

void DebugPrint(int x, int y, int width, const char *text)
{
    struct DebugPrintProc *proc = Proc_Start(gProc_DebugPrintWithProc, PROC_TREE_3);
    proc->x = x;
    proc->y = y;
    proc->text = text;
    proc->width = width;
}

int StartDebugMenu(struct MenuProc *menuProc)
{
    EndMenu(menuProc);
    ClearBg0Bg1();
    StartOrphanMenu(&gDebugMenuDef);
    SetupDebugFontForBG(2, 0);
    return 1;
}
