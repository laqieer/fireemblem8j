#include "global.h"
#include "constants/items.h"
#include "constants/classes.h"
#include "constants/songs.h"
#include "ap.h"
#include "bm.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "bmbattle.h"
#include "bmarch.h"
#include "bmudisp.h"
#include "hardware.h"
#include "m4a.h"
#include "mapanim.h"
#include "mu.h"
#include "bmlib.h"
#include "proc.h"
#include "ctc.h"
#include "soundwrapper.h"
#include "spellassoc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_MuCritFlash[];

void StartMuActionAnim(struct MuProc * proc)
{
    AP_SwitchAnimation(proc->sprite_anim, MU_FACING_SELECTED);
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuActionAnimFinishFunc, (int) proc->sprite_anim, 30);
}

void MuActionAnimFinishFunc(int arg)
{
    FreezeSpriteAnim((struct APHandle *) arg);
}

void StartMuDelayedFaceDefender(struct MuProc * proc)
{
    ResetSpriteAnimClock(proc->sprite_anim);
    CallDelayedArg(MuDelayedFaceDefenderFunc, (int) proc->sprite_anim, 30);
}

void MuDelayedFaceDefenderFunc(int arg)
{
    SetBattleAnimFacing(
        gManimSt.subjectActorId,
        1 - gManimSt.subjectActorId,
        GetSpellAssocFacing(gManimSt.actor[0].bu->weaponBefore));

    FreezeSpriteAnim((struct APHandle *) arg);
}

void StartMuSpeedUpAnim(struct MuProc * proc)
{
    proc->sprite_anim->frameTimer    = 0;
    proc->sprite_anim->frameInterval = 0x40;

    CallDelayedArg(MuSlowDownAnimFreezeFunc, (int) proc->sprite_anim, 20);
}

void MuSlowDownAnimFreezeFunc(int arg)
{
    FreezeSpriteAnim((struct APHandle *) arg);
}

void StartMuCritFlash(struct MuProc * mu, int flashType)
{
    struct MuFlashEffectProc * proc;
    ApplyPalette(gMuFlashPalLut[flashType], 0x10 + OBPAL_MU_FADE);
    proc = Proc_Start(ProcScr_MuCritFlash, mu);
    proc->mu = mu;
}
