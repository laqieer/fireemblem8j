#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

//! FE8U = 0x080B6144
int GetChapterTacticsRank(void) {
    int i;
    int rankThresholds[4];

    u16 turn = gPlaySt.chapterTurnNumber;
    struct ROMChapterData* chapter = &gChapterDataTable[gPlaySt.chapterIndex];

    rankThresholds[0] = chapter->turnsForTacticsRankDInEliwoodStory[IsDifficultMode()];

    rankThresholds[1] = chapter->turnsForTacticsRankCInEliwoodStory[IsDifficultMode()];

    rankThresholds[2] = chapter->turnsForTacticsRankBInEliwoodStory[IsDifficultMode()];

    rankThresholds[3] = chapter->turnsForTacticsRankAInEliwoodStory[IsDifficultMode()];

    for (i = 0; i < 4; i++) {
        if (turn > rankThresholds[i]) {
            return i;
        }
    }

    return i;
}
