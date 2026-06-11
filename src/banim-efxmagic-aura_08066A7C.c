#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_AuraBg3[];
extern struct ProcCmd ProcScr_efxOuraBG3[];
extern u16 * TsaArray_AuraBg3[];

// clang-format on

//! FE8U = 0x080653CC
void StartSubSpell_efxOuraBG3(struct Anim * anim)
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
         9, 2,
        10, 2,
        11, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
         8, 2,
         9, 2,
        10, 2,
        11, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_AuraBg3;
    proc->tsar = TsaArray_AuraBg3;
    proc->img = ImgArray_AuraBg3;

    SpellFx_RegisterBgPal(Pal_AuraBg3, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}
