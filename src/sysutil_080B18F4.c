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

void SysBlackBox_Main(struct SysBlackBoxProc * proc)
{
    int i;
    int j;
    int k;
    int xOam1;
    int yOam0;

    for (i = 0; i < 4; i++)
    {
        if (proc->valid[i] == false)
            continue;

        if (proc->width[i] > 1)
        {
            if (proc->height[i] > 1)
            {
                PutSpriteExt(0xd, proc->x[i] | OAM1_HFLIP, proc->y[i], gObject_8x8, proc->chr + proc->oam2[i] + 4);
                PutSpriteExt(
                    0xd, proc->x[i] + (proc->width[i] - 1) * 8, proc->y[i], gObject_8x8,
                    proc->chr + proc->oam2[i] + 4);
                PutSpriteExt(
                    0xd, proc->x[i] | OAM1_HFLIP | OAM1_VFLIP, proc->y[i] + (proc->height[i] - 1) * 8, gObject_8x8,
                    proc->chr + proc->oam2[i] + 4);
                PutSpriteExt(
                    0xd, (proc->x[i] + (proc->width[i] - 1) * 8) | OAM1_VFLIP, proc->y[i] + (proc->height[i] - 1) * 8,
                    gObject_8x8, proc->chr + proc->oam2[i] + 4);

                j = proc->width[i] - 2;

                yOam0 = proc->y[i];
                xOam1 = proc->x[i] + 8;

                for (; j > 3; j -= 4)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x20;
                }

                for (; j > 1; j -= 2)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x10;
                }

                for (; j > 0; j--)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 8;
                }

                j = proc->width[i] - 2;
                yOam0 = proc->y[i] + (proc->height[i] - 1) * 8;
                xOam1 = proc->x[i] + 8;

                for (; j > 3; j -= 4)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x20;
                }

                for (; j > 1; j -= 2)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 0x10;
                }

                for (; j > 0; j--)
                {
                    PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->chr + proc->oam2[i]);
                    xOam1 = xOam1 + 8;
                }

                k = proc->height[i] - 2;
                yOam0 = proc->y[i] + 8;

                for (; k > 0; yOam0 += 8, k--)
                {
                    j = proc->width[i];
                    xOam1 = proc->x[i];

                    for (; j > 3; j -= 4)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_32x8, proc->chr + proc->oam2[i]);
                        xOam1 = xOam1 + 0x20;
                    }

                    for (; j > 1; j -= 2)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_16x8, proc->chr + proc->oam2[i]);
                        xOam1 = xOam1 + 0x10;
                    }

                    for (; j > 0; j--)
                    {
                        PutSpriteExt(0xd, xOam1, yOam0, gObject_8x8, proc->chr + proc->oam2[i]);
                        xOam1 = xOam1 + 8;
                    }
                }
            }
        }
    }
}

ProcPtr NewSysBlackBoxHandler(ProcPtr parent)
{
    Proc_End(Proc_Find(ProcScr_SysBlackBox));
    return Proc_Start(ProcScr_SysBlackBox, parent);
}

void SysBlackBoxSetGfx(u32 obj_offset)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);

    if (proc != NULL)
    {
        proc->chr = ((obj_offset << 0xf) >> 0x14);
        Decompress(Img_SysBlackBox, OBJ_VRAM0 + obj_offset);
    }
}

void EnableSysBlackBox(int index, int x, int y, int width, int height, u16 oam2)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);

    if (proc != NULL)
    {
        proc->valid[index] = true;

        proc->x[index] = x;
        proc->y[index] = y;
        proc->width[index] = width;
        proc->height[index] = height;
        proc->oam2[index] = oam2;
    }
}

void DisableSysBlackBox(int index)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);
    if (proc != NULL)
        proc->valid[index] = 0;
}

void BlockAllSysBlackBoxs(void)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);
    if (proc != NULL)
        Proc_Goto(proc, 1);
}

void UnblockAllSysBlackBoxs(void)
{
    struct SysBlackBoxProc * proc = Proc_Find(ProcScr_SysBlackBox);
    if (proc != NULL)
    {
        Proc_Goto(proc, 0);
        SysBlackBoxSetGfx(proc->chr * CHR_SIZE);
    }
}

void EndSysBlackBoxs(void)
{
    Proc_End(Proc_Find(ProcScr_SysBlackBox));
}

void ParallelWorker_OnLoop(struct ParallelWorkerProc * proc)
{
    proc->func(proc->proc_parent);
    return;
}
