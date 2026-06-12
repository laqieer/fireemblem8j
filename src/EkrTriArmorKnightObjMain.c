#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmlib.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrtriangle.h"
#include "ctc.h"

void EkrTriArmorKnightObjMain(struct ProcEfxOBJ * proc)
{
    int ret;
    ret = Interpolate(INTERPOLATE_LINEAR, 0x20, 0x0, proc->timer, proc->terminator);
    proc->anim2->xPosition = proc->anim->xPosition + ret;
    proc->anim3->xPosition = proc->anim->xPosition - ret;

    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        AnimDelete(proc->anim3);
        Proc_Break(proc);
    }
}
