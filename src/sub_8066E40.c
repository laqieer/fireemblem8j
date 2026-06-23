#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void sub_8066E40(struct ProcEfxBG * proc)
{
    if (GetAnimPosition(proc->anim) == 0)
        gLCDControlBuffer.bgoffset[1].x += 12;
    else
        gLCDControlBuffer.bgoffset[1].x -= 12;

    if (++proc->timer > proc->terminator)
        Proc_Break(proc);
}
