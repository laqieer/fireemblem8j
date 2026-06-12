#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_efxGorgonBGTwister[];
extern u16 * PalArray_efxGorgonBGTwister[];
extern struct ProcCmd ProcScr_efxGorgonBGTwister[];
extern u16 * TsaArray_efxGorgonBGTwister[];
extern const u16 gFrameConfig_efxGorgonBGTwister[];

// clang-format on

//! FE8U = 0x0806B89C
void StartSubSpell_efxGorgonBGTwister(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGorgonBGTwister, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxGorgonBGTwister;

    proc->tsal = TsaArray_efxGorgonBGTwister;
    proc->img = ImgArray_efxGorgonBGTwister;
    proc->pal = PalArray_efxGorgonBGTwister;

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

    return;
}
