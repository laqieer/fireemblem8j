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


extern EWRAM_OVERLAY(0) u8 gMUGfxBuffer[MU_GFX_MAX_SIZE * MU_MAX_COUNT];

extern const u16 * CONST_DATA gMuFlashPalLut[];







extern u16 CONST_DATA MuSoundScr_Foot[];

extern u16 CONST_DATA MuSoundScr_FootHeavy[];

extern u16 CONST_DATA MuSoundScr_Mounted[];

extern u16 CONST_DATA MuSoundScr_Wyvern[];

extern u16 CONST_DATA MuSoundScr_Pegasus[];



extern u16 CONST_DATA MuSoundScr_Zombie[];

extern u16 CONST_DATA MuSoundScr_Skeleton[];

extern u16 CONST_DATA MuSoundScr_Mogall[];

extern u16 CONST_DATA MuSoundScr_Spider[];

extern u16 CONST_DATA MuSoundScr_Dog[];

extern u16 CONST_DATA MuSoundScr_Gorgon[];



extern u16 CONST_DATA MuSoundScr_Boat[];

extern u16 CONST_DATA MuSoundScr_Myrrh[];



extern struct ProcCmd CONST_DATA ProcScr_Mu[];









extern struct ProcCmd CONST_DATA ProcScr_MuDeathFade[];







extern struct ProcCmd CONST_DATA ProcScr_MuRestorePalInfo[];





/* prototypes for same-file helpers called by this run */
void StartMuHitFlash(struct MuProc * mu, int flashType);

const void * GetMuAnimForJid(u16 jid)
{
    return gMuInfoTable[jid - 1].anim;
}

void MU_StartDeathFade(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    mu->state = MU_STATE_DEATHFADE;
    proc = Proc_Start(ProcScr_MuDeathFade, mu);
    proc->mu = mu;
    proc->timeLeft = 0x20;
    SetBlendConfig(0, 0x10, 0x10, 0);
    FreezeSpriteAnim(mu->sprite_anim);
    StartMuHitFlash(mu, MU_FLASH_WHITE);
    mu->sprite_anim->objLayer = 13;
    PlaySoundEffect(SONG_D6);

    if (mu->unit->state & US_IN_BALLISTA)
    {
        TryRemoveUnitFromBallista(mu->unit);
        HideUnitSprite(mu->unit);
    }
}
