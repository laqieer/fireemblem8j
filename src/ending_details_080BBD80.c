#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"

#include "ending_details.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(gameending) u16 gEndingDetailBuf[0x3D0];
extern EWRAM_OVERLAY(gameending) u16 gEndingTmScratchA[0x800 / 2];













extern u16 * CONST_DATA gSoloEndingBattleDispConf[];

extern struct Text * CONST_DATA gpCharacterEndingTexts;

/* prototypes for same-file helpers called by this run */
char * GetPidDefeatedEndingString(int pid);

//! FE8U = 0x080B72C4
void EndingBattleInitText(struct EndingBattleTextProc * proc)
{
    int i;

    proc->text = gpCharacterEndingTexts;

    proc->defaultPauseDelay = 4;
    proc->pauseTimer = 4;

    Text_SetCursor(proc->text, 0);
    Text_SetColor(proc->text, TEXT_COLOR_SYSTEM_WHITE);

    for (i = 0; i < 5; i++)
    {
        int y = TILEMAP_INDEX(0, 6 + i * 2);

        ClearText(gpCharacterEndingTexts + i);
        PutText(gpCharacterEndingTexts + i, gBG0TilemapBuffer + 2 + y);
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    if (proc->unitA->state & US_DEAD)
    {
        proc->str = GetPidDefeatedEndingString(proc->unitA->pCharacterData->number);

        if (proc->str != NULL)
        {
            return;
        }
    }

    proc->str = GetStringFromIndex(proc->pCharacterEnding->textId);

    return;
}
