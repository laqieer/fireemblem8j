#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"

struct ProcOpAnimHS;

void GameIntroHealthSafetyWaitButton(struct ProcOpAnimHS * proc)
{
    SetBlendConfig(1, 8, 16, 0);
    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(1, 1, 1, 1, 1);
    SetDispEnable(1, 1, 1, 1, 1);
    Proc_Start((const struct ProcCmd *)0x08AC0EBC, proc);
}
