#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

/* prototypes for same-file helpers called by this run */
u16 GetGameDeathCount(void);

//! FE8U = 0x080B5E6C
int GetGameSurvivalRank(void) {
    int deathCount;
    u8 i;

    u8 rankThresholds[4] = {
        6,
        4,
        2,
        1,
    };

    deathCount = GetGameDeathCount();

    for (i = 0; i < 4; i++) {
        if (deathCount >= rankThresholds[i]) {
            return i;
        }
    }

    return i;
}
