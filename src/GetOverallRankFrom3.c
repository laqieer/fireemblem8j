#include "global.h"
#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

extern u8 gGamerankings_0[3][5];
extern u16 gGamerankings_1[];

//! FE8U = 0x080B60C8
int GetOverallRankFrom3(int param_1, int param_2, int param_3) {
    int i;

    u16 tmp = gGamerankings_0[0][param_1];
    tmp += gGamerankings_0[1][param_2];
    tmp += gGamerankings_0[2][param_3];

    for (i = 0; i < 5; i++) {
        if (tmp < gGamerankings_1[i]) {
            return i;
        }
    }

    return i;
}
