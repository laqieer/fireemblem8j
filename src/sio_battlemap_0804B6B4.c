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
void LinkArenaBattleMap_AdvancePhase(int faction);
bool UnitHasUsableWeapon(struct Unit * unit);

//! FE8U = 0x0804A914
void LABattleMap_EliminateTeamsWithoutAttackers(void)
{
    int i;

    for (i = 0; i < 4; i++)
    {
        int j;
        int countA;
        int countB;

        if (Sio_IsPlayerConnected(i) == 0)
        {
            continue;
        }

        countA = 0;
        countB = 0;

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit;

            if (gUnk_42[i + j * 5] == 0)
            {
                continue;
            }

            countB++;

            unit = GetUnit(gUnk_42[i + j * 5]);

            if ((unit->state & (US_DEAD | US_BIT16)) != 0)
            {
                continue;
            }

            if (UnitHasUsableWeapon(unit) == 1)
            {
                countA++;
            }
        }

        if ((countA == 0) && (countB != 0))
        {
            gUnk_Sio_16.unk_0A[i] = 0;
        }
    }

    return;
}

//! FE8U = 0x0804A9A4
void LABattleMap_RecordEliminationAndAdvance(ProcPtr proc)
{
    u8 r4_;

    u8 r6 = gUnk_42[gUnk_Sio_16.unk_04];
    u8 r7 = gUnk_42[gUnk_Sio_16.unk_05];

    struct Unit * r4 = GetUnit(r6);
    struct Unit * r2 = GetUnit(r7);

    if ((r4->state & (US_DEAD | US_BIT16)) == 0)
    {
        r4->state &= ~US_HIDDEN;
    }

    if ((r2->state & (US_DEAD | US_BIT16)) == 0)
    {
        r2->state &= ~US_HIDDEN;
    }

    if (gUnk_Sio_16.unk_0A[r6 >> 6] == 0)
    {
        r4_ = r6 >> 6;
    }
    else if (gUnk_Sio_16.unk_0A[r7 >> 6] == 0)
    {
        r4_ = r7 >> 6;
    }
    else
    {
        goto _end;
    }

    gUnk_Sio_16.unk_0F[gLinkArenaSt.unk_A0 - gUnk_Sio_16.unk_0E] = r4_;
    gUnk_Sio_16.unk_0E++;

    if (gUnk_Sio_16.unk_0E == gLinkArenaSt.unk_A0)
    {

        if (gUnk_Sio_16.unk_0A[r6 >> 6] != 0)
        {
            r4_ = r6 >> 6;
        }
        else
        {
            r4_ = r7 >> 6;
        }

        gUnk_Sio_16.unk_0F[0] = r4_;

        LinkArenaBattleMap_AdvancePhase(0xff);

        Proc_Break(proc);

        return;
    }

_end:
    LinkArenaBattleMap_AdvancePhase(gPlaySt.faction);
    Proc_Break(proc);

    return;
}
