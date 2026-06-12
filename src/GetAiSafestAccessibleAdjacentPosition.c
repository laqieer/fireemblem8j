#include "global.h"
#include "cp_common.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmphase.h"
#include "cp_utility.h"
#include "constants/items.h"
/* TU-private aggregate type defs (file-local) */
struct AdjPosLutEnt {
    int x;
    int y;
};
/* TU-private data externs bound at their JP addresses */
extern struct AdjPosLutEnt sAiAdjacentPositionLut[];

//! FE8U = 0x0803FAE8
s8 GetAiSafestAccessibleAdjacentPosition(int x, int y, struct Vec2* out) {
    int score;
    int ix;
    int iy;
    int i;

    u32 bestScore = 0;

    for (i = 0; i < 4; i++) {
        ix = x + sAiAdjacentPositionLut[i].x;
        iy = y + sAiAdjacentPositionLut[i].y;

        if (gBmMapMovement[iy][ix] >= MAP_MOVEMENT_MAX) {
            continue;
        }

        if (gBmMapUnit[iy][ix] != 0 && gBmMapUnit[iy][ix] != gActiveUnitId) {
            continue;
        }

        score = AiGetTerrainCombatPositionScoreComponent(ix, iy);
        score += AiGetFriendZoneCombatPositionScoreComponent(ix, iy);
        score -= gBmMapOther[iy][ix] / 8;
        score += 0x7FFFFFFF;

        if (bestScore < score) {
            out->x = ix;
            out->y = iy;
            bestScore = score;
        }
    }

    if (bestScore != 0) {
        return 1;
    }

    return 0;
}
