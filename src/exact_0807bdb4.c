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




































































void MuCritFlash_Init(struct MuFlashEffectProc * proc)
{
    proc->timer = 0;
}

void MuCritFlash_SetFadedPalette(struct MuFlashEffectProc * proc)
{
    struct MuProc * mu = proc->mu;

    mu->sprite_anim->tileBase =
        OAM2_PAL(OBPAL_MU_FADE) + mu->config->chr + mu->layer;
}
