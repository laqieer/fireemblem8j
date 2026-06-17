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



extern struct AiScr* gpAiScriptCurrent;
s8 AiIsUnitEnemyAndNotInScrList(struct Unit* unit);

void AiScriptCmd_12_MoveTowardsEnemy(u8* pc) {
    struct Vec2 pos;

    if (gpAiScriptCurrent->unk_08 == 0) {
        if (AiFindTargetInReachByFunc(AiIsUnitEnemy, &pos) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    } else {
        if (AiFindTargetInReachByFunc(AiIsUnitEnemyAndNotInScrList, &pos) == 1) {
            AiTryMoveTowards(pos.x, pos.y, 0, gpAiScriptCurrent->unk_02, 1);
        }
    }

    (*pc)++;

    return;
}
