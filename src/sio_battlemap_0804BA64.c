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

/* prototypes for same-file helpers called by this run */
void LABattleMap_PollSurrenderInput(void);
void LABattleMap_StartMuAndSavePosition(struct Unit * unit, int idx, int * xOut, int * yOut);

//! FE8U = 0x0804ACC4
void LABattleMap_ReceiveForecastResponse(struct SioProc85AA4CC * proc)
{
    struct Unit * unitA;
    struct Unit * unitB;
    u8 buf[4];

    u16 got = SioReceiveData(gUnk_45, buf, LABattleMap_IsForecastMsg);

    if (got != 0)
    {
        switch (gUnk_45[0])
        {
            case 4:
                unitA = GetUnit(gUnk_45[2]);

                if ((unitA->state & US_BIT9) == 0)
                {
                    EndMu(gUnk_46[1]);
                }
                else
                {
                    unitA->xPos = proc->unk_34;
                    unitA->yPos = proc->unk_38;
                }

                unitA->state &= ~US_HIDDEN;

                RefreshUnitSprites();
                Proc_Goto(proc, 1);

                break;

            case 5:
                unitA = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);
                unitB = GetUnit(gUnk_42[gUnk_Sio_16.unk_05]);

                if ((unitA->state & US_BIT9) != 0)
                {
                    LABattleMap_StartMuAndSavePosition(unitA, 0, &proc->unk_2c, &proc->unk_30);
                }

                if ((unitB->state & US_BIT9) != 0)
                {
                    LABattleMap_StartMuAndSavePosition(unitB, 1, &proc->unk_34, &proc->unk_38);
                }

                Proc_Break(proc);

                break;
        }
    }

    LABattleMap_PollSurrenderInput();

    return;
}
