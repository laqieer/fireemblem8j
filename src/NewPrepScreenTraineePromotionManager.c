#include "global.h"
#include "proc.h"

extern struct ProcCmd ProcScr_PrepTraineePromo[];

void NewPrepScreenTraineePromotionManager(void)
{
    Proc_Start(ProcScr_PrepTraineePromo, PROC_TREE_3);
}
