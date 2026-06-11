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
void LABattleMap_MoveSelectCursor(u16 keys, s8 flag);

//! FE8U = 0x08049C18
void LABattleMap_UpdateCursorMu(void)
{
    struct Unit * unitA;
    struct Unit * unitB;

    if (gUnk_Sio_16.unk_02 == gUnk_Sio_16.unk_03)
    {
        return;
    }

    unitA = GetUnit(gUnk_42[gUnk_Sio_16.unk_03]);
    unitB = GetUnit(gUnk_42[gUnk_Sio_16.unk_02]);

    if (unitA != NULL)
    {
        EndAllMus();
        ShowUnitSprite(unitA);
    }

    if (unitB == NULL)
    {
        return;
    }

    if ((unitB->state & US_UNSELECTABLE) != 0)
    {
        return;
    }

    if ((gUnk_42[gUnk_Sio_16.unk_02] >> 6) != gSioSt->selfId)
    {
        return;
    }

    DisableMuCamera(StartMu(unitB));
    HideUnitSprite(unitB);

    return;
}

//! FE8U = 0x08049C94
bool UnitHasUsableWeapon(struct Unit * unit)
{
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = unit->items[i];

        if ((GetItemAttributes(item) & IA_WEAPON) == 0)
        {
            continue;
        }

        if (CanUnitUseWeapon(unit, item) == 1)
        {
            return true;
        }
    }

    return false;
}

//! FE8U = 0x08049CD4
void LABattleMap_CheckNoDamageStall_Loop(ProcPtr proc)
{
    if (gUnk_Sio_16.unk_09 >= gLinkArenaSt.unk_A0 * 3)
    {
        EndLinkArenaPointsBox();
        Proc_Goto(proc, 3);
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x08049D0C
void LABattleMap_WaitSioSendDrain_Loop(ProcPtr proc)
{
    if (Sio_GetPendingSendCount() < 8)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x08049D24
void LABattleMap_SelectAttacker_Loop(struct SioBattleMapProc * proc)
{
    int x;
    int y;

    // clang-format off

    u8 gUnknown_080D9FB5[2] =
    {
        MOVE_CMD_MOVE_UP,
        MOVE_CMD_HALT,
    };

    // clang-format on

    u8 previous = gUnk_Sio_16.unk_02;

    LABattleMap_UpdateCursorMu();
    LABattleMap_MoveSelectCursor(gKeyStatusPtr->repeatedKeys, 0);

    gActiveUnitId = gUnk_42[gUnk_Sio_16.unk_02];
    gActiveUnit = GetUnit(gActiveUnitId);

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        if (((gActiveUnitId >> 6) == gSioSt->selfId) && (UnitHasUsableWeapon(gActiveUnit) == 1))
        {
            PlaySoundEffect(SONG_69);
            EndAllMus();

            gUnk_46[0] = StartMu(gActiveUnit);
            DisableMuCamera(gUnk_46[0]);
            SetMuMoveScript(gUnk_46[0], gUnknown_080D9FB5);

            proc->unk_2c = gActiveUnit->xPos;
            proc->unk_30 = gActiveUnit->yPos - 1;
            gActiveUnit->state |= US_HIDDEN;

            LinkArenaBattleMap_RefreshMapAndSprites();

            gUnk_Sio_16.unk_04 = gUnk_Sio_16.unk_02;

            LABattleMap_MoveSelectCursor(0x40, 1);
            LinkArenaBattleMap_SendCommand(1, gActiveUnitId, 0, 0);

            Proc_Goto(proc, 5);
            return;
        }

        PlaySoundEffect(SONG_6C);
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        if ((gActiveUnit->state & US_BIT9) == 0)
        {
            EndAllMus();
            Proc_Goto(proc, 4);
            return;
        }
    }

    if ((gKeyStatusPtr->newKeys & START_BUTTON) != 0)
    {
        EndLinkArenaPointsBox();

        if (!gPlaySt.config.disableSoundEffects)
        {
            // Interestingly this does not seem to use the normal PlaySoundEffect macro
            m4aSongNumStart(SONG_68);
            Proc_Goto(proc, 2);
        }

        return;
    }

    x = gActiveUnit->xPos * 16;
    y = gActiveUnit->yPos * 16;

    SetCursorMapPosition(gActiveUnit->xPos, gActiveUnit->yPos);

    if (GetGameClock() - 1 == gUnk_44)
    {
        x = (x + gUnk_43.x) >> 1;
        y = (y + gUnk_43.y) >> 1;
    }

    gUnk_43.x = x;
    gUnk_43.y = y;

    gUnk_44 = GetGameClock();

    PutMapCursor(x, y, 0);

    if (previous != gUnk_Sio_16.unk_02)
    {
        PlaySoundEffect(SONG_65);
    }

    return;
}
