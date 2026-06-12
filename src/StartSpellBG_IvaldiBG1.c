#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxIvaldiBG1[];
extern u16 * TsaArray_IvaldiBg1[];

// clang-format on

//! FE8U = 0x080659AC
void StartSpellBG_IvaldiBG1(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        11, 2,
        10, 2,
         9, 2,
         8, 2,
         7, 2,
         6, 2,
         5, 2,
         4, 2,
         3, 2,
         2, 2,
         1, 2,
         0, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG1, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg1;
    proc->tsar = TsaArray_IvaldiBg1;

    SpellFx_RegisterBgGfx(Img_IvaldiBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_IvaldiBg1, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}
