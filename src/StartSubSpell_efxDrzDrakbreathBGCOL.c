#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDrzDrakbreathBGCOL[];

//! FE8U = 0x08068A60
void StartSubSpell_efxDrzDrakbreathBGCOL(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        7, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        5, 2,
        6, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 2,
        7, 2,
        8, 2,
        7, 2,
        6, 2,
        5, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 6,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDrzDrakbreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_Banim_7;

    return;
}
