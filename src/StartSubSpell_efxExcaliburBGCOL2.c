#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxExcaliburBGCOL2[];

// clang-format on

//! FE8U = 0x08064958
void StartSubSpell_efxExcaliburBGCOL2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 6,
         1, 2,
         2, 2,
         3, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_ExcaliburBg2;
    SpellFx_RegisterBgPal(Pal_ExcaliburBg2, PLTT_SIZE_4BPP);

    return;
}
