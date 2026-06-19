#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"




void GameIntroIntelligentSystemsFadeIN(struct ProcOpAnimHS * proc)
{
    if ((*(int *)((char *)proc + 0x2c)) == 0)
    {
        SetDispEnable(0, 1, 0, 0, 0);
    }
    (*(int *)((char *)proc + 0x2c))++;
    OpAnimHS_BrightenPalette(Pal_IntelligentSystems, 1, 3, (*(int *)((char *)proc + 0x2c)), 0x1E);

    if ((*(int *)((char *)proc + 0x2c)) > 0x1D)
    {
        (*(int *)((char *)proc + 0x30)) = 0x3C;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}
