#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxIvaldiBG4[];
extern u16 * TsaArray_IvaldiBg4[];

// clang-format on

//! FE8U = 0x08065C38
void StartSpellBG_IvaldiBG4(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 120,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxIvaldiBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->unk34 = 0;
    proc->unk3C = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_IvaldiBg4;
    proc->tsar = TsaArray_IvaldiBg4;

    SpellFx_RegisterBgGfx(Img_IvaldiBg4, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_IvaldiBg4, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}
