#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

/* prototypes for same-file helpers called by this run */
int GetOverallRank(int tacticsRank, int survivalRank, int fundsRank, int combatRank, int expRank);
int GetChapterTacticsRank(void);
int GetChapterSurvivalRank(void);
int GetChapterFundsRank(void);

//! FE8U = 0x080B6358
int GetChapterWinPerc(void) {
    int chapterTotalBattles;
    int percentage;
    int num;
    int a;
    int b;

    int totalBattles = PidStatsGetTotalBattleAmt();
    int totalWins = PidStatsGetTotalWinAmt();

    if (totalBattles > 0xFFFFF) {
        totalBattles = 0xFFFFF;
    }

    if (totalWins > 0xFFFFF) {
        totalWins = 0xFFFFF;
    }

    chapterTotalBattles = gPlaySt.unk_30.unk_4_00;

    if (totalBattles == chapterTotalBattles) {
        return 40;
    }

    a = gPlaySt.unk_30.unk_4_14;
    b = gPlaySt.unk_30.unk_8_1 << 12;
    num = (totalWins - (b | a)) * 100;

    percentage = num / (totalBattles - chapterTotalBattles);

    if (percentage > 100) {
        percentage = 100;
    }

    gPlaySt.unk_30.unk_4_00 = totalBattles;
    gPlaySt.unk_30.unk_4_14 = (totalWins & 0x00000FFF);
    gPlaySt.unk_30.unk_8_1 = ((u32)totalWins >> 12);

    return percentage;
}

//! FE8U = 0x080B63F0
int GetChapterCombatRank(void) {
    int winPercentage;
    int i;

    u8 rankThresholds[4] = {
        15,
        25,
        35,
        40,
    };

    winPercentage = GetChapterWinPerc();

    for (i = 0; i < 4; i++) {
        if (winPercentage < rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B6424
int GetChapterExpRank(void) {
    int totalExp;
    int i;
    struct ChapterStats* ent;
    int expInChapter;
    int rankThresholds[4];

    for (i = 0; i < 4; i++) {
        rankThresholds[i] = 0;
    }

    totalExp = PidStatsGetTotalExpGain();

    if (totalExp > 0xFFFFF) {
        totalExp = 0xFFFFF;
    }

    expInChapter = totalExp - gPlaySt.unk_30.unk_8_2;
    gPlaySt.unk_30.unk_8_2 = totalExp;

    ent = GetChapterStats(GetNextChapterStatsSlot() - 1);

    rankThresholds[0] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankDInEliwoodStory[IsDifficultMode()];

    rankThresholds[1] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankCInEliwoodStory[IsDifficultMode()];

    rankThresholds[2] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankBInEliwoodStory[IsDifficultMode()];

    rankThresholds[3] = gChapterDataTable[ent->chapter_index].gainedExpForExpRankAInEliwoodStory[IsDifficultMode()];

    for (i = 0; i < 4; i++) {
        if (expInChapter < rankThresholds[i]) {
            return i;
        }
    }

    return i;
}

//! FE8U = 0x080B6504
void ComputeChapterRankings(void) {
    int overallRank;
    int newRank;

    if (GetNextChapterStatsSlot() > 0) {

        switch (gPlaySt.chapterModeIndex) {
            case CHAPTER_MODE_COMMON:
            case CHAPTER_MODE_EIRIKA:
            case CHAPTER_MODE_EPHRAIM:
                gPlaySt.unk_30.tacticsRank = GetChapterTacticsRank();
                gPlaySt.unk_30.survivalRank = GetChapterSurvivalRank();
                gPlaySt.unk_30.fundsRank = GetChapterFundsRank();
                gPlaySt.unk_30.combatRank = GetChapterCombatRank();
                gPlaySt.unk_30.expRank = GetChapterExpRank();
        }

        overallRank = GetOverallRank(
            gPlaySt.unk_30.tacticsRank,
            gPlaySt.unk_30.survivalRank,
            gPlaySt.unk_30.fundsRank,
            gPlaySt.unk_30.expRank,
            gPlaySt.unk_30.combatRank
        );

        newRank = gPlaySt.unk_2C_04 + overallRank;

        if (newRank > 0xff) {
            newRank = 0xff;
        }

        gPlaySt.unk_2C_04 = newRank;
    }

    return;
}
