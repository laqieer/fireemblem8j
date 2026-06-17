#include "global.h"
#include "hardware.h"
#include "bmsave.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "constants/msg.h"
#include "sio_core.h"
#include "sio.h"

void SioRuleSettings_Loop_Main(struct ProcSioRuleSettings * proc)
{
    u8 buf[4];
    u8 change = 0;
    int var = 0;

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        SioPlaySoundEffect(1);
        WriteMultiArenaSaveConfig(&gSioSaveConfig);
        Proc_Break(proc);
    }

    LoadLinkArenaRuleSettings(buf);

    if (((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0) && (proc->unk_30 != 0))
    {
        proc->unk_30--;
        change = 1;
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && (proc->unk_30 < 2))
    {
        proc->unk_30++;
        change++;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_LEFT) != 0)
    {
        buf[proc->unk_30] = (buf[proc->unk_30] - 1) & 1;
        SioRuleSettings_DrawRuleOptions(proc->unk_30, buf[proc->unk_30]);
        change++;
    }

    if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) != 0)
    {
        buf[proc->unk_30] = (buf[proc->unk_30] + 1) & 1;
        SioRuleSettings_DrawRuleOptions(proc->unk_30, buf[proc->unk_30]);
        change++;
    }

    SaveLinkArenaRuleSettings(buf);

    if (change != 0)
    {
        SioPlaySoundEffect(3);

        if (proc->unk_30 == 1)
        {
            var = -2;
        }

        UpdateRuleSettingSprites(
            proc->unk_2c, proc->unk_30, (gLinkArenaRuleData[proc->unk_30].xPos[buf[proc->unk_30]] + var) * 8,
            ((proc->unk_30 * 3) * 8) + 48);

        PutSioText(0x6D0 + proc->unk_30, 1);
    }

    return;
}
