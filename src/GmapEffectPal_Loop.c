#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "worldmap.h"

//! FE8U = 0x080C10B8
void GmapEffectPal_Loop(struct GmapEffectProc * proc)
{
    int i;
    int idx;
    u16 * pal;

    proc->unk_2c--;

    if (proc->unk_2c > 0)
    {
        return;
    }

    pal = &PAL_OBJ_COLOR(6, 0);

    for (i = 0; i < 16; i++)
    {
        if (proc->flags_0)
        {
            idx = (proc->unk_30 + i) & 0x1f;
        }
        else
        {
            int tmp;
            tmp = i + 0x20;
            idx = (tmp - proc->unk_30) & 0x1f;
        }

        pal[i] = idx[gWorldmapSprite_0];
        SetBlendConfig(BLEND_EFFECT_NONE, 15 - proc->unk_30, 16, 0);
    }

    proc->unk_2c = proc->unk_2e;
    EnablePaletteSync();

    proc->unk_30++;

    if (proc->unk_30 > 15)
    {
        if (!(proc->flags_1))
        {
            proc->unk_2b_0 = 1;
            Proc_Break(proc);
            return;
        }

        if (proc->unk_2a < 0)
        {
            proc->unk_30 = 0;
        }
        else if (proc->unk_2a > 0)
        {
            proc->unk_30 = 0;

            proc->unk_2a--;

            if (proc->unk_2a == 0)
            {
                proc->flags_1 = 0;
            }
        }
    }

    return;
}
