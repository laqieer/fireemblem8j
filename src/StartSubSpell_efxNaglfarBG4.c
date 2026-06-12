#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_NaglfarBg4[];
extern struct ProcCmd ProcScr_efxNaglfarBG4[];
extern u16 * TsaArray_NaglfarBg4[];

// clang-format on

//! FE8U = 0x08068028
void StartSubSpell_efxNaglfarBG4(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        3, 2,
        2, 2,
        1, 2,
        0, 2,
        1, 2,
        2, 2,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxNaglfarBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg4;
    proc->tsar = TsaArray_NaglfarBg4;
    proc->img = ImgArray_NaglfarBg4;

    SpellFx_RegisterBgPal(Pal_NaglfarBg4, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
