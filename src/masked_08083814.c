#include "global.h"
#include "bmunit.h"
#include "ap.h"
#include "mu.h"
#include "bm.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "bmmap.h"
#include "bmio.h"
#include "bmudisp.h"
#include "spellassoc.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/classes.h"
#include "constants/terrains.h"
#include "constants/songs.h"

/* prototypes for same-file helpers called by this run */
void MapAnimMoveUnitTowardsTargetExt(struct MuProc * mu1, struct MuProc * mu2);
void MapAnimMoveUnitAwayFromTargetExt(struct MuProc * mu1, struct MuProc * mu2);

void MapAnim_MoveSubjectsTowardsTarget(void)
{
    struct MuProc * mu, * mu2;

    mu  = gManimSt.actor[gManimSt.subjectActorId].mu;
    mu2 = gManimSt.actor[gManimSt.targetActorId].mu;
    MapAnimMoveUnitTowardsTargetExt(mu, mu2);

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_TATTACK)
    {
        mu  = gManimSt.actor[2].mu;
        MapAnimMoveUnitTowardsTargetExt(mu, mu2);

        mu  = gManimSt.actor[3].mu;
        MapAnimMoveUnitTowardsTargetExt(mu, mu2);
    }
}

void MapAnim_MoveSubjectsAwayFromTarget(void)
{
    struct MuProc * mu, * mu2;

    mu  = gManimSt.actor[gManimSt.subjectActorId].mu;
    mu2 = gManimSt.actor[gManimSt.targetActorId].mu;
    MapAnimMoveUnitAwayFromTargetExt(mu, mu2);

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_TATTACK)
    {
        mu  = gManimSt.actor[2].mu;
        MapAnimMoveUnitAwayFromTargetExt(mu, mu2);

        mu  = gManimSt.actor[3].mu;
        MapAnimMoveUnitAwayFromTargetExt(mu, mu2);
    }
}
