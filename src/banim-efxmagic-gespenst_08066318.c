#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxGespenstBGCOL2[];

// clang-format on

//! FE8U = 0x08064DE4
void StartSubSpell_efxGespenstBGCOL2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 1,
         1, 1,
         2, 1,
         3, 1,
         4, 1,
         5, 1,
         6, 1,
         7, 1,
         8, 1,
         9, 1,
         0, 2,
         1, 2,
         2, 2,
         3, 2,
         4, 2,
         5, 2,
         6, 2,
         7, 2,
         8, 2,
         9, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGespenstBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_GespenstBg4;
    SpellFx_RegisterBgPal(Pal_Banim_8, PLTT_SIZE_4BPP);

    return;
}
