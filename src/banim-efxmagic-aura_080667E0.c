#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxOuraBG[];
extern u16 * TsaArray_AuraBg1[];

//! FE8U = 0x08065130
void StartSubSpell_efxOuraBG_C(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        11, 10,
        23,  3,
        24,  3,
        25,  3,
        26,  3,
        27, 20,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxOuraBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_AuraBg1;
    proc->tsar = TsaArray_AuraBg1;

    SpellFx_RegisterBgGfx(Img_AuraBg1, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_AuraBg1, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}
