#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_FimbulvetrBg_Tornado[];
extern u16 * TsaArray_FimbulvetrBg_Tornado[];

// clang-format on

//! FE8U = 0x0805E230
void StartSubSpell_efxFimbulvetrBGTR(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    static const u16 frames[] =
    {
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         0, 3,
         1, 3,
         2, 3,
         3, 3,
         4, 3,
         5, 3,
        -1,
    };
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrBGTR, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_FimbulvetrBg_Tornado;
    proc->tsar = TsaArray_FimbulvetrBg_Tornado;
    proc->img = ImgArray_FimbulvetrBg_Tornado;

    SpellFx_RegisterBgPal(Pal_FimbulvetrBg_Tornado, PLTT_SIZE_4BPP);

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

    SpellFx_SetSomeColorEffect();

    return;
}
