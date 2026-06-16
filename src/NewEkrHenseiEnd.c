#include "global.h"
#include "ekrbattle.h"

extern struct ProcCmd ProcScr_ekrHenseiEnd[];

void NewEkrHenseiEnd(void)
{
    Proc_Start(ProcScr_ekrHenseiEnd, PROC_TREE_3);
}
