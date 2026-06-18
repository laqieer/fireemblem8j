#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern struct ProcCmd ProcScr_efxDead[];

void NewEfxDead(struct Anim *anim1, struct Anim *anim2)
{
    struct ProcEfxDead *proc;
    gEkrHpBarCount++;
    gEkrDeadExist = 1;

    proc = Proc_Start(ProcScr_efxDead, PROC_TREE_3);
    proc->anim1 = anim1;
    proc->anim2 = anim2;
    proc->timer = 0;
    proc->terminator = 0;
    DisableEfxStatusUnits(anim1);
}
