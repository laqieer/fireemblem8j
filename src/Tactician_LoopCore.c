#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "sio.h"
#include "bmunit.h"
#include "sio_core.h"
#include "bmlib.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "uiutils.h"
#include "constants/characters.h"




void Tactician_LoopCore(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    char var;

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0)
    {
        Tactician_MoveHand(proc, 0, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0)
    {
        Tactician_MoveHand(proc, 1, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) != 0)
    {
        Tactician_MoveHand(proc, 2, conf);
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        Tactician_MoveHand(proc, 3, conf);
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        switch (conf->action) {
        case 0:
            TacticianTryAppendChar(proc, conf);
            break;

        case 4:
            TacticianTryDeleteChar(proc, conf);
            break;

        case 5:
            SaveTactician(proc, conf);
            break;

        case 6:
            Tactician_TryChangeLastCharVariant(proc, conf, 1, 0);

            break;

        case 7:
            Tactician_TryChangeLastCharVariant(proc, conf, 2, 0);

            break;

        case 1:
            if (proc->line_idx != 0)
            {
                SioPlaySoundEffect(2);
                proc->line_idx = 0;
                proc->unk39 = 0;

                Proc_Goto(proc, 1);
                return;
            }

            SioPlaySoundEffect(0);
            break;

        case 2:
            if (proc->line_idx != 1)
            {
                SioPlaySoundEffect(2);

                proc->line_idx = 1;
                proc->unk39 = 0;

                Proc_Goto(proc, 1);
                return;
            }

            SioPlaySoundEffect(0);
            break;

        case 3:
            if (proc->line_idx < 2 || proc->line_idx > 3)
            {
                SioPlaySoundEffect(2);

                proc->line_idx = 2;

                if (proc->unk32 != 0)
                {
                    proc->line_idx = 3;
                }

                proc->unk39 = 0;

                Proc_Goto(proc, 1);
                return;
            }

            SioPlaySoundEffect(0);

            break;
        }
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        var = proc->unk39;

        do
        {
            proc->unk39++;
            proc->unk39 = (proc->unk39 % 3);

            if (var == proc->unk39)
                break;

        } while (Tactician_TryChangeLastCharVariant(proc, conf, proc->unk39, 1) == 0);
    }

    if ((gKeyStatusPtr->newKeys & L_BUTTON) != 0)
    {
        TacticianTryDeleteChar(proc, conf);
    }

    if ((gKeyStatusPtr->newKeys & START_BUTTON) != 0)
    {
        SioPlaySoundEffect(3);
        proc->conf_idx = 5;
    }

    if ((gKeyStatusPtr->newKeys & SELECT_BUTTON) != 0)
    {
        SioPlaySoundEffect(2);

        proc->line_idx++;

        if ((proc->line_idx == 2) && (proc->unk32 != 0))
        {
            proc->line_idx++;
        }

        proc->line_idx %= 4;

        if (proc->line_idx == 3 && proc->unk32 == 0)
        {
            proc->line_idx = 0;
        }

        if (*conf->str[proc->line_idx * 3] == 0)
        {
            Tactician_MoveHand(proc, 2, conf);
        }

        Proc_Goto(proc, 1);
        return;
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        if (proc->cur_len != 0)
        {
            TacticianTryDeleteChar(proc, conf);
            return;
        }

        if (CheckInLinkArena() != 0)
        {
            SioPlaySoundEffect(1);
            Proc_Goto(proc, 3);
        }
    }

    return;
}
