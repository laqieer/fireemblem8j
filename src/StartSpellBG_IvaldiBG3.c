#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_IvaldiBg3[];
extern u16 * PalArray_IvaldiBg3[];
extern struct ProcCmd ProcScr_efxIvaldiBG3[];
extern u16 * TsaArray_IvaldiBg3[];

// clang-format on

//! FE8U = 0x08065B54
void StartSpellBG_IvaldiBG3(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,  5,
         1,  5,
         2,  5,
         3,  5,
         4,  5,
         5,  5,
         6, 55,
         7,  4,
         8,  2,
         9,  2,
        10,  2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    SpellFx_ClearBG1();
    SetDefaultColorEffects_();

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG3, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg3;
    proc->tsar = TsaArray_IvaldiBg3;
    proc->img = ImgArray_IvaldiBg3;

    proc->pal = PalArray_IvaldiBg3;

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}
