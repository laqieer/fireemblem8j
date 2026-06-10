#include "global.h"
#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

extern u8 gOverallRankWeightLookup[5][5];
extern u16 gOverallRankLookup[];

//! FE8U = 0x080B6070
int GetOverallRank(int tacticsRank, int survivalRank, int fundsRank, int combatRank, int expRank) {
    int i;

    u16 tmp = gOverallRankWeightLookup[0][tacticsRank];
    tmp += gOverallRankWeightLookup[1][survivalRank];
    tmp += gOverallRankWeightLookup[2][fundsRank];
    tmp += gOverallRankWeightLookup[3][combatRank];
    tmp += gOverallRankWeightLookup[4][expRank];

    for (i = 0; i < 5; i++) {
        if (tmp < gOverallRankLookup[i]) {
            return i;
        }
    }

    return i;
}
