#include "global.h"
#include "ekrbattle.h"

extern struct ProcCmd ProcScr_ekrHenseiInit[];

void NewEkrHenseiInitPROC(void)
{
    Proc_Start(ProcScr_ekrHenseiInit, PROC_TREE_3);
}
