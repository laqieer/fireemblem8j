#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_efxGorgonBGDirt[];
extern u16 * PalArray_efxGorgonBGDirt[];
extern struct ProcCmd ProcScr_efxGorgonBGDirt[];
extern u16 * TsaArray_efxGorgonBGDirt[];
extern const u16 gFrameConfig_efxGorgonBGDirt[];

// clang-format on

//! FE8U = 0x0806B7A8
void StartSubSpell_efxGorgonBGDirt(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxGorgonBGDirt, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxGorgonBGDirt;

    proc->tsal = TsaArray_efxGorgonBGDirt;
    proc->img = ImgArray_efxGorgonBGDirt;
    proc->pal = PalArray_efxGorgonBGDirt;

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

    SpellFx_SetSomeColorEffect();

    return;
}
