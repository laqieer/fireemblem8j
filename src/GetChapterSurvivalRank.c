#include "global.h"
u16 GetChapterDeathCount(void);
#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

//! FE8U = 0x080B61C4
int GetChapterSurvivalRank(void) {
    int deathCount;
    u8 i;

    u8 gUnknown_08205F24[4] = {
        4,
        3,
        2,
        1,
    };

    deathCount = GetChapterDeathCount();

    for (i = 0; i < 4; i++) {
        if (deathCount >= gUnknown_08205F24[i]) {
            return i;
        }
    }

    return i;
}
