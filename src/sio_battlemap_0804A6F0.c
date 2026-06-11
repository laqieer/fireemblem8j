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
void EndLinkArenaFogPlaceholders(void);

//! FE8U = 0x080498F4
void LinkArenaBattleMap_StartSelectedUnitMu(void)
{
    struct Unit * unit = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);

    gUnk_46[0] = StartMu(unit);

    SetMuScreenPosition(gUnk_46[0], unit->xPos * 16, (unit->yPos - 1) * 16);

    DisableMuCamera(gUnk_46[0]);
    SetMuFacing(gUnk_46[0], 3);

    return;
}

//! FE8U = 0x08049940
void LinkArenaBattleMap_WaitLButton(ProcPtr proc)
{
    if ((gKeyStatusPtr->newKeys & L_BUTTON) != 0)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08049964
void LABattleMap_StartFactionTurn(ProcPtr parent)
{
    switch (gLinkArenaSt.unk_00)
    {
        case 1:
            if (gPlaySt.faction == FACTION_BLUE)
            {
                Proc_StartBlocking(gSioBattlemap_6, parent);
            }
            else
            {
                Proc_StartBlocking(gSioBattlemap_8, parent);
            }

            break;

        case 2:
            if (gPlaySt.faction == gSioSt->selfId)
            {
                Proc_StartBlocking(gSioBattlemap_6, parent);
            }
            else
            {
                Proc_StartBlocking(gSioBattlemap_7, parent);
            }

            break;
    }

    Proc_Break(parent);

    return;
}

//! FE8U = 0x080499D0
void LABattleMap_BeginTurn(ProcPtr proc)
{
    int i = 0;

    if (gLinkArenaSt.unk_00 == 1)
    {
        if (gLinkArenaSt.unk_0B == 1)
        {
            Proc_Goto(proc, 3);
            return;
        }
    }
    else if (gLinkArenaSt.unk_0B == 2)
    {
        Proc_Goto(proc, 3);
        return;
    }

    if (gUnk_Sio_16.unk_01 == 0xFF)
    {
        Proc_Goto(proc, 2);
        return;
    }

    gPlaySt.faction = gUnk_Sio_16.unk_01;

    for (; gUnk_42[i] == 0; i++)
    {
    }

    gUnk_Sio_16.unk_02 = i;
    gUnk_Sio_16.unk_03 = i + 1;

    LoadObjUIGfx();

    for (i = 0; i < 4; i++)
    {
        gUnk_Sio_16.unk_2c[i].newScore = 0;
        gUnk_Sio_16.unk_2c[i].unitId = 0;
    }

    SetupDebugFontForOBJ(-1, 9);

    return;
}

//! FE8U = 0x08049A60
int LinkArena_GetPlayerRanking(void)
{
    int i;

    u32 ret = 4;

    u32 score = gUnk_Sio_16.currentScore[gSioSt->selfId];

    if (gLinkArenaSt.unk_ec.unk_0_1)
    {
        for (i = 0; i < 4; i++)
        {
            if (Sio_IsPlayerConnected(i) && (gSioSt->selfId == gUnk_Sio_16.unk_0F[i]))
            {
                return i;
            }
        }

        ret = 3;
    }
    else
    {
        for (i = 0; i < 4; i++)
        {
            if (!Sio_IsPlayerConnected(i))
            {
                ret--;
                continue;
            }

            if (gSioSt->selfId == i)
            {
                ret--;
                continue;
            }

            if (score > gUnk_Sio_16.currentScore[i])
            {
                ret--;
                continue;
            }
        }
    }

    return ret;
}

//! FE8U = 0x08049B04
void LABattleMap_End(void)
{
    Proc_EndEach(gProc_MapTask);

    EndLinkArenaFogPlaceholders();

    BMapVSync_End();
    Sound_FadeOutBGM(1);

    return;
}
