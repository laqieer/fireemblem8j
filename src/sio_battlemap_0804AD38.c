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
void LinkArenaBattleMap_BackupUnitItems(struct Unit * unit);
void LinkArenaBattleMap_RefreshMapAndSprites(void);
u16 LinkArenaBattleMap_SendCommand(u8 a, u8 b, u8 c, u8 d);
void LinkArenaBattleMap_StartUnitMoveOut(u8 a, int b, u8 * c, int * xOut, int * yOut);
void LABattleMap_MoveSelectCursor(u16 keys, s8 flag);

//! FE8U = 0x08049F44
void LABattleMap_SelectTarget_Loop(struct SioBattleMapProc * proc)
{
    int x;
    int y;

    u8 previous = gUnk_Sio_16.unk_02;

    LABattleMap_MoveSelectCursor(gKeyStatusPtr->repeatedKeys, 1);

    gActiveUnitId = gUnk_42[gUnk_Sio_16.unk_02];

    gActiveUnit = GetUnit(gActiveUnitId);
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

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        PlaySoundEffect(SONG_69);

        LinkArenaBattleMap_StartUnitMoveOut(
            gUnk_42[gUnk_Sio_16.unk_02], 1, &gUnk_Sio_16.unk_05, &proc->unk_34, &proc->unk_38);
        LinkArenaBattleMap_SendCommand(3, gUnk_42[gUnk_Sio_16.unk_05], gActiveUnitId, 0);
        EndLinkArenaPointsBox();

        Proc_Goto(proc, 7);

        return;
    }

    if ((gKeyStatusPtr->newKeys & B_BUTTON) != 0)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        EndMu(gUnk_46[0]);
        GetUnit(gUnk_42[gUnk_Sio_16.unk_04])->state &= ~US_HIDDEN;

        LinkArenaBattleMap_RefreshMapAndSprites();

        gUnk_Sio_16.unk_02 = gUnk_Sio_16.unk_04;
        gUnk_Sio_16.unk_03 = gUnk_Sio_16.unk_04 + 1;

        LinkArenaBattleMap_SendCommand(2, gActiveUnitId, gUnk_42[gUnk_Sio_16.unk_04], 0);

        Proc_Goto(proc, 1);

        return;
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        if ((gActiveUnit->state & US_BIT9) == 0)
        {
            EndAllMus();
            Proc_Goto(proc, 6);
            return;
        }
    }

    if (previous != gUnk_Sio_16.unk_02)
    {
        PlaySoundEffect(SONG_65);
    }

    return;
}

//! FE8U = 0x0804A108
void LABattleMap_ForecastMenu_Init(struct SioProc85AA1AC * proc)
{
    ResetTextFont();

    gUnk_Sio_16.unk_06 = 0xff;

    gActiveUnit = GetUnit(gUnk_42[gUnk_Sio_16.unk_04]);
    LinkArenaBattleMap_BackupUnitItems(gActiveUnit);

    proc->unk_64 = GetGameLock();
    LoadIconPalettes(4);

    StartOrphanMenu(&gSioMenudef_1);

    return;
}
