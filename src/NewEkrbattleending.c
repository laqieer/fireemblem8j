#include "global.h"
#include "ekrbattle.h"

void NewEkrbattleending(void)
{
    struct ProcEkrBattleEnding * proc;
    proc = Proc_Start(ProcScr_ekrBattleEnding, PROC_TREE_3);
    proc->timer = 0;
}
