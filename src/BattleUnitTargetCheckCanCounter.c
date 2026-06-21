#include "global.h"
#include "rng.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmmind.h"
#include "bmreliance.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "proc.h"
#include "mu.h"
#include "bmarch.h"
#include "bmarena.h"
#include "bmsave.h"
#include "ekrbattle.h"
#include "bmbattle.h"
#include "mapanim.h"

//! FE8U = 0x0802C678
void BattleUnitTargetCheckCanCounter(struct BattleUnit* bu) {
    if (!bu->canCounter) {
        bu->battleAttack = 0xFF;
        bu->battleHitRate = 0xFF;
        bu->battleEffectiveHitRate = 0xFF;
        bu->battleCritRate = 0xFF;
        bu->battleEffectiveCritRate = 0xFF;
    }
}
