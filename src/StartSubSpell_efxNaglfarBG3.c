#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_NaglfarBg3[];
extern struct ProcCmd ProcScr_efxNaglfarBG3[];
extern u16 * TsaArray_NaglfarBg3[];

// clang-format on

//! FE8U = 0x08067F64
void StartSubSpell_efxNaglfarBG3(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        0, 3,
        1, 3,
        2, 3,
        3, 3,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg3;
    proc->tsar = TsaArray_NaglfarBg3;
    proc->img = ImgArray_NaglfarBg3;

    SpellFx_RegisterBgPal(Pal_NaglfarBg3, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
