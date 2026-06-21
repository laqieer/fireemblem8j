#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "sio.h"

extern u8 data_085D4858[];
void Sio_StartBoxTransitionOpen(int a, ProcPtr parent) {
    int aa = (s16)a;
    struct SioProc85AA7B4 * proc = Proc_StartBlocking((const struct ProcCmd *)data_085D4858, parent);
    proc->unk_64 = aa;
    SetDispEnable(1, 1, 1, 1, 1);
    SetWinEnable(0, 1, 0);
    SetWin1Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);
    SetWin1Layers(1, 1, 1, 1, 1);
    SetWOutLayers(0, 0, 0, 0, 0);
    gLCDControlBuffer.wincnt.win1_enableBlend = 1;
}
