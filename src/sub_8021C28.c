#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "hardware.h"
#include "bmfx.h"

// JP-only map effect starter (no fe8u twin); sibling of StartEventWarpAnim.
// Starts a JP-only ProcScr at 0x085C3978 under PROC_TREE_3, then positions
// BG_0 to center the effect on tile (x, y).
extern const struct ProcCmd ProcScr_085C3978[];

void sub_8021C28(int unused, int x, int y)
{
    Proc_Start(ProcScr_085C3978, PROC_TREE_3);

    x = x * 0x10 - gBmSt.camera.x - 0x10;
    y = y * 0x10 - gBmSt.camera.y - 0x28;
    BG_SetPosition(0, -x, -y);
}
