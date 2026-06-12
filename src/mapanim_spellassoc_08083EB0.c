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

void SpellWarpStartFlashy(ProcPtr proc)
{
    struct Unit * unit;

    PlaySoundEffect(SONG_B4);
    gManimSt.xtarget = gBattleTarget.changeHP;
    gManimSt.ytarget = gBattleTarget.changePow;

    unit = gManimSt.actor[gManimSt.targetActorId].unit;
    StartWarpFlashy(unit, unit->xPos, unit->yPos);
}
