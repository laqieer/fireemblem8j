/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_MuHitFlash[];
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

void StartMuHitFlash(struct MuProc * mu, int flashType)
{
    struct MuFlashEffectProc * proc;

    ApplyPalette(gMuFlashPalLut[flashType], 0x10 + OBPAL_MU_FADE);

    mu->sprite_anim->tileBase =
        OAM2_PAL(OBPAL_MU_FADE) + mu->config->chr + mu->layer;

    StartPalFade(
        PAL_OBJ(mu->config->pal),
        0x15, 0x14, mu
    );

    proc = Proc_Start(ProcScr_MuHitFlash, mu);

    proc->mu = mu;
}
