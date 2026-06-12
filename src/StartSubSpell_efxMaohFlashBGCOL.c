#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxMaohFlashBGCOL[];

// clang-format on

//! FE8U = 0x08066BD4
void StartSubSpell_efxMaohFlashBGCOL(struct Anim * anim)
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
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        14, 1,
        13, 1,
        12, 1,
        11, 1,
        10, 1,
        9, 1,
        8, 1,
        7, 1,
        6, 1,
        5, 1,
        4, 1,
        3, 1,
        2, 1,
        1, 1,
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
        10, 1,
        11, 1,
        12, 1,
        13, 1,
        14, 1,
        15, 1,
        14, 1,
        13, 1,
        12, 1,
        11, 1,
        10, 1,
        9, 1,
        8, 1,
        7, 1,
        6, 1,
        5, 1,
        4, 1,
        3, 1,
        2, 1,
        1, 1,
        0, 1,
        -1,
    };
    // clang-format on

    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk32 = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->pal = Pal_Ekrdragonfx_2;
    SpellFx_RegisterBgPal(Pal_EkrElfireBG, PLTT_SIZE_4BPP);

    return;
}
