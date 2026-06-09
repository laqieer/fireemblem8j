#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"


EWRAM_DATA struct UnitUsageStats gPidStatsData[BWL_ARRAY_NUM] = {0};

int PidStatsGetTotalBattleAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].battleAmt;

    return ret;
}

int PidStatsGetTotalWinAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].winAmt;

    return ret;
}

int PidStatsGetTotalLossAmt(void)
{
    int i, ret = 0;

    for (i = 0; i < BWL_ARRAY_NUM; i++)
        ret += gPidStatsData[i].lossAmt;

    return ret;
}
