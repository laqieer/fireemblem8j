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

extern EWRAM_OVERLAY(banim) int gEkrTriangleInvalid;

void EkrTriPegasusKnightObjMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->terminator)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}
