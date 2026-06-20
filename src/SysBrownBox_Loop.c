#include "global.h"
extern u16 Obj_SmallBrownNameBoxe6[];
extern u16 Obj_SmallBrownNameBoxe5[];
extern u16 Obj_SmallBrownNameBoxe4[];
extern u16 Obj_SmallBrownNameBoxe3[];
extern u16 Obj_SmallBrownNameBoxe2[];
extern u16 Obj_SmallBrownNameBoxe1[];
#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void SysBrownBox_Loop(struct ProcSysBrownBox * proc)
{
    int i;
    int x;
    u8 * pframe, _frame;
    struct SysBrownBoxConf * priv;

    u16 * objs1[] = {
        Obj_SmallBrownNameBoxe1,
        Obj_SmallBrownNameBoxe2,
        Obj_SmallBrownNameBoxe3,
        Obj_SmallBrownNameBoxe4
    };

    u16 * objs2[] = {
        Obj_SmallBrownNameBoxe5,
        Obj_SmallBrownNameBoxe5,
        Obj_SmallBrownNameBoxe6,
        Obj_SmallBrownNameBoxe6
    };

    pframe = &proc->priv[0].frame;
    priv = &proc->priv[0];

    for (i = 3; i >= 0; pframe = pframe + 8, priv++, i--)
    {
        if (priv->valid == 0)
            continue;

        x = priv->x;

        if (priv->width != 0)
        {
            int frame = priv->frame;
            if (frame & 1)
            {
                PutSpriteExt(
                    proc->layer,
                    x + 0x60,
                    priv->y + proc->y,
                    objs2[frame],
                    proc->oam2
                );
                x = x + 0x20;
            }
            PutSpriteExt(
                proc->layer,
                x,
                priv->y + proc->y,
                objs1[*pframe],
                proc->oam2
            );

            _frame = *pframe;

            if ((_frame & 1) == 0)
            {
                x = x + 0x60;
                PutSpriteExt(
                    proc->layer,
                    x,
                    priv->y + proc->y,
                    objs2[_frame],
                    proc->oam2
                );
            }
        }
        else
        {
            // _080ADB2C
            PutSpriteExt(
                proc->layer,
                x,
                priv->y + proc->y,
                objs1[priv->frame],
                proc->oam2
            );
        }
    }
}
