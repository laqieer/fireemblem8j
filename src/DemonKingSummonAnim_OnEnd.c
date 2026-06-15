#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

void DemonKingSummonAnim_OnEnd(struct MAEffectProc * proc)
{
    Proc_End((void *)proc->img);

    return;
}
