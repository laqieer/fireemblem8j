#include "global.h"
#include "hardware.h"
#include "sio.h"

extern struct ProcCmd ProcScr_LinkArenaPointsBox[];

void StartLinkArenaPointsBox(void)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);

    Proc_Start(ProcScr_LinkArenaPointsBox, PROC_TREE_3);

    return;
}
