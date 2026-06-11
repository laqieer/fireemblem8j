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









































extern struct ProcCmd CONST_DATA ProcScr_Mu[];









extern struct ProcCmd CONST_DATA ProcScr_MuDeathFade[];







extern struct ProcCmd CONST_DATA ProcScr_MuRestorePalInfo[];





/* prototypes for same-file helpers called by this run */
void SetMuScreenOffset(struct MuProc * proc, int xOff, int yOff);

void MuCritFlash_StartFadeBack_maybe(struct MuFlashEffectProc * proc)
{
    StartPalFade(
        PAL_OBJ(proc->mu->config->pal),
        0x10 + OBPAL_MU_FADE, 20, proc
    );
}

void MuCritFlash_SpriteShakeLoop(struct MuFlashEffectProc * proc)
{
    proc->timer++;

    SetMuScreenOffset(proc->mu, ((proc->timer & 1) ? 2 : -2), 0);

    if (proc->timer >= 12)
    {
        SetMuScreenOffset(proc->mu, 0, 0);
        Proc_Break(proc);
    }
}
