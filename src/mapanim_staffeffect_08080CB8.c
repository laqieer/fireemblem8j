#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"



void SetDefaultMapAnimScreenConf(void)
{
    // TODO: macro?
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 0;
    gLCDControlBuffer.bg2cnt.priority = 0;
    gLCDControlBuffer.bg3cnt.priority = 2;

    SetBlendTargetA(0, 0, 1, 0, 0); SetBlendBackdropA(0);
    SetBlendTargetB(0, 0, 0, 1, 1); SetBlendBackdropB(1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 0;

    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 1, 0, 1, 1);
}

void StartMapAnimEffect_Unk_1(int bg, int x_inc, int y_inc, ProcPtr parent)
{
    struct ManimSomethingProc_08067498 * proc;

    proc = Proc_Start(ProcScr_MapAnimEffect_Unk_1, parent);

    proc->bg = bg;

    proc->x = 0;
    proc->x_inc = x_inc;
    proc->y = 0;
    proc->y_inc = y_inc;
}

void EndMapAnimEffect_Unk_1(void)
{
    Proc_EndEach(ProcScr_MapAnimEffect_Unk_1);
}

void MapAnimEffect_Unk_1_Loop(struct ManimSomethingProc_08067498 * proc)
{
    BG_SetPosition(proc->bg, proc->x, proc->y);

    proc->x += proc->x_inc;
    proc->y += proc->y_inc;
}
