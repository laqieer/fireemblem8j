#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

//! FE8U = 0x0800D5A4
u8 Event01_End(struct EventEngineProc * proc)
{
    s8 i;
    u16 flag;

    if (!(proc->evStateBits & EV_STATE_ABORT))
    {
        if (EVT_SUB_CMD(proc->pEventCurrent) == EVSUBCMD_ENDB)
        {
            for (i = 0; i < 8; i++)
            {
                gEventActiveQueue[i].evt1 = NULL;
                gEventActiveQueue[i].evt2 = NULL;
            }
        }

        if (gEventActiveQueue[0].evt1 != NULL)
        {
            proc->pEventIdk = gEventActiveQueue[0].evt1;
            proc->pEventCurrent = gEventActiveQueue[0].evt2;

            for (i = 0; i < 7; i++)
            {
                gEventActiveQueue[i].evt1 = gEventActiveQueue[i + 1].evt1;
                gEventActiveQueue[i].evt2 = gEventActiveQueue[i + 1].evt2;
            }

            gEventActiveQueue[i].evt1 = NULL;
            gEventActiveQueue[i].evt2 = NULL;
            return EVC_ADVANCE_CONTINUE;
        }

        switch (proc->execType) {
            case EV_EXEC_WORLDMAP:
                proc->execType = EV_EXEC_UNK4;
                return EVC_END;

            case EV_EXEC_CUTSCENE:
                proc->evStateBits &= ~EV_STATE_SKIPPING;
                proc->evStateBits |= EV_STATE_NOSKIP;

                proc->execType = EV_EXEC_UNK5;

                proc->pEventIdk = (u16 *)EventScr_CutsceneExecEnd;
                proc->pEventCurrent = (u16 *)EventScr_CutsceneExecEnd;

                return EVC_STOP_CONTINUE;

            default:
                return EVC_END;
        }
    }

    return EVC_END;
}
