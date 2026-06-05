

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

const struct ProcCmd * MapAnim_GetRoundProcScript(void)
{
    if (gManimSt.specialProcScr)
        return gManimSt.specialProcScr;

    return ProcScr_MapAnimDefaultItemEffect;
}

void MapAnim_AnimateSubjectIdle(ProcPtr proc)
{
    StartMuActionAnim(gManimSt.actor[gManimSt.subjectActorId].mu);
}

void MapAnim_SubjectResetAnim(ProcPtr proc)
{
    StartMuDelayedFaceDefender(gManimSt.actor[gManimSt.subjectActorId].mu);
}

void MapAnim_StartSubjectDanceAnim(void)
{
    if (gManimSt.actor[gManimSt.subjectActorId].unit->pClassData->number == CLASS_DANCER)
        CallDelayed(MapAnim_PlayDancerSe, 0x9);
    else
        CallDelayed(MapAnim_PlayNonDancerSe, 0xC);

    gManimSt.actor[gManimSt.subjectActorId].mu->sprite_anim->frameTimer = 0;
    gManimSt.actor[gManimSt.subjectActorId].mu->sprite_anim->frameInterval = 0x100;
    AP_SwitchAnimation(gManimSt.actor[gManimSt.subjectActorId].mu->sprite_anim, 0x5);
}

void MapAnim_PlayDancerSe(void)
{
    PlaySeSpacial(SONG_2D5,
        gManimSt.actor[gManimSt.subjectActorId].unit->xPos * 0x10 - gBmSt.camera.x);
}

void MapAnim_PlayNonDancerSe(void)
{
    PlaySeSpacial(SONG_SE_SHATTER_STONE,
        gManimSt.actor[gManimSt.subjectActorId].unit->xPos * 0x10 - gBmSt.camera.x);
}

void MapAnim_FreezeSubjectAnim(void)
{
    gManimSt.actor[gManimSt.subjectActorId].mu->sprite_anim->frameTimer = 0;
    gManimSt.actor[gManimSt.subjectActorId].mu->sprite_anim->frameInterval = 0;
}

void MapAnim_BeginSubjectFastAnim(void)
{
    StartMuSpeedUpAnim(gManimSt.actor[gManimSt.subjectActorId].mu);
}
