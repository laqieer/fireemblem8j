#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxSilenceBG[];
extern u16 * TsaArray_SilenceBg[];

// clang-format on

//! FE8U = 0x08062524
void StartSubSpell_efxSilenceBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
         0,  2,
         1,  1,
         2,  1,
         3,  1,
         4,  1,
         5,  1,
         6,  4,
         7,  1,
         8,  5,
         9,  2,
        10,  2,
        11,  2,
        12,  2,
        13,  2,
        14,  2,
        15,  1,
        16,  5,
        17, 50,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSilenceBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_SilenceBg;
    proc->tsar = TsaArray_SilenceBg;

    SpellFx_RegisterBgPal(Pal_Silence, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SilenceBg, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    return;
}
