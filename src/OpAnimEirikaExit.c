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

void OpAnimEirikaExit(struct ProcOpAnim * proc)
{
    int time, time1, time2, ret;

    BG_EnableSyncByMask(BG2_SYNC_BIT | BG0_SYNC_BIT);

    if (proc->timer < 2)
    {
        PutSpriteExt(1, 0xAA, 0x78, (const u16 *)data_08B3F1CE, 0x00002046);
        PutSpriteExt(1, 0x98, 0x88, (const u16 *)data_08B3F1DC, 0x00002066);
    }

    if (proc->timer < 0x11)
    {
        gOpAnimSt.unk06 =
            Interpolate(1, 0x78, 0xA0, proc->timer, 0x10);

        ret = Interpolate(1, 0xE8, 0x100, proc->timer, 0x10);
        OpAnimDrawSplitLine(ret, gOpAnimSt.unk06 + 0x10);

        if (proc->timer == 0x10)
            SetPrimaryHBlankHandler(NULL);
    }

    time  = proc->timer;
    time1 = time - 4;

    if (time1 >= 0)
    {
        if (time1 <= 0x18)
        {
            ret = Interpolate(1, proc->unk34, 0x170, time1, 0x18);
            TsaModifyFirstPalMaybe(ret, proc->unk30, 0x88, BG_2, (void *)gGenericBuffer + 0x1000, NULL, 1);
            proc->unk30 = ret;
        }

        time2 = -0xB + time;
        if (time2 >= 0)
        {
            if (time1 == 0x18)
            {
                SetBlendTargetA(1, 0, 0, 0, 0);
                SetBlendTargetB(0, 0, 0, 1, 0);
            }

            if (time1 > 0x17)
            {
                ret = Interpolate(0, 0x10, 0, time - 0x1B, 0x8);
                SetBlendConfig(1, ret, 0x10 - ret, 8);
            }
            ret = Interpolate(1, proc->unk36, 0x180, time2, 0x18);
            TsaModifyFirstPalReverse(ret, proc->unk32, 0xC8, BG_0, (void *)gGenericBuffer, (void *)(gGenericBuffer + 0x800), 0);
            proc->unk32 = ret;

            if (time2 == 0x18)
            {
                proc->timer = 0;
                Proc_Break(proc);
                return;
            }
        }
    }
    proc->timer++;
}
