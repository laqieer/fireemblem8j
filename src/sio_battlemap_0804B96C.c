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
void LinkArenaBattleMap_StartUnitMoveOut(u8 a, int b, u8 * c, int * xOut, int * yOut);
void LABattleMap_PollSurrenderInput(void);

//! FE8U = 0x0804ABCC
void LABattleMap_ReceiveTargetSelection(struct SioProc85AA4CC * proc)
{
    struct Unit * unit;
    u8 buf[4];

    u16 got = SioReceiveData(gUnk_45, buf, LABattleMap_IsSelectOrCancelMsg);

    if (got != 0)
    {
        switch (gUnk_45[0])
        {
            case 2:
                unit = GetUnit(gUnk_45[2]);

                if ((unit->state & US_BIT9) == 0)
                {
                    EndMu(gUnk_46[0]);
                }
                else
                {
                    unit->xPos = proc->unk_2c;
                    unit->yPos = proc->unk_30;
                }

                unit->state &= 0xfffffffe;

                RefreshUnitSprites();

                Proc_Goto(proc, 0);

                break;

            case 3:
                LinkArenaBattleMap_StartUnitMoveOut(gUnk_45[1], 1, &gUnk_Sio_16.unk_05, &proc->unk_34, &proc->unk_38);
                Proc_Goto(proc, 2);
                break;
        }
    }

    LABattleMap_PollSurrenderInput();

    return;
}

//! FE8U = 0x0804AC68
void LABattleMap_StartMuAndSavePosition(struct Unit * unit, int idx, int * xOut, int * yOut)
{
    gUnk_46[idx] = StartMu(unit);

    *xOut = unit->xPos;
    *yOut = unit->yPos;

    unit->state &= ~US_BIT9;

    return;
}
