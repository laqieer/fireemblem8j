#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "bmfx.h"

// JP-only: map effect for warp event codes (fe8u StartEventWarpAnim_unused).
extern const struct ProcCmd ProcScr_EventWrapAnim[];

void StartEventWarpAnim_unused(ProcPtr parent, int xCamera, int yCamera, s8 subcmd)
{
    struct ProcBmFx * proc;

    proc = Proc_Start(ProcScr_EventWrapAnim, parent);
    proc->xPos = subcmd;

    BG_SetPosition(0, -xCamera, -yCamera);
    proc->yPos = 1;
}
