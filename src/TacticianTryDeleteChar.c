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

//! FE8U = 0x08044A6C
void TacticianTryDeleteChar(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    if (proc->cur_len != 0)
    {
        SioPlaySoundEffect(2);

        if (proc->unk4C[proc->cur_len >> 1] == 0)
            proc->cur_len -= 2;

        *(proc->str + proc->cur_len) = 0;
        proc->unk4C[proc->cur_len >> 1] = 0;
        proc->unk39 = 0;

        TacticianDrawCharacters(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}
