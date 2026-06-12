#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxIvaldiBG2[];
extern u16 * TsaArray_IvaldiBg2[];

// clang-format on

//! FE8U = 0x08065A80
void StartSpellBG_IvaldiBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        1,  2,
        0, 20,
        2,  2,
        0, 10,
        3,  2,
        0,  5,
        4,  2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG2, PROC_TREE_3);

    proc->anim = GetAnimAnotherSide(anim);
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg2;
    proc->tsar = TsaArray_IvaldiBg2;

    SpellFx_RegisterBgGfx(Img_IvaldiBg2, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_IvaldiBg2, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}
