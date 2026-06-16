#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "proc.h"
#include "functions.h"
#include "bmlib.h"

struct PrepUnitSwapProc {
    PROC_HEADER;

    /* 2C */ struct Unit *unit;
    /* 30 */ s16 x_tile_cur;
    /* 32 */ s16 y_tile_cur;
    /* 34 */ s16 x_tile_dest;
    /* 36 */ s16 y_tile_dest;

    /* 38 */ u8 _pad_38[0x3C - 0x38];

    /* 3C */ s16 counter;
    /* 3E */ s16 counter_max;

    /* 40 */ u8 _pad_40[0x44 - 0x40];

    /* 44 */ int divisor;
};

void PrepUnitSwapProc_Init(struct PrepUnitSwapProc *proc)
{
    u16 _sqrt;
    int tmp0, tmp1;

    proc->x_tile_cur = proc->unit->xPos * 0x10;
    proc->y_tile_cur = proc->unit->yPos * 0x10;

    tmp0 = proc->x_tile_dest - proc->x_tile_cur;
    tmp1 = proc->y_tile_dest - proc->y_tile_cur;

    _sqrt = Sqrt(tmp0 * tmp0 + tmp1 * tmp1);

    proc->divisor = Interpolate(0, 0x1000, 0x20000, _sqrt, 0x200);
    proc->counter_max = Interpolate(0, 0x000C, 0x00030, _sqrt, 0x200);
    proc->counter = 0;
}
