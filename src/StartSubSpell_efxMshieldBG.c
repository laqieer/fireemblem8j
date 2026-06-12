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
extern struct ProcCmd ProcScr_efxMshieldBG[];
extern u16 * TsaArray_BarrierBg[];

// clang-format on

//! FE8U = 0x0806331C
void StartSubSpell_efxMshieldBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 2,
         1, 2,
         2, 2,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         3, 3,
         4, 5,
         2, 3,
         1, 2,
         0, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMshieldBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_BarrierBg;
    proc->tsar = TsaArray_BarrierBg;

    SpellFx_RegisterBgPal(Pal_BarrierBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_BarrierBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}
