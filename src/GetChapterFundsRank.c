#include "global.h"
#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

//! FE8U = 0x080B62DC
int GetChapterFundsRank(void) {
    int goldInChapter;
    const struct ChapterStats* ent;
    int goldForFundsRank;

    int totalGold = GetPartyTotalGoldValue();

    goldInChapter = gPlaySt.unk_30.total_gold;
    goldInChapter = totalGold - goldInChapter;

    gPlaySt.unk_30.total_gold = totalGold;

    ent = GetChapterStats(GetNextChapterStatsSlot() - 1);

    goldForFundsRank = gChapterDataTable[ent->chapter_index].goldForFundsRankInEliwoodStory[IsDifficultMode()];

    if (goldInChapter * 100 >= goldForFundsRank * 80) {
        return 4;
    } else if (goldInChapter * 100 >= goldForFundsRank * 60) {
        return 3;
    } else if (goldInChapter * 100 >= goldForFundsRank * 40) {
        return 2;
    } else if (goldInChapter * 100 >= goldForFundsRank * 20) {
        return 1;
    } else {
        return 0;
    }
}
