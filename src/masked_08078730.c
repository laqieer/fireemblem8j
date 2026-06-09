#include "global.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"
#include "uiutils.h"
#include "bmlib.h"
#include "bm.h"

int CheckBanimHensei(void)
{
    if (gBattleStats.config & BATTLE_CONFIG_PROMOTION_PREP)
        return true;

    return false;
}
