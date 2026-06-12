#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_NaglfarBg2[];
extern u16 * PalArray_NaglfarBg2[];
extern struct ProcCmd ProcScr_efxNaglfarBG2[];
extern u16 * TsaArray_NaglfarBg2[];

// clang-format on

//! FE8U = 0x08067E98
void StartSubSpell_efxNaglfarBG2(struct Anim * anim)
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
        15, 26,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxNaglfarBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg2;
    proc->tsar = TsaArray_NaglfarBg2;
    proc->img = ImgArray_NaglfarBg2;
    proc->pal = PalArray_NaglfarBg2;

    SpellFx_SetSomeColorEffect();

    return;
}
