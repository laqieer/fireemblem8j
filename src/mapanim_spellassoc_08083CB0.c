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

void MapAnim_StartGorgonHatchConditional(ProcPtr proc)
{
    if (gManimSt.actor[0].hp_cur >= gManimSt.actor[0].hp_max)
        MapAnim_StartGorgonHatchAnim(gManimSt.actor[gManimSt.targetActorId].unit);
    else
        Proc_EndEach(ProcScr_EggDmgMapEffect2);
}
