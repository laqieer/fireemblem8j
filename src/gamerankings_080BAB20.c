#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

/* prototypes for same-file helpers called by this run */
u16 GetGameWinPerc(void);

//! FE8U = 0x080B5F9C
int GetGameCombatRank(void) {
    int winPercentage;
    int i;

    u8 rankThresholds[4] = {
        15,
        25,
        35,
        40,
    };

    winPercentage = GetGameWinPerc();

    for (i = 0; i < 4; i++) {
        if (winPercentage < rankThresholds[i]) {
            return i;
        }
    }

    return i;

}
