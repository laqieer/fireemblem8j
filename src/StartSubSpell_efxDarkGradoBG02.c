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
extern u16 * ImgArray_GleipnirBg_Nebula[];
extern u16 * PalArray_GleipnirBg_Nebula[];
extern struct ProcCmd ProcScr_efxDarkGradoBG02[];
extern u16 * TsaArray_GleipnirBg_Nebula[];
extern const u16 gFrameConfig_GleipnirBg_Nebula[];

// clang-format on

//! FE8U = 0x08069488
void StartSubSpell_efxDarkGradoBG02(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkGradoBG02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gFrameConfig_GleipnirBg_Nebula;

    proc->tsal = TsaArray_GleipnirBg_Nebula;
    proc->img = ImgArray_GleipnirBg_Nebula;
    proc->pal = PalArray_GleipnirBg_Nebula;

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(BG_1, 40, 0);
        }
        else
        {
            BG_SetPosition(BG_1, -24, 0);
        }
    }
    else
    {
        if (GetAnimPosition(anim) == 0)
        {
            BG_SetPosition(BG_1, 16, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 0, 0);
        }
    }

    SpellFx_SetSomeColorEffect();
    SetBlendBackdropB(0);

    return;
}
