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

extern struct AiScr * gpAiScriptCurrent;
s8 AiIsUnitEnemyAndNotInScrList(struct Unit* unit);

//! FE8U = 0x0803CE28
void AiScriptCmd_13(u8* pc) {
    struct Vec2 pos;

    if (gpAiScriptCurrent->unk_08 == 0) {
        if (AiFindTargetInReachNeglectWallByFunc(AiIsUnitEnemy, &pos) == 1) {
            AiTryMoveTowardsNeglectWall(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    } else {
        if (AiFindTargetInReachNeglectWallByFunc(AiIsUnitEnemyAndNotInScrList, &pos) == 1) {
            AiTryMoveTowardsNeglectWall(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    }

    (*pc)++;

    return;
}
