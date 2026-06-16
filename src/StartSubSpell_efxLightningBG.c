#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_efxLightningBG[];
extern u16 * TsaArray_LightningBg[];
extern u16 * ImgArray_LightningBg[];
extern u16 * PalArray_LightningBg[];
extern const u16 Frames_efxLightningBG[];

void StartSubSpell_efxLightningBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLightningBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = Frames_efxLightningBG;
    proc->tsal = TsaArray_LightningBg;
    proc->tsar = TsaArray_LightningBg;
    proc->img = ImgArray_LightningBg;
    proc->pal = PalArray_LightningBg;

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 24, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 232, 0);
        }
    }

    return;
}
