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
void LinkArenaBattleMap_RefreshMapAndSprites(void);
u16 LinkArenaBattleMap_SendCommand(u8 a, u8 b, u8 c, u8 d);
void LABattleMap_StartPointsBox(ProcPtr unused);

//! FE8U = 0x0804A44C
void LABattleMap_ConfirmTarget(struct SioBattleMapProc * proc)
{
    struct Unit * unit = GetUnit(gUnk_42[gUnk_Sio_16.unk_05]);

    ClearBg0Bg1();

    if (gUnk_Sio_16.unk_06 == 0)
    {
        if ((unit->state & US_BIT9) == 0)
        {
            EndMu(gUnk_46[1]);
        }
        else
        {
            unit->xPos = proc->unk_34;
            unit->yPos = proc->unk_38;
        }

        unit->state &= ~US_HIDDEN;

        RefreshUnitSprites();

        gUnk_Sio_16.unk_02 = gUnk_Sio_16.unk_05;
        gUnk_Sio_16.unk_03 = gUnk_Sio_16.unk_05 + 1;
        LinkArenaBattleMap_SendCommand(4, 0, gUnk_42[gUnk_Sio_16.unk_05], 0);
        LABattleMap_StartPointsBox(proc);
        Proc_Goto(proc, 5);
    }
    else
    {
        if ((unit->state & US_BIT9) != 0)
        {
            gUnk_46[1] = (void *)StartMu(unit);
            proc->unk_34 = unit->xPos;
            proc->unk_38 = unit->yPos;
            unit->state &= ~US_BIT9;
        }

        LinkArenaBattleMap_SendCommand(5, 0, gUnk_Sio_16.unk_06, gUnk_Sio_16.unk_07);
    }

    return;
}

//! FE8U = 0x0804A51C
void LABattleMap_StartCombatantWarpFx(struct SioBattleMapProc * proc)
{
    struct Unit * unitA = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);
    struct Unit * unitB = GetUnit(gUnk_42[gUnk_Sio_16.unk_05]);

    unitA->xPos = proc->unk_2c;
    unitA->yPos = proc->unk_30;

    unitB->xPos = proc->unk_34;
    unitB->yPos = proc->unk_38;

    StartSioWarpFx(unitA, gUnk_46[0], 6, 5, 1, 1, proc);
    StartSioWarpFx(unitB, gUnk_46[1], 8, 5, 0, 0, proc);

    return;
}

//! FE8U = 0x0804A5A4
void LABattleMap_PrepareCombatantSprites(void)
{
    struct Unit * unitB;
    struct Unit * unitA = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);

    // clang-format off

    u8 gUnknown_080D9FB7[2] =
    {
        MOVE_CMD_MOVE_RIGHT,
        MOVE_CMD_HALT,
    };

    // clang-format on

    EndMu(gUnk_46[1]);

    unitB = GetUnit(gUnk_42[gUnk_Sio_16.unk_05]);
    unitB->state &= ~US_HIDDEN;

    if (gUnk_45[2] == 1)
    {
        SetMuMoveScript(gUnk_46[0], gUnknown_080D9FB7);
        unitA->xPos = 7;
    }

    LinkArenaBattleMap_RefreshMapAndSprites();

    return;
}
