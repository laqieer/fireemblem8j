#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

void OpAnimBldAlphaDelay(struct ProcOpAnimBLDALPHA * proc)
{
    if (proc->timer == 8)
    {
        proc->timer = 0;
        Proc_Break(proc);
        return;
    }

    proc->timer++;
}
