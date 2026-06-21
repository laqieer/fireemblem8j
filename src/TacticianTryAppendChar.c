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

//! FE8U = 0x080449D4
void TacticianTryAppendChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    int cur_len;

    if (proc->cur_len < 2 * proc->max_len)
    {
        SioPlaySoundEffect(2);
        SioStrCpy(conf->str[proc->line_idx * 3], &proc->str[proc->cur_len]);

        proc->unk4C[proc->cur_len >> 1] = (0x3FFF & proc->conf_idx) | ((3 & proc->line_idx) << 14);
        cur_len = proc->cur_len + 2;

        if (cur_len < 2 * proc->max_len)
            proc->cur_len = cur_len;
        else
            proc->conf_idx = 5;

        TacticianDrawCharacters(proc);
        proc->unk39 = 0;
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}
