#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"

#include "constants/chapters.h"
#include "constants/msg.h"

extern struct Text * gpTurnRecordTexts;

//! FE8U = 0x080B7800
int HandleTurnRecordText(struct ChapterStats * chapterStats, int displayId)
{
    int r6;
    int y;
    int chapterTurn;
    int textIndex;

    int x = 6;
    s8 chapterIncrement = 0;

    textIndex = displayId % 9;
    y = (displayId * 2) & 0x1f;
    r6 = y * 0x20;

    TileMap_FillRect(gBG1TilemapBuffer + TILEMAP_INDEX(0, y), 31, 1, 0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    ClearText(gpTurnRecordTexts + 0 + textIndex);
    ClearText(gpTurnRecordTexts + 9 + textIndex);

    if ((u32)chapterStats == -1)
    {
        int gameTotalTurns = GetGameTotalTurnCount();

        PutDrawText(gpTurnRecordTexts + 9 + textIndex, gBG1TilemapBuffer + ({r6 + 0xB;}), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0x4CF));
        PutNumber(gBG1TilemapBuffer + ({r6 + 0x15;}), TEXT_COLOR_SYSTEM_BLUE, gameTotalTurns);
        PutText(gpTurnRecordTexts + 18, gBG1TilemapBuffer + ({r6 + 0x16;}));

        return 0;
    }

    if (chapterStats)
    {
        int chapterIndex = chapterStats->chapter_index;
        int prepNum = GetROMChapterStruct(chapterIndex)->prepScreenNumber >> 1;

        switch (chapterIndex)
        {
            case CHAPTER_L_PROLOGUE:
                PutDrawText(gpTurnRecordTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x - 1, y), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0xE3));
                break;

            case CHAPTER_E_21:
            case CHAPTER_E_21X:
            case CHAPTER_I_21:
            case CHAPTER_I_21X:
                PutDrawText(gpTurnRecordTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x - 1, y), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0xE2));
                break;

            case CHAPTER_L_5X:
                PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(x - 1, y), TEXT_COLOR_SYSTEM_BLUE, prepNum);
                PutDrawText(gpTurnRecordTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x, y), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0xE4));
                break;

            default:
                PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(x - 1, y), TEXT_COLOR_SYSTEM_BLUE, prepNum);
                PutDrawText(gpTurnRecordTexts + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x, y), TEXT_COLOR_SYSTEM_GOLD, 0, 0, GetStringFromIndex(0xE0));
                break;
        }

        switch (chapterIndex)
        {
            case CHAPTER_E_21:
            case CHAPTER_E_21X:
            case CHAPTER_I_21:
            case CHAPTER_I_21X:
                chapterTurn = chapterStats->chapter_turn;
                ++chapterStats;
                chapterTurn += chapterStats->chapter_turn;
                chapterIncrement = 1;
                break;

            default:
                chapterTurn = chapterStats->chapter_turn;
                break;
        }

        PutDrawText(gpTurnRecordTexts + 9 + textIndex, gBG1TilemapBuffer + TILEMAP_INDEX(x + 4, y), TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(GetROMChapterStruct(chapterIndex)->chapTitleTextId));
        PutNumber(gBG1TilemapBuffer + TILEMAP_INDEX(x + 15, y), TEXT_COLOR_SYSTEM_BLUE, chapterTurn);
        PutText(gpTurnRecordTexts + 18, gBG1TilemapBuffer + TILEMAP_INDEX(x + 16, y));
    }

    return chapterIncrement;
}
