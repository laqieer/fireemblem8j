#include "global.h"

#include "bm.h"
#include "mu.h"

u8 GetMuDisplayPosition(struct MuProc * proc, struct Vec2 * out)
{
    int new_var2;
    short new_var;
    if (proc->state == MU_STATE_DISPLAY_UI)
    {
        out->x = (proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION;
        out->y = (proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION;
    }
    else
    {
        short x = ((proc->x_q4 + proc->x_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.x + 8;
        short y = ((proc->y_q4 + proc->y_offset_q4) >> MU_SUBPIXEL_PRECISION) - gBmSt.camera.y + 8;
        new_var2 = y;
        new_var = x;
        out->x = new_var;
        out->y = new_var2 + 8;
        if (x < -0x10 || x > 0x100 || new_var2 < -0x10 || new_var2 > 0xB0)
            return false;
    }
    return true;
}
