#include "global.h"
#include "sio.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "ap.h"
#include "soundwrapper.h"
#include "m4a.h"
#include "bmunit.h"
#include "ctc.h"
#include "constants/songs.h"

// clang-format off

u16 * CONST_DATA PalArray_SolidColors[] =
{
    Pal_AllWhite,
    Pal_AllBlack,
    Pal_AllRed,
    Pal_AllGreen,
    Pal_AllBlue,
    Pal_AllYellow,
};

// clang-format on

//! FE8U = 0x0804BED8
void StartSioMuFadeFromColor(struct MuProc * muProc, int kind)
{
    struct SioProc85AA83C * proc;

    ApplyPalette(PalArray_SolidColors[kind], 0x16);

    muProc->sprite_anim->tileBase = muProc->config->chr + 0x6800;
    StartPalFade(gPaletteBuffer + (muProc->config->pal + 0x10) * 0x10, 0x16, 0x14, muProc);

    proc = Proc_Start(ProcScr_SioMu_0, muProc);
    proc->muProc = muProc;

    return;
}

//! FE8U = 0x0804BF30
void SioMuFade_RestorePal(struct SioProc85AA83C * proc)
{
    proc->muProc->sprite_anim->tileBase =
        OAM2_PAL(proc->muProc->config->pal) + proc->muProc->config->chr + 0x800;
    return;
}

// clang-format on

//! FE8U = 0x0804BF4C
void StartLinkArenaMUDeathFade(struct MuProc * muProc)
{
    struct MuEffectProc * muEffectProc;

    muProc->state = MU_STATE_DEATHFADE;

    muEffectProc = Proc_Start(ProcScr_MuDeathFade, muProc);
    muEffectProc->mu = muProc;
    muEffectProc->timeLeft = 32;

    SetBlendConfig(0, 16, 16, 0);

    muProc->sprite_anim->frameTimer = 0;
    muProc->sprite_anim->frameInterval = 0;

    StartSioMuFadeFromColor(muProc, 0);

    muProc->sprite_anim->objLayer = 13;

    PlaySoundEffect(SONG_D6);

    return;
}

//! FE8U = 0x0804BFAC
void StartSioMuFadeToColor(struct MuProc * muProc, int palIdx)
{
    muProc->sprite_anim->tileBase = muProc->config->chr + 0x6800;

    ApplyPalette(gPaletteBuffer + (muProc->config->pal + 0x10) * 0x10, 0x16);
    StartPalFade(PalArray_SolidColors[palIdx], 0x16, 8, muProc);

    return;
}

//! FE8U = 0x0804BFF8
void StartSioMuFadeRestore(struct MuProc * muProc)
{
    struct MuEffectProc * muEffectProc;

    StartPalFade(gPaletteBuffer + (muProc->config->pal + 0x10) * 0x10, 0x16, 8, muProc);
    muEffectProc = Proc_Start(ProcScr_MuRestorePalInfo, PROC_TREE_3);
    muEffectProc->mu = muProc;

    return;
}
