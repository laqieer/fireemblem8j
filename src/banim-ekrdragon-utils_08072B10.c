#include "gbafe.h"

void NewEkrWhiteINOUT(int dura1, int dura2, int dura3)
{
    struct ProcEkrDragonScreenFlashing * proc;
    proc = Proc_Start(ProcScr_ekrWhiteINOUT, PROC_TREE_VSYNC);

    proc->timer = 0;
    proc->dura1 = dura1;
    proc->dura2 = dura2;
    proc->dura3 = dura3;

    gLCDControlBuffer.bldcnt.target1_bd_on = false;
    gLCDControlBuffer.bldcnt.target2_bd_on = false;
}
