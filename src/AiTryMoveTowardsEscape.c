#include "global.h"
#include "cp_common.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bmitem.h"
#include "bmarch.h"
#include "rng.h"
#include "cp_utility.h"
#include "cp_data.h"
#include "cp_script.h"
#include "constants/items.h"
#include "constants/terrains.h"



const struct AiEscapePt* GetEscapePointStructThingMaybe(void);

s8 AiTryMoveTowardsEscape(void) {
    const struct AiEscapePt* escapePoint;

    GenerateUnitMovementMapExt(gActiveUnit, MAP_MOVEMENT_EXTENDED);
    escapePoint = GetEscapePointStructThingMaybe();

    if (escapePoint != NULL) {

        if (gMapMovementSigned[escapePoint->y][escapePoint->x] <= UNIT_MOV(gActiveUnit)) {
            AiTryMoveTowards(escapePoint->x, escapePoint->y, 0, -1, 1);
            AiSetDecision(gAiDecision.xMove, gAiDecision.yMove, AI_ACTION_ESCAPE, escapePoint->x, escapePoint->y, escapePoint->facing, 0);

            return 1;
        } else {
            AiTryMoveTowards(escapePoint->x, escapePoint->y, 0, -1, 0);
            return gAiDecision.actionPerformed;
        }
    }

    return 0;
}
