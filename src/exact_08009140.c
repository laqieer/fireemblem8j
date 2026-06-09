#include "global.h"
#include "proc.h"
#include "ap.h"
#include "ctc.h"
#include "sysutil.h"
#include "sprite-animfx.h"



void EventSpriteAnim_End(struct ProcEventSpriteAnim * proc)
{
    if (proc->approc != NULL)
        APProc_Delete(proc->approc);
}
