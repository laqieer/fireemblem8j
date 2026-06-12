#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_efxExcaliburBG0[];
extern struct ProcCmd ProcScr_efxExcaliburBG0[];
extern u16 * TsaArray_efxExcaliburBG0[];

// clang-format on

//! FE8U = 0x08064C28
void StartSubSpell_efxExcaliburBG0(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0, 60,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBG0, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->unk32 = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_efxExcaliburBG0;
    proc->tsar = TsaArray_efxExcaliburBG0;

    proc->img = ImgArray_efxExcaliburBG0;

    SpellFx_RegisterBgPal(Pal_efxExcaliburBG0, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
