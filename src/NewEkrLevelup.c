#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_EkrLevelup[];

void NewEkrLevelup(struct Anim *ais)
{
    struct ProcEkrLevelup *proc;
    gpProcEkrLevelup = proc = Proc_Start(ProcScr_EkrLevelup, PROC_TREE_3);
    proc->ais_main = ais;
    proc->ais_core = GetAnimAnotherSide(ais);
    if (gEkrDistanceType != EKR_DISTANCE_PROMOTION)
        proc->is_promotion = false;
    else
        proc->is_promotion = true;
    proc->timer = 0;
    proc->finished = false;
}
