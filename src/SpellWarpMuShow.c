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

void SpellWarpMuShow(ProcPtr proc)
{
    ShowMu(gManimSt.actor[gManimSt.targetActorId].mu);
}
