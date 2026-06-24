#include "global.h"

#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"


void ChapterStatus_Init(struct ChapterStatusProc * proc)
{
    int i;

    SetupBackgrounds(NULL);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 2;

    ResetText();
    LoadUiFrameGraphics();

    proc->unk_3c = 0;
    proc->helpTextActive = false;
    proc->focusUnitOnExit = false;

    BG_SetPosition(BG_0, -2, -4);
    BG_SetPosition(BG_1, 0, -2);
    BG_SetPosition(BG_2, 0, -36);
    BG_SetPosition(BG_3, 0, 0);

    ClearBg0Bg1();

    ApplyPalettes(gUiFramePaletteA, 2, 3);
    Decompress(Img_MenuStatus_0, BG_CHR_ADDR(0x2C0));

    CallARM_FillTileRect(gBG2TilemapBuffer, Tsa_ChapterStatusUi, TILEREF(0x0, 1));

    Decompress(Img_PlayStatusSprites, OBJ_CHR_ADDR(0x180));
    ApplyPalettes(Pal_PlayStatusSprites, 0x18, 2);

    Decompress(Img_ChapterStatusSelectorSprite, OBJ_CHR_ADDR(0x198));

    SetDefaultColorEffects();

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    proc->unk_2d = 0;
    proc->unitIndex = 0;
    proc->timer = 0;

    proc->units[0] = GetUnitFromCharId(GetPlayerLeaderPid());

    proc->numAllyUnits = CountUnitsByFaction(FACTION_BLUE);

    proc->timesCompleted = GetGlobalCompletionCount();

    if (proc->units[0]->state & US_UNSELECTABLE)
    {
        proc->units[0]->state &= ~US_UNSELECTABLE;
        proc->restoreStateOnExit = true;
    }
    else
    {
        proc->restoreStateOnExit = false;
    }

    if (CountEnemyBossUnits() != 0)
    {
        proc->units[1] = GetEnemyBossUnit();
    }
    else
    {
        proc->units[1] = NULL;
    }

    proc->numEnemyUnits = CountUnitsByFaction(FACTION_RED);

    ApplyUnitSpritePalettes();

    for (i = 0; i < 2; i++)
    {
        if (proc->units[i] == NULL)
        {
            continue;
        }

        UseUnitSprite(GetUnitSMSId(proc->units[i]));
    }

    ForceSyncUnitSpriteSheet();

    SetWinEnable(1, 0, 0);
    SetWin0Box(0, 40, DISPLAY_WIDTH, 72);
    SetWin0Layers(1, 1, 1, 1, 1);
    SetWOutLayers(1, 0, 1, 1, 1);

    StartMuralBackground(proc, 0, 14);

    ApplyPalettes(Pal_CommGameBgScreenInShop, 14, 2);

    StartHelpPromptSprite(200, 18, 2, proc);

    Proc_Start(ProcScr_StatusScreenSpriteDraw, proc);

    SetDispEnable(0, 0, 0, 0, 0);

    return;
}
