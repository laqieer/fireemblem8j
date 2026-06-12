#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x0806A3F4
void StartSubSpell_efxGorgonBGFinish_(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGorgonBGFinish, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxGorgonBGFinish;

    proc->tsal = TsaArray_efxGorgonBGFinish;
    proc->img = ImgArray_efxGorgonBGFinish;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(anim) == 0)
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

    SpellFx_RegisterBgPal(Pal_efxGorgonBGFinish, PLTT_SIZE_4BPP);

    return;
}
