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

ProcPtr NewEkrTriPegasusKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2)
{
    struct ProcEkrTriClass * proc;
    proc = Proc_Start(ProcScr_ekrTriPegasusKnight, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->etype1 = ekr1;
    proc->etype2 = ekr2;
    proc->ewtype1 = banim1;
    proc->ewtype2 = ewtype2;
    return proc;
}
