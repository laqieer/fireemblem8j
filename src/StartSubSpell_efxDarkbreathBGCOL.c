#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDarkbreathBGCOL[];

// clang-format on

//! FE8U = 0x0805D644
void StartSubSpell_efxDarkbreathBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_BoltingBg;

    return;
}
