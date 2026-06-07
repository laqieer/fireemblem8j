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



void EkrTriArmorKnightObj2Main2(struct ProcEkrTriArmorKnightOBJ2 * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

void NewEfxTriangleQUAKE(struct Anim * anim, int duration)
{
    struct ProcEfxTriagnleQUAKE * proc;

    gEfxBgSemaphore = gEfxBgSemaphore + 1;
    proc = Proc_Start(ProcScr_EfxTriangleQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->qproc = NewEfxQuakePure(0, 0);
    proc->timer = 0;
    proc->terminator = duration;
}
