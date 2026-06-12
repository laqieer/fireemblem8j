extern int MapanimEventcall_SummonLoadFrameAndPal();
#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u8 gMapanimEventcall_8[];

// clang-format on

//! FE8U = 0x08080730
void DemonKingSummonAnim_PhaseIntro(struct MAEffectProc * proc)
{
    if (proc->timer == 0)
    {
        MapanimEventcall_SummonLoadFrameAndPal(gMapanimEventcall_8[proc->frame], proc->unk44);

        if (proc->frame == 0)
        {
            PlaySeSpacial(SONG_141, proc->xDisplay);
        }

        proc->frame++;
        proc->timer = 5;

        if (proc->frame > 3)
        {
            proc->frame = 0;
            proc->unk46 = 0;

            proc->unk48 = 0;
            proc->frame_idx = 0;

            proc->xDisplay = gBmSt.camera.x;
            proc->yDisplay = gBmSt.camera.y;

            Proc_Break(proc);
        }

        proc->unk44 ^= 1;
    }

    proc->timer--;

    return;
}
