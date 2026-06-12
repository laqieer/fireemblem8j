#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxCrimsonEyeBG[];
extern u16 * TsaArray_efxCrimsonEyeBG[];
extern const u16 gFrameConfig_efxCrimsonEyeBG[];

// clang-format on

//! FE8U = 0x0806A4CC
void StartSubSpell_efxCrimsonEyeBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxCrimsonEyeBG;

    proc->tsal = TsaArray_efxCrimsonEyeBG;

    SpellFx_RegisterBgGfx(Img_efxCrimsonEyeBG, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_efxCrimsonEyeBG, PLTT_SIZE_4BPP);

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, -24, 0);
        }
    }
    else
    {
        BG_SetPosition(BG_1, 0, 0);
    }

    SpellFx_SetSomeColorEffect();

    return;
}
