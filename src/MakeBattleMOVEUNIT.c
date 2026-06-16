#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmbattle.h"
#include "mu.h"
#include "bmio.h"
#include "bm.h"
#include "mapanim.h"

void MakeBattleMOVEUNIT(int maActor, struct BattleUnit* bu, struct Unit* unit)
{
    if (!bu)
        return;

    gManimSt.actor[maActor].unit = unit;
    gManimSt.actor[maActor].bu   = bu;
    gManimSt.actor[maActor].mu   = StartMu(unit);

    gManimSt.actor[maActor].mu->sprite_anim->frameTimer    = 0;
    gManimSt.actor[maActor].mu->sprite_anim->frameInterval = 0;

    if (BUNIT_IS_OBSTACLE(bu))
        HideMu(gManimSt.actor[maActor].mu);
}
