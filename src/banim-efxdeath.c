#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "event.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/songs.h"



void NewEfxDeadDragonAlpha(struct Anim *anim1, struct Anim *anim2)
{
    struct ProcEfxDead *proc;
    proc = Proc_Start(ProcScr_efxDeadDragonAlpha, PROC_TREE_3);

    proc->anim1 = anim1;
    proc->anim2 = anim2;

    anim1->state |= 0x2;
    anim2->state |= 0x2;

    EfxDracoZombiePrepareTSA(0, 0, EKR_POS_R);

    proc->timer = 0;
    proc->terminator = 0;

    SetBlendConfig(1, 0x10, 0x10, 0x0);
    SetBlendTargetA(0, 0, 0, 1, 0);
    SetBlendTargetB(0, 0, 1, 0, 0);

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 0, 0xF0, 0xA0);
    SetWin0Layers(1, 1, 1, 1, 1);
    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.bldcnt.target2_bd_on = 1;
}
