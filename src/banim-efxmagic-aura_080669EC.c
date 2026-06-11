#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxOuraBGCOL[];

// clang-format on

//! FE8U = 0x0806533C
void StartSubSpell_efxOuraBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        3, 2,
        2, 1,
        1, 1,
        0, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_ShineBg_0;
    SpellFx_RegisterBgPal(Pal_ShineBg_0 + 0x30, PLTT_SIZE_4BPP);

    return;
}
