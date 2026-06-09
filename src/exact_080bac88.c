#include "global.h"

#include "chapterdata.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmsave.h"

u16 GetGameDeathCount(void);
u16 GetGameWinPerc(void);
u16 GetChapterDeathCount(void);

/* prototypes for same-file helpers called by this run */
int GetGameTacticsRank(void);
int GetGameSurvivalRank(void);
int GetGameExpRank(void);
int GetGameCombatRank(void);
int GetGameFundsRank(void);
int GetOverallRank(int tacticsRank, int survivalRank, int fundsRank, int combatRank, int expRank);

//! FE8U = 0x080B6104
int GetGameOverallRank(void) {
    return GetOverallRank(
        GetGameTacticsRank(),
        GetGameSurvivalRank(),
        GetGameFundsRank(),
        GetGameExpRank(),
        GetGameCombatRank()
    );
}
