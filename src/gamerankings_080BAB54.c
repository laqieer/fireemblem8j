#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

//! FE8U = 0x080B5FD0
int GetGameFundsRank(void) {
    u32 totalGoldComp;
    int i;

    int totalGold = GetPartyTotalGoldValue();
    int overallFundsRequirement = 0;

    int nextIndex = GetNextChapterStatsSlot();

    for (i = 0; i < nextIndex; i++) {
        struct ChapterStats* ent = GetChapterStats(i);

        if (IsChapterBelongCurGame(ent->chapter_index) != 0) {
            overallFundsRequirement += gChapterDataTable[ent->chapter_index].goldForFundsRankInEliwoodStory[IsDifficultMode()];
        }
    }

    totalGoldComp = totalGold * 100;

    if (totalGoldComp >= (overallFundsRequirement * 80)) {
        return 4;
    } else if (totalGoldComp >= (overallFundsRequirement * 60)) {
        return 3;
    } else if (totalGoldComp >= (overallFundsRequirement * 40)) {
        return 2;
    } else if (totalGoldComp >= (overallFundsRequirement * 20)) {
        return 1;
    } else {
        return 0;
    }
}
