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

void SpellWarpStartFlashyAtNewPos(ProcPtr proc)
{
    struct Unit * unit;
    unit = gManimSt.actor[gManimSt.targetActorId].unit;
    StartWarpFlashy(
        gManimSt.actor[gManimSt.targetActorId].unit,
        gManimSt.xtarget,
        gManimSt.ytarget
    );
}
