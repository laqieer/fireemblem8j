#include "global.h"
#include "cp_common.h"
#include "cp_data.h"
#include "bmunit.h"
#include "cp_utility.h"
#include "bmphase.h"
#include "rng.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "cp_script.h"



s8 AiIsUnitNonActive(struct Unit* unit);

void AiDoBerserkMove(void) {
    struct Vec2 pos;

    if (AiFindTargetInReachByFunc(AiIsUnitNonActive, &pos) == 1) {
        AiTryMoveTowards(pos.x, pos.y , 0, -1, 1);
    }

    return;
}
