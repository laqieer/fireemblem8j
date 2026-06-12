#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

//! FE8U = 0x080B6264
u16 GetGameWinPerc(void) {
    int battles = PidStatsGetTotalBattleAmt();
    int wins = PidStatsGetTotalWinAmt() * 100;

    return wins / battles;
}
