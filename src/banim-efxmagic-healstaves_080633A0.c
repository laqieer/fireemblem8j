#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_RestoreBg[];
extern struct ProcCmd ProcScr_efxRestBG[];
extern u16 * TsaArray_RestoreBg[];

// clang-format on

//! FE8U = 0x080622A0
void StartSubSpell_efxRestBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,   4,
         1,   4,
         2,   4,
         3,   4,
         4,   3,
         5,   3,
         6,   3,
         7,   3,
         8,   3,
         9,   2,
        10,   2,
        11,   2,
        12, 250,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxRestBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_RestoreBg;
    proc->tsar = TsaArray_RestoreBg;

    proc->img = ImgArray_RestoreBg;

    SpellFx_RegisterBgPal(Pal_MapAnimRestore, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
