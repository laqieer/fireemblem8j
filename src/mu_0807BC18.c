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





void StartMuFadeIntoFlash(struct MuProc * proc, int flashType)
{
    proc->sprite_anim->tileBase =
        proc->config->chr + OAM2_PAL(OBPAL_MU_FADE) + proc->layer;

    ApplyPalette(PAL_OBJ(proc->config->pal), 0x10 + OBPAL_MU_FADE);

    StartPalFade(
        gMuFlashPalLut[flashType],
        0x15, 8, proc);
}

void StartMuFadeFromFlash(struct MuProc * mu)
{
    struct MuEffectProc * proc;
    StartPalFade(
        PAL_OBJ(mu->config->pal),
        0x15, 8, mu
    );

    proc = Proc_Start(ProcScr_MuRestorePalInfo, PROC_TREE_3);
    proc->mu = mu;
}
