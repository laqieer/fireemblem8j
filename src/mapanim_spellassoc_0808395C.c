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
void RegisterMapHpChangeAnim(int mapst_id, int damage);

void MapAnim_BeginRoundSpecificAnims(ProcPtr proc)
{
    int map_actor = gManimSt.subjectActorId;
    bool vall_broken;
    int map_target;
    int sfx;

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_DEVIL)
        map_target = gManimSt.subjectActorId;
    else
        map_target = gManimSt.targetActorId;

    if (false == GetSpellAssocReturnBool(gManimSt.actor[map_actor].bu->weaponBefore))
    {
        if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_MISS)
            MapAnim_BeginMISSAnim(gManimSt.actor[map_target].unit);

        return;
    }

    gManimSt.hp_changing = 1;

    if (gManimSt.actor[0].unit->statusIndex == UNIT_STATUS_RECOVER)
        RegisterMapHpChangeAnim(map_actor, -gManimSt.hitDamage);
    else
        RegisterMapHpChangeAnim(map_target, gManimSt.hitDamage);

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_HPSTEAL)
        RegisterMapHpChangeAnim(map_actor, -gManimSt.hitDamage);

    if (gManimSt.hitDamage < 0)
        return;

    if (gManimSt.hitAttributes & BATTLE_HIT_ATTR_MISS)
    {
        PlaySeSpacial(SONG_C8,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x);

        MapAnim_BeginMISSAnim(gManimSt.actor[map_target].unit);
        return;
    }

    if (gManimSt.hitDamage == 0)
    {
        if (0 == (gManimSt.hitAttributes & BATTLE_HIT_ATTR_PETRIFY))
        {
            PlaySeSpacial(SONG_2CE,
                gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x);

            MapAnim_BeginNODAMAGEAnim(gManimSt.actor[map_target].unit);
        }
        return;
    }

    vall_broken = false;
    if (gManimSt.actor[map_target].bu->terrainId == TERRAIN_WALL_DAMAGED || gManimSt.actor[map_target].bu->terrainId == TERRAIN_SNAG)
        vall_broken = true;

    if (vall_broken)
    {
        if (gManimSt.hitInfo & 0x2)
        {
            sfx = 0xAF;
            MapAnim_BeginWallBreakAnim(gManimSt.actor[map_target].unit, 1);
        }
        else
        {
            sfx = 0xB0;
            MapAnim_BeginWallBreakAnim(gManimSt.actor[map_target].unit, 0);
        }
    }
    else
    {
        if (gManimSt.actor[0].unit->statusIndex == UNIT_STATUS_RECOVER)
            sfx = 0x3C9;
        else
        {
            int hitinfo = gManimSt.hitInfo & 0x2;
            sfx = 0xD2;
            if (hitinfo)
                sfx = 0xD5;
        }
    }

    if (gManimSt.hitAttributes & 0x1)
    {
        PlaySeSpacial(
            sfx,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x
        );

        StartMuCritFlash(
            gManimSt.actor[map_target].mu,
            GetSpellAssocFlashColor(gManimSt.actor[map_actor].bu->weaponBefore)
        );

        NewBG0Shaker();
        PlaySeSpacial(
            SONG_D8,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x
        );

        StartMuSpeedUpAnim(gManimSt.actor[map_actor].mu);
    }
    else
    {
        PlaySeSpacial(
            sfx,
            gManimSt.actor[map_target].unit->xPos * 0x10 - gBmSt.camera.x
        );

        StartMuHitFlash(
            gManimSt.actor[map_target].mu,
            GetSpellAssocFlashColor(gManimSt.actor[map_actor].bu->weaponBefore)
        );
    }
}
