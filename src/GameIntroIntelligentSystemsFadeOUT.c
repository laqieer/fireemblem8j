#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"

void GameIntroIntelligentSystemsFadeOUT(struct ProcOpAnimHS * proc)
{
    (*(int *)((char *)proc + 0x2c))++;
    OpAnimHS_BrightenPalette(Pal_IntelligentSystems, 1, 3, 0x28 - (*(int *)((char *)proc + 0x2c)), 0x28);

    if ((*(int *)((char *)proc + 0x2c)) > 0x27)
    {
        (*(int *)((char *)proc + 0x30)) = 0x3C;
        Proc_Break(proc);
    }
    TryTickHSScreenExit(proc);
}
