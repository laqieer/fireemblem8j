#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_NosferatuBg[];
extern u16 * TsaArray_NosferatuBg[];
extern const u16 gFrameConfig_EfxmagicNosferatu_0[];

//! FE8U = 0x0805F660
void efxResireBG_Loop_B(struct ProcEfxBG * proc)
{
    if (gEfxHpBarResireFlag == 2)
    {
        gEfxBgSemaphore--;

        SetDefaultColorEffects_();
        RegisterEfxSpellCastEnd();

        Proc_End(proc);
    }
    else
    {
        proc->timer++;

        if (proc->timer > proc->terminator)
        {
            proc->timer = proc->terminator;
        }

        if ((proc->timer == proc->terminator) && (gEfxHpBarResireFlag == 1))
        {
            proc->timer = 0;
            proc->terminator = 0;
            proc->frame = 0;
            proc->frame_config = gFrameConfig_EfxmagicNosferatu_0;
            proc->tsal = TsaArray_NosferatuBg;
            proc->tsar = TsaArray_NosferatuBg;
            proc->img = ImgArray_NosferatuBg;

            if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
            {
                proc->terminator = EfxGetCamMovDuration();
                NewEfxFarAttackWithDistance(proc->anim, -1);
            }

            Proc_Break(proc);
        }
    }

    return;
}
