#include "global.h"

#include "bm.h"
#include "ap.h"
#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "sysutil.h"

void SysGrayBox_Loop(struct ProcSysGrayBox * proc)
{
    int i, j, k;
    u16 oam2;
    struct SysGrayBoxConf * priv;

    for (i = 0; i < 4; i++)
    {
        priv = &proc->priv[i];

        if (priv->valid == 0)
            continue;

        oam2 = OAM2_PAL(proc->pal) + proc->chr + priv->chr;

        PutSpriteExt(
            priv->layer,
            priv->x & 0x1FF,
            priv->y & 0xFF,
            gObject_8x8,
            oam2);

        PutSpriteExt(priv->layer,
            ((priv->x + (priv->width - 1) * 8) & 0x1FF) + 0x1000,
            priv->y & 0xFF, gObject_8x8, oam2);

        PutSpriteExt(priv->layer,
            ((priv->x + (priv->width - 1) * 8) & 0x1FF) + 0x3000,
            (priv->y + (priv->height - 1) * 8) & 0xFF,
            gObject_8x8, oam2);

        PutSpriteExt(priv->layer,
            (priv->x & 0x1FF) + 0x2000,
            (priv->y + (priv->height - 1) * 8) & 0xFF,
            gObject_8x8, oam2);

        j = 1;

        for (; j < (priv->width - 4); j = j + 4)
        {
            PutSpriteExt(priv->layer,
                (priv->x + j * 8) & 0x1FF,
                priv->y & 0xFF,
                gObject_32x8, oam2 + 1);

            PutSpriteExt(priv->layer,
                ((priv->x + j * 8) & 0x1FF) + 0x2000,
                (priv->y + (priv->height - 1) * 8) & 0xFF,
                gObject_32x8, oam2 + 1);
        }

        for (; j < (priv->width - 2); j = j + 2)
        {
            PutSpriteExt(priv->layer,
                (priv->x + j * 8) & 0x1FF,
                priv->y & 0xFF,
                gObject_16x8, oam2 + 1);

            PutSpriteExt(priv->layer,
                ((priv->x + j * 8) & 0x1FF) + 0x2000,
                (priv->y + (priv->height - 1) * 8) & 0xFF,
                gObject_16x8, oam2 + 1);
        }

        for (; j < (priv->width - 1); j = j + 1)
        {
            PutSpriteExt(priv->layer,
                (priv->x + j * 8) & 0x1FF,
                priv->y & 0xFF,
                gObject_8x8, oam2 + 1);

            PutSpriteExt(priv->layer,
                ((priv->x + j * 8) & 0x1FF) + 0x2000,
                (priv->y + (priv->height - 1) * 8) & 0xFF,
                gObject_8x8, oam2 + 1);
        }

        j = 1;
        for (; j < (priv->height - 1); j = j + 1)
        {
            PutSpriteExt(priv->layer,
                priv->x & 0x1FF,
                (priv->y + j * 8) & 0xFF,
                gObject_8x8, oam2 + 9);

            PutSpriteExt(priv->layer,
                ((priv->x + (priv->width - 1) * 8) & 0x1FF) + 0x1000,
                (priv->y + j * 8) & 0xFF,
                gObject_8x8, oam2 + 9);

            k = 1;
            for (; k < (priv->width - 4); k = k + 4)
            {
                PutSpriteExt(priv->layer,
                    (priv->x + k * 8) & 0x1FF,
                    (priv->y + j * 8) & 0xFF,
                    gObject_32x8, oam2 + 5);
            }

            for (; k < (priv->width - 2); k = k + 2)
            {
                PutSpriteExt(priv->layer,
                    (priv->x + k * 8) & 0x1FF,
                    (priv->y + j * 8) & 0xFF,
                    gObject_16x8, oam2 + 5);
            }

            for (; k < (priv->width - 1); k = k + 1)
            {
                PutSpriteExt(priv->layer,
                    (priv->x + k * 8) & 0x1FF,
                    (priv->y + j * 8) & 0xFF,
                    gObject_8x8, oam2 + 5);
            }
        }
    }
}
