#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

extern u8 data_08B3F1CE[];
extern u8 data_08B3F1DC[];

void OpAnimEphraimDisplayName(struct ProcOpAnim * proc)
{
    int i;

    OpAnimDrawSplitLine(0xE8, 0x88);
    PutSpriteExt(1, 0xaa, 0x78, (const u16 *)data_08B3F1CE, 0x00002056);
    PutSpriteExt(1, 0x98, 0x88, (const u16 *)data_08B3F1DC, 0x0000207A);

    if (proc->timer == 0x38)
    {
        proc->timer = 0;
        proc->unk34 = proc->unk30;
        proc->unk36 = proc->unk32;

        SetDispEnable(1, 0, 1, 1, 1);

        for (i = 0; i < 0x280; ++i)
            gBG2TilemapBuffer[i] = (gBG2TilemapBuffer[i] & 0x7FFF) | 0xF000;

        Proc_Break(proc);
        return;
    }
    proc->timer++;
}
