#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

extern u8 data_08B3F1F0[];
extern u8 data_08B3F204[];

void OpAnim1_UpdateScrollOneLine(s16 index);

//! FE8U = 0x080C8278
void OpAnimEirikaDisplayName(struct ProcOpAnim * proc)
{
    int i;

    OpAnimDrawSplitLine(8, 0x88);
    PutSpriteExt(1, 8, 0x78, (const u16 *)data_08B3F1F0, 0x000020A0);
    PutSpriteExt(1, 8, 0x88, (const u16 *)data_08B3F204, 0x000020C0);

    switch (proc->timer)
    {
        case 0:
            for (i = 0; i < 8; i++)
            {
                OpAnim1_UpdateScrollOneLine(i);
            }

            break;

        case 1:
            for (i = 8; i < 0x10; i++)
            {
                OpAnim1_UpdateScrollOneLine(i);
            }

            break;

        case 2:
            for (i = 0x10; i < 0x16; i++)
            {
                OpAnim1_UpdateScrollOneLine(i);
            }

            break;
    }

    if (proc->timer == 0x38)
    {
        proc->timer = 0;
        proc->unk34 = proc->unk30;
        proc->unk36 = proc->unk32;

        SetDispEnable(1, 0, 1, 1, 1);

        for (i = 0; i < 0x280; i++)
        {
            gBG2TilemapBuffer[i] = (gBG2TilemapBuffer[i] & 0x7FFF) | 0xf000;
        }

        Proc_Break(proc);
    }
    else
    {
        proc->timer++;
    }

    return;
}
