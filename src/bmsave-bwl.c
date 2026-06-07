#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





/* prototypes for same-file helpers called by this run */
struct ChapterStats *GetChapterStats(int index);
int GetNextChapterStatsSlot(void);
bool IsChapterBelongCurGame(u32 ch_index);

int GetCurCompleteChapters()
{
    struct ChapterStats *cur = GetChapterStats(0);
    int ret;

    for (ret = 0; cur->chapter_turn; cur++) {
        if (IsChapterBelongCurGame(cur->chapter_index))
            ret++;
    }

    return ret;
}

int GetNextChapterStatsEntry()
{
    int index = GetNextChapterStatsSlot();

    if (0 == index)
        return -1;
    else
        return GetChapterStats(index - 1)->chapter_index;
}

void RegisterChapterTimeAndTurnCount(struct PlaySt * play_st)
{
    struct ChapterStats *chstat = GetChapterStats(GetNextChapterStatsSlot());
    int time, turn;
    
    time = (GetGameClock() - play_st->time_chapter_started) / (FRAMES_PER_SECOND * 3);
    if (time > 50 * 60 * 20)
        time = 50 * 60 * 20;

    turn = play_st->chapterTurnNumber;
    if (turn > 500)
        turn = 500;

    chstat->chapter_index = play_st->chapterIndex;
    chstat->chapter_turn = turn;
    chstat->chapter_time = time;
    
}

int GetGameTotalTime_unused()
{
    int time = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;

    if (time < index)
        for (; i < index; i++)
            time += GetChapterStats(i)->chapter_time * 180;

    return time;
}

int GetGameTotalTurnCount()
{
    int ret = 0;
    int index = GetNextChapterStatsSlot();
    int i = 0;

    if (ret < index)
        for (; i < index; i++)
            ret += GetChapterStats(i)->chapter_turn;

    return ret;
}
