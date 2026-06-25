#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "bmfx.h"

// map effect for the warp event codes (fe8u StartEventWarpAnim).
extern const struct ProcCmd ProcScr_EventWrapAnim[];

void StartEventWarpAnim(ProcPtr parent, int x, int y, s8 subcmd, s8 flag)
{
    struct ProcBmFx * proc;

    proc = Proc_Start(ProcScr_EventWrapAnim, parent);
    proc->xPos = subcmd;
    proc->yPos = flag;

    x = x * 0x10 - gBmSt.camera.x - 0x08;
    y = y * 0x10 - gBmSt.camera.y - 0x20;
    BG_SetPosition(0, -x, -y);
}
