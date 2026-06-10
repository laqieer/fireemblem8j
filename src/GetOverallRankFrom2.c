#include "global.h"
#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

extern u8 gGamerankings_2[2][5];
extern u16 gGamerankings_3[];

//! FE8U = 0x080B61FC
int GetOverallRankFrom2(int param_1, int param_2) {
    int i;

    u16 tmp = gGamerankings_2[0][param_1];
    tmp += gGamerankings_2[1][param_2];

    for (i = 0; i < 5; i++) {
        if (tmp < gGamerankings_3[i]) {
            return i;
        }
    }

    return i;
}
