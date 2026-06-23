#include "global.h"

#include "spline.h"
#include "worldmap.h"

struct GmapTmConfrontProc
{
    /* 00 */ PROC_HEADER;
    /* 2A */ u16 unk_2a;
    /* 2C */ u16 unk_2c;
    /* 2E */ u8 unk_2e[2];
    /* 30 */ struct Vec2 unk_30[2];
    /* 38 */ struct Vec2 unk_38[2];
    /* 42 */ struct Vec2 unk_40[2];
    /* 48 */ void * unk_48;
};

//! FE8U = 0x080C0610
void GmTmConfront_Loop_MoveUnitPositions(struct GmapTmConfrontProc * proc)
{
    int i;

    proc->unk_2a++;

    if (proc->unk_2a < proc->unk_2c)
    {
        int var = _DivArm1(proc->unk_2a, proc->unk_2c, 1);

        for (i = 0; i < 2; i++)
        {
            s16 x = proc->unk_30[i].x + DivArm(0x1000, proc->unk_40[i].x * var);
            s16 y = proc->unk_30[i].y + DivArm(0x1000, proc->unk_40[i].y * var);
            GmMu_SetPosition(
                GM_MU, proc->unk_2e[i], x, y);
        }
    }
    else
    {
        for (i = 0; i < 2; i++)
        {
            GmMu_SetPosition(
                GM_MU, proc->unk_2e[i],
                proc->unk_38[i].x, proc->unk_38[i].y);
        }

        proc->unk_2a = 0;
        Proc_Break(proc);
    }

    return;
}
