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

extern struct TextInitInfo  gTextInitInfo_ChapterStatus[];
extern struct Text gChapterStatusText[2];

void ChapterStatus_DrawText(struct ChapterStatusProc * proc)
{
    const char * str;

    InitTextInitInfo(gTextInitInfo_ChapterStatus);

    ChapterStatus_SetupFont(proc);

    DrawChapterStatusTextForUnit(proc->units[proc->unitIndex]);

    PutNumber(TILEMAP_LOCATED(gBG1TilemapBuffer, 4, 5), TEXT_COLOR_SYSTEM_BLUE, proc->numAllyUnits);

    if (gPlaySt.chapterVisionRange != 0)
    {
        PutSpecialChar(TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH);
        PutSpecialChar(TILEMAP_LOCATED(gBG1TilemapBuffer, 12, 5), TEXT_COLOR_SYSTEM_BLUE, TEXT_SPECIAL_DASH);
    }
    else
    {
        PutNumber(TILEMAP_LOCATED(gBG1TilemapBuffer, 11, 5), TEXT_COLOR_SYSTEM_BLUE, proc->numEnemyUnits);
    }

    proc->numObjectiveTextLines = 1;

    str = GetStringFromIndex(
        GetBattleMapKind() != BATTLEMAP_KIND_SKIRMISH
            ? GetROMChapterStruct(gPlaySt.chapterIndex)->statusObjectiveTextId
            : 0x14A // "Defeat all monsters[.]"
    );

    Text_InsertDrawString(gChapterStatusText, GetStringTextCenteredPos(96, str), TEXT_COLOR_SYSTEM_WHITE, str);

    str = SplitObjectiveTextOnNewline(str);

    if (str != NULL)
    {
        Text_InsertDrawString(gChapterStatusText + 1, GetStringTextCenteredPos(96, str), TEXT_COLOR_SYSTEM_WHITE, str);
        proc->numObjectiveTextLines = 2;
    }

    if (proc->numObjectiveTextLines == 2)
    {
        PutText(gChapterStatusText + 0, TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 10));
        PutText(gChapterStatusText + 1, TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 12));
    }
    else
    {
        PutText(gChapterStatusText + 0, TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 11));
    }

    if (proc->timesCompleted != 0)
    {
        if (!(gPlaySt.chapterStateBits & PLAY_FLAG_POSTGAME))
        {
            PutNumberOrBlank(
                TILEMAP_LOCATED(gBG0TilemapBuffer, 26, 0), TEXT_COLOR_SYSTEM_WHITE, proc->timesCompleted + 1);
        }
    }

    DrawChapterStatusStatValues();

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
