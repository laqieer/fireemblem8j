#include "global.h"
#include "agb_sram.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmitem.h"
#include "hardware.h"
#include "worldmap.h"
#include "bmsave.h"
#include "sram-layout.h"





int GetGlobalCompletionCntByInfo(struct GlobalSaveInfo *info)
{
    int i, ret = 0;

    for (i = 0; i < 0xC; i++)
        if (0 != info->cleared_playthroughs[i])
            ret++;

    return ret;
}

int GetGlobalCompletionCount(void)
{
    struct GlobalSaveInfo info;

    if (!ReadGlobalSaveInfo(&info))
        return 0;
    else
        return GetGlobalCompletionCntByInfo(&info);
}

bool RegisterCompletedPlaythrough(struct GlobalSaveInfo *info, int index)
{
    int i;
    for (i = 0; i < MAX_SAVED_GAME_CLEARS; i++)
        if (info->cleared_playthroughs[i] == index)
            return false;

    for(i = 0; i < MAX_SAVED_GAME_CLEARS; i++)
        if (0 == info->cleared_playthroughs[i]) {
            info->cleared_playthroughs[i] = index;
            return true;
        }

    return false;    
}
