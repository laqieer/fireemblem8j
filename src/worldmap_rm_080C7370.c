#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"

#include "worldmap.h"
#include "constants/worldmap.h"



void GmapRmBaPalAnim1_Init(struct ProcGmapRmBaPalAnim * proc)
{
    SetBlendTargetA(0, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 0, 0, 0);
    SetBlendConfig(0, 0, 0x10, 0);

    proc->timer = 0;
    proc->flag = 1;
}

void GmapRmBaPalAnim1_Loop1(struct ProcGmapRmBaPalAnim * proc)
{
    if (++proc->timer < 45)
    {
        u32 coeff = _DivArm2(proc->timer, 45, 0);
        SetBlendConfig(0, DivArm(0x1000, coeff * 0x10), 0x10, 0);
        proc->flag = 0;
    }
    else
    {
        SetBlendConfig(0, 0x10, 0x10, 0);
        proc->timer = 0;
        Proc_Break(proc);
    }
}
