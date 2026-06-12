#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_FimbulvetrBg[];
extern struct ProcCmd ProcScr_efxFimbulvetrBG[];
extern u16 * TsaArray_FimbulvetrBg[];

// clang-format on

//! FE8U = 0x0805E318
void StartSubSpell_efxFimbulvetrBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    // clang-format off
    static const u16 frames[] =
    {
         0,  1,
         1,  1,
         2,  1,
         3,  1,
         4,  1,
         5,  1,
         6,  1,
         7,  1,
         8,  1,
         9,  1,
        10, 30,
        -1,
    };
    // clang-format on

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFimbulvetrBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TsaArray_FimbulvetrBg;
    proc->tsar = TsaArray_FimbulvetrBg;
    proc->img = ImgArray_FimbulvetrBg;

    SpellFx_RegisterBgPal(Pal_FimbulvetrBg, PLTT_SIZE_4BPP);

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    SpellFx_SetSomeColorEffect();

    return;
}
