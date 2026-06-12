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

void SpellWarpStartImplosion(ProcPtr proc)
{
    struct Unit * unit;

    PlaySoundEffect(SONG_B5);
    
    unit = gManimSt.actor[gManimSt.targetActorId].unit;
    StartStarImplosionEffect(
        unit->xPos * 0x10 - gBmSt.camera.x + 0x8,
        unit->yPos * 0x10 - gBmSt.camera.y + 0x8
    );
}
