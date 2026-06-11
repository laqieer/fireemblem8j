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
extern struct ProcCmd ProcScr_MuPixelEffect[];
extern vu8 sMu_0[];

void MuBlink_OnLoop(struct MuEffectProc * proc)
{
    struct MuProc * mu = (struct MuProc *) proc->proc_parent;
    int boolHidden = false;

    if ((proc->timeLeft & 0x7) < 4)
        boolHidden = true;

    mu->hidden_b = boolHidden;

    if (--proc->timeLeft < 0)
    {
        Proc_Break(proc);
        mu->hidden_b = true;
    }
}

void StartBlinkMu(struct MuProc * mu)
{
    struct MuEffectProc * proc;

    mu->state = MU_STATE_DEATHFADE;

    proc = Proc_Start(ProcScr_MuBlink, mu);

    proc->mu = mu;
    proc->timeLeft = 0x40;

    mu->sprite_anim->frameTimer = 0;
    mu->sprite_anim->frameInterval = 0;

    PlaySoundEffect(SONG_D6);
}

void MU_SetupPixelEffect(u32* data, int frame)
{
    static u32 sKeptPixelsWordMask;
    static u32 sClearedPixelWordMask;

    int i, j;

    int pixel = sMu_0[frame] % 8;
    int wordId = sMu_0[frame] / 8;

    sKeptPixelsWordMask = ~(sClearedPixelWordMask = (0xF << (pixel * 4)));

    for (i = 0; i < 4; ++i)
    {
        for (j = 0; j < 4; ++j)
        {
            data[wordId] &= sKeptPixelsWordMask;

            data += 8;
        }

        data += 0xE0;
    }
}

void MuPixelEffect_OnLoop(struct MuEffectProc * proc)
{
    MU_SetupPixelEffect(
        GetMuImgBufById(((struct MuProc *)(proc->proc_parent))->slot),
        proc->frameIndex
    );

    proc->frameIndex++;

    // TODO: FIXME: This may be bugged?
    RegisterDataMove(
        gMUGfxBuffer,
        OBJ_VRAM0 + (OBCHR_MU_380 * CHR_SIZE),
        (0x80 * 0x20)
    );

    if (--proc->timeLeft == 0)
    {
        EndMu(proc->mu);
        Proc_Break(proc);
    }
}

void MU_StartPixelEffect(struct MuProc * mu)
{
    struct MuEffectProc * proc;

    mu->state = MU_STATE_DEATHFADE;

    proc = Proc_Start(ProcScr_MuPixelEffect, mu);

    proc->mu = mu;

    proc->timeLeft = 0x40;
    proc->frameIndex = 0;

    mu->sprite_anim->frameTimer = 0;
    mu->sprite_anim->frameInterval = 0;

    PlaySoundEffect(SONG_D6);
}
