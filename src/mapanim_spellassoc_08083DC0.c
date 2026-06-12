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

void MapAnimCallSpellAssocElixir(ProcPtr proc)
{
    NewMapAnimEffectAnimator(gManimSt.actor[gManimSt.targetActorId].unit,
        gMapanimBattleinfo_4, Pal_MapAnimBerserkfx_1, 0x8B);
}
