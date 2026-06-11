#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxReserveBGCOL2[];

// clang-format on

//! FE8U = 0x08062058
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        10, 4,
        11, 4,
        12, 4,
        13, 4,
        14, 4,
         0, 4,
         1, 4,
         2, 4,
         3, 4,
         4, 4,
         5, 4,
         6, 4,
         7, 4,
         8, 4,
         9, 4,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBGCOL2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    if (kind == 0)
    {
        proc->pal = Pal_HealSpellBg;
    }
    else
    {
        proc->pal = Pal_efxReserveBGCOL_1;
    }

    return;
}
