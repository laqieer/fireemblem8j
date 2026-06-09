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

void MapAnimCallSpellAssocUnlock(ProcPtr proc)
{
    MapAnimUnlockEffect(gManimSt.xtarget, gManimSt.ytarget);
}

void MapAnimCallSpellAssocBerserk(ProcPtr proc)
{
    MapAnimBerserkEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocRestore(ProcPtr proc)
{
    MapAnimRestoreEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocSleep(ProcPtr proc)
{
    MapAnimSleepEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocMonsterStone(ProcPtr proc)
{
    MapAnimMonsterStoneEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}

void MapAnimCallSpellAssocRepair(ProcPtr proc)
{
    MapAnimRepairEffect(gManimSt.actor[gManimSt.targetActorId].unit);
}
