#include "global.h"
#include "proc.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "cp_utility.h"
#include "cp_script.h"
#include "bmsave.h"
#include "bmmind.h"
#include "constants/classes.h"
#include "cp_common.h"




void DecideHealOrEscape(void)
{
    if (gAiState.flags & AI_FLAG_BERSERKED)
        return;

    if (AiUpdateGetUnitIsHealing(gActiveUnit) == TRUE)
    {
        struct Vec2 vec2;

        if (AiTryHealSelf() == TRUE)
            return;

        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (AiTryMoveTowardsEscape() == TRUE))
        {
            AiTryDanceOrStealAfterMove();
            return;
        }

        if (AiTryGetNearestHealPoint(&vec2) != TRUE)
            return;

        AiTryMoveTowards(vec2.x, vec2.y, 0, 0, 1);

        if (gAiDecision.actionPerformed == TRUE)
            AiTryActionAfterMove();
    }
    else
    {
        if ((gActiveUnit->aiFlags & AI_UNIT_FLAG_3) && (AiTryMoveTowardsEscape() == TRUE))
            AiTryDanceOrStealAfterMove();
    }
}
