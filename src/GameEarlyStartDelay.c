#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"




void GameEarlyStartDelay(struct ProcOpAnimHS * proc)
{
    if (--(*(int *)((char *)proc + 0x30)) <= 0)
    {
        (*(int *)((char *)proc + 0x2c)) = 0;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}
