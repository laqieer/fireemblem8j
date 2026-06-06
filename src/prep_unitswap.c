#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "proc.h"
#include "ctc.h"
#include "variables.h"
#include "functions.h"
#include "bmudisp.h"
#include "bmlib.h"

/**
 * Unit Swapping Animation/Effect (When you swap unit places in the prep screen)
 */

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

 void PrepUnitSwapProc_Init(struct PrepUnitSwapProc *proc);
static void PrepUnitSwapProc_MainLoop(struct PrepUnitSwapProc *proc);
static void PrepUnitSwapProc_OnEnd(struct PrepUnitSwapProc *proc);


/* secton.data */

struct ProcCmd CONST_DATA sProcScr_PrepUnitSwap[] = {
    PROC_YIELD,
    PROC_CALL(PrepUnitSwapProc_Init),
    PROC_REPEAT(PrepUnitSwapProc_MainLoop),
    PROC_CALL(PrepUnitSwapProc_OnEnd),
    PROC_END,
};

void PrepUnitSwapProc_MainLoop(struct PrepUnitSwapProc *proc)
{
    int val0 = Interpolate(0, 0, 0x10000, proc->counter, proc->counter_max);

    int xd = proc->x_tile_dest - proc->x_tile_cur;
    int yd = proc->y_tile_dest - proc->y_tile_cur;

    int x_tmp = xd * SIN(val0 >> 9) / proc->divisor;
    int y_tmp = yd * SIN(val0 >> 9) / proc->divisor;

    u32 x = ((xd * val0) >> 0x10) + y_tmp;
    u32 y = ((yd * val0) >> 0x10) - x_tmp;

    x = x + proc->x_tile_cur - gBmSt.camera.x;
    y = y + proc->y_tile_cur - gBmSt.camera.y;

    if (((x + 0x10) <= 0x100) && ((y + 0x20) <= 0xC0)) {
        PutSprite(4, x, y - 0xC, gObject_16x16, 6);
        PutUnitSprite(4, x, y, proc->unit);
    }

    if (++proc->counter > proc->counter_max)
        Proc_Break(proc);
}

void PrepUnitSwapProc_OnEnd(struct PrepUnitSwapProc *proc)
{   
    proc->unit->xPos = proc->x_tile_dest / 16;
    proc->unit->yPos = proc->y_tile_dest / 16;
}

void StartPrepUnitSwap(ProcPtr parent, struct Unit *unit, int x_dest, int y_dest)
{
    struct PrepUnitSwapProc *proc = Proc_Start(sProcScr_PrepUnitSwap, parent);

    proc->unit = unit;
    proc->x_tile_dest = x_dest * 16;
    proc->y_tile_dest = y_dest * 16;

    HideUnitSprite(unit);
}
