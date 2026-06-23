#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0805BB84
void EfxCircleWINMain(struct ProcEfxCircleWIN * proc)
{
    u16 * unk_54;
    struct Vec2 * vec;
    s16 a;
    s16 b;
    s16 x;
    s16 y;
    u16 var;
    u32 i;

    u16 * buf = (gEkrBg2ScrollFlip == 0) ? gpBg2ScrollOffsetTable2 : gpBg2ScrollOffsetTable1;

    unk_54 = proc->unk_54;
    var = unk_54[proc->unk_2e];

    vec = MakeCircleWindowBounds(var);

    if (unk_54[proc->unk_2e + 1] != 0xFFFF)
    {
        proc->unk_2e++;
    }

    a = proc->unk_3a - var;

    if (a < 0)
    {
        a = 0;
    }

    b = var + proc->unk_3a;

    if (b > DISPLAY_HEIGHT)
    {
        b = DISPLAY_HEIGHT;
    }

    for (i = 0; i < DISPLAY_HEIGHT; buf++, i++)
    {
        if ((a > i) || (b < i))
        {
            *buf = 0;
        }
        else
        {
            x = vec->x + proc->unk_32;

            if (x < 0)
            {
                x = 0;
            }

            y = vec->y + proc->unk_32;

            if (y > DISPLAY_WIDTH)
            {
                y = DISPLAY_WIDTH;
            }

            *buf = y | (x << 8);
            vec++;
        }
    }

    proc->timer++;

    if (proc->timer == proc->unk_44)
    {
        gEfxBgSemaphore--;
        SetDefaultColorEffects();
        Proc_Break(proc);
    }

    return;
}
