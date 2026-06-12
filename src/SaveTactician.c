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

void SioUpdateTeam(char * str, int team);

void SaveTactician(struct ProcTactician * proc, const struct TacticianTextConf * conf)
{
    if (proc->str[0] != '\0')
    {
        SioPlaySoundEffect(2);

        if (CheckInLinkArena())
            SioUpdateTeam(proc->str, gLinkArenaSt.unk_03);
        else
            SetTacticianName(proc->str);

        Proc_Break(proc);
    }
    else
    {
        SioPlaySoundEffect(0);
    }
}
