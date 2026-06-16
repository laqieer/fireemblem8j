#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void NewEkrDispUP(void)
{
    gpProcEkrDispUP = Proc_Start(gProc_ekrDispUP, PROC_TREE_5);
    EkrDispUP_SetPositionUnsync(0, 0);
    EkrDispUpClear4C50();
    UnAsyncEkrDispUP();
    UnsyncEkrDispUP();
}
