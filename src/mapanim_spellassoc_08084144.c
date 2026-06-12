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

void SpellWarpSetNewPosition(ProcPtr proc)
{
    struct Unit * unit = gManimSt.actor[gManimSt.targetActorId].unit;
    struct MuProc * mu = gManimSt.actor[gManimSt.targetActorId].mu;

    SetMuScreenPosition(
        mu,
        gManimSt.xtarget * 0x10,
        gManimSt.ytarget * 0x10);

    unit->xPos = gManimSt.xtarget;
    unit->yPos = gManimSt.ytarget;
}
