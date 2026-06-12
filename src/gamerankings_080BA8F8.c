#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

//! FE8U = 0x080B5D74
int GetGameTacticsRank(void) {
    int gameTotalTurns;
    int nextIndex;
    int i;
    int rankThresholds[4];

    gameTotalTurns = GetGameTotalTurnCount2();

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterStats* ent = GetChapterStats(i);

        if (IsChapterBelongCurGame(ent->chapter_index) != 0) {
            rankThresholds[0] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankDInEliwoodStory[IsDifficultMode()];

            rankThresholds[1] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankCInEliwoodStory[IsDifficultMode()];

            rankThresholds[2] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankBInEliwoodStory[IsDifficultMode()];

            rankThresholds[3] += gChapterDataTable[ent->chapter_index].turnsForTacticsRankAInEliwoodStory[IsDifficultMode()];
        }
    }

    for (i = 0; i < 4; i++) {
        if (gameTotalTurns > rankThresholds[i]) {
            return i;
        }
    }

    return i;
}
