#include "global.h"
#include "proc.h"
#include "ap.h"
#include "ctc.h"
#include "sysutil.h"
#include "sprite-animfx.h"

void EventSpriteAnim_Loop(struct ProcEventSpriteAnim * proc)
{
    struct Proc * approc = proc->approc;
    if (approc->proc_script != NULL)
    {
        int x = proc->x - gBmSt.camera.x + 8;
        int y = proc->y - gBmSt.camera.y + 8;

        APProc_SetParameters((ProcPtr)approc, OAM1_X(x), OAM0_Y(y), -1);
    }
    else
    {
        Proc_Break(proc);
        proc->approc = NULL;
    }
}
