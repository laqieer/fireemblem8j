#include "global.h"

#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"

#include "sio_core.h"
#include "sio.h"

#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

//! FE8U = 0x0804B624
void LAUnitDeaths_FindNextAndStart(struct SioBattleMapProc * proc)
{
    struct Unit * unit;
    struct MuProc * mu;

    while (1)
    {
        if (proc->unk_58 == 5)
        {
            Proc_Goto(proc, 1);
            return;
        }

        unit = GetUnit(proc->unk_5c + proc->unk_58 + 1);

        if ((unit->state & (US_DEAD | US_BIT16)) != 0)
        {
            proc->unk_58++;
            continue;
        }

        if (unit->pCharacterData == NULL)
        {
            proc->unk_58++;
            continue;
        }

        break;
    }

    RefreshUnitSprites();
    HideUnitSprite(unit);

    mu = StartMu(unit);

    gWorkingMovementScript[0] = MOVE_CMD_MOVE_DOWN;
    gWorkingMovementScript[1] = MOVE_CMD_HALT;

    SetMuMoveScript(mu, gWorkingMovementScript);

    StartLinkArenaMUDeathFade(mu);

    proc->unk_54 = mu;
    proc->unk_58++;

    unit->state &= ~US_BIT9;
    unit->state |= (US_HIDDEN | US_DEAD);

    return;
}
