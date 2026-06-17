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

extern struct ProcCmd ProcScr_efxDeadAlpha[];

void NewEfxDeadAlpha(struct Anim *anim1, struct Anim *anim2)
{
    struct ProcEfxDead *proc;
    proc = Proc_Start(ProcScr_efxDeadAlpha, PROC_TREE_3);
    
    proc->anim1 = anim1;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 0;

    anim1->drawLayerPriority = 0xA;
    anim2->drawLayerPriority = 0xA;
    AnimSort();

    SetBlendConfig(0, 0x10, 0x10, 0x0);
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 0);

    gLCDControlBuffer.bldcnt.target2_bd_on = true;
}
