#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern struct ProcCmd ProcScr_efxDeadEvent[];

void NewEfxDeadEvent(struct Anim *anim1, struct Anim *anim2)
{
    struct ProcEfxDead *proc;
    proc = Proc_Start(ProcScr_efxDeadEvent, PROC_TREE_3);
    proc->anim1 = anim1;
    proc->anim2 = anim2;

    gEkrDeadEventExist = true;
}
