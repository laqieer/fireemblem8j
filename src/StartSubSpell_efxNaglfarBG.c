#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_NaglfarBg1[];
extern struct ProcCmd ProcScr_efxNaglfarBG[];
extern u16 * TsaArray_NaglfarBg1[];

// clang-format on

//! FE8U = 0x08067DC4
void StartSubSpell_efxNaglfarBG(struct Anim * anim)
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

    proc = Proc_Start(ProcScr_efxNaglfarBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->unk32 = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_NaglfarBg1;
    proc->tsar = TsaArray_NaglfarBg1;
    proc->img = ImgArray_NaglfarBg1;

    SpellFx_RegisterBgPal(Pal_NaglfarBg1_A, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
