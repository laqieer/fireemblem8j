#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmsave.h"
#include "ctc.h"
#include "sio.h"
#include "sio_core.h"

#include "constants/items.h"
#include "constants/songs.h"

struct ProcCmd CONST_DATA ProcScr_HOLD[] = {
    PROC_NAME("HOLD"),
    PROC_REPEAT(SioHold_Loop),
    PROC_END,
};

void SioHold_Loop(struct ProcSioHold * proc)
{
    if (proc->y < proc->y_max && proc->y > proc->y_min)
        DisplayFrozenUiHand(proc->x, proc->y);
}

ProcPtr StartSioHold(ProcPtr parent, int x, int y, int y_max, int y_min)
{
    struct ProcSioHold * proc;
    proc = Proc_Start(ProcScr_HOLD, parent);
    proc->x = x;
    proc->y = y;
    proc->y_max = y_max;
    proc->y_min = y_min;
    return proc;
}

void EndSioHold(void)
{
    Proc_EndEach(ProcScr_HOLD);
}

void MoveSioHold(ProcPtr proc, int num)
{
    ((struct Proc *)proc)->y += num;
}

void ClearSioBG(void)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);
}

void ClearSioBGFull(void)
{
    BG_SetPosition(BG_0, 0, 0);
    BG_SetPosition(BG_1, 0, 0);
    BG_SetPosition(BG_2, 0, 0);
    BG_SetPosition(BG_3, 0, 0);

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_Fill(gBG3TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);
}

void PutSioText(int msg, int text_idx)
{
    struct Text * text = &gSioTexts[text_idx];

    ClearText(text);

    if (msg < 0)
    {
        PutText(text, TILEMAP_LOCATED(gBG2TilemapBuffer, 1, text_idx * 2 + 0x10));
    }
    else
    {
        Text_DrawString(text, GetStringFromIndex(msg));
        PutText(text, TILEMAP_LOCATED(gBG2TilemapBuffer, 1, text_idx * 2 + 0x10));
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    }
}

void InitSioTexts(void)
{
    int i;
    for (i = 0; i < 6; i++)
        InitText(&gUnk_Sio_7[i], 12);

    for (i = 0; i < 11; i++)
        InitText(&gLinkArenaSt.texts[i], 12);

    for (i = 0; i < 2; i++)
        InitText(&gSioTexts[i], 24);
}

void GiveUnitDefaultWeapons(struct Unit * unit)
{
    int i;
    u8 item_list[] = {
        ITEM_SWORD_IRON,
        ITEM_LANCE_IRON,
        ITEM_AXE_IRON,
        ITEM_BOW_IRON,
        ITEM_NONE,
        ITEM_ANIMA_FIRE,
        ITEM_LIGHT_LIGHTNING,
        ITEM_DARK_FLUX,
    };

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
        unit->items[i] = 0;

    for (i = 0; i < 8; i++)
    {
        if (i == 4)
            continue;

        if (unit->ranks[i] == 0)
            continue;

        UnitAddItem(unit, item_list[i] | (0xFF << 8));
    }
}

void SioPlaySoundEffect(int idx)
{
    u16 sfx_list[] = { SONG_6C, SONG_SE_SYS_WINDOW_CANSEL1, SONG_SE_SYS_WINDOW_SELECT1, SONG_SE_SYS_CURSOR_UD1 };
    PlaySoundEffect(sfx_list[idx]);
}

void SetSioSaveConfigFlag3(void)
{
    ReadMultiArenaSaveConfig(&gSioSaveConfig);
    gSioSaveConfig._unk3_ = true;
    WriteMultiArenaSaveConfig(&gSioSaveConfig);
}

bool IsKeyInputSequenceComplete(const u16 * list)
{
    if (gKeyStatusPtr->newKeys == 0)
    {
        if (++gKeyInputSequenceTimer >= 60)
        {
            gTargetKeyInSeqIndex = gKeyInputSequenceTimer = 0;
        }
        return false;
    }

    gKeyInputSequenceTimer = 0;
    gKeyInputSequenceBuffer[gCurrentKeyInSeqIndex] = gKeyStatusPtr->newKeys;

    if (gKeyInputSequenceBuffer[gCurrentKeyInSeqIndex] == list[gTargetKeyInSeqIndex])
    {
        gTargetKeyInSeqIndex = gTargetKeyInSeqIndex + 1;

        if (list[gTargetKeyInSeqIndex] == 0xFFFF)
            return true;
    }
    else
    {
        gTargetKeyInSeqIndex = 0;
    }

    gCurrentKeyInSeqIndex = (gCurrentKeyInSeqIndex + 1) & 0xF;
    return false;
}

bool CheckSioKeyInputSequence2(void)
{
    return IsKeyInputSequenceComplete(gSioList_SioMain2_2);
}
