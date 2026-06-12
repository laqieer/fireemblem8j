#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxExcaliburBGCOL[];

// clang-format on

//! FE8U = 0x0806466C
void StartSubSpell_efxExcaliburBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,  2,
         1,  2,
         2,  2,
         3,  2,
         4,  2,
         5, 20,
         6,  2,
         7,  2,
         8,  2,
         9,  6,
        10,  2,
        11,  2,
        12,  2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBGCOL, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_ExcaliburBg1;
    SpellFx_RegisterBgPal(Pal_ExcaliburBg1, PLTT_SIZE_4BPP);

    return;
}
