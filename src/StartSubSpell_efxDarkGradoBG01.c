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
extern u16 * ImgArray_GleipnirBg_Sigil[];
extern struct ProcCmd ProcScr_efxDarkGradoBG01[];
extern u16 * TsaArray_GleipnirBg_Sigil[];
extern const u16 gFrameConfig_GleipnirBg_Sigil[];

// clang-format on

//! FE8U = 0x080692B0
void StartSubSpell_efxDarkGradoBG01(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    gUnk_Banim_Ekrbattle_10 = 0x10;

    proc = Proc_Start(ProcScr_efxDarkGradoBG01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = gFrameConfig_GleipnirBg_Sigil;

    proc->tsal = TsaArray_GleipnirBg_Sigil;
    proc->tsar = TsaArray_GleipnirBg_Sigil;
    proc->img = ImgArray_GleipnirBg_Sigil;

    SpellFx_RegisterBgPal(Pal_GleipnirBg_Sigil, PLTT_SIZE_4BPP);

    if (gEkrDistanceType == 1)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 24, -16);
        }
        else
        {
            BG_SetPosition(BG_1, -24, -16);
        }
    }
    else
    {
        BG_SetPosition(BG_1, 0, -16);
    }

    SpellFx_SetSomeColorEffect();

    return;
}
