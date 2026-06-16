#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ctc.h"
#include "ekrclasschg.h"

extern struct ProcCmd ProcScr_efxLunaBG3[];
extern u16 * TsaArray_LunaBg3[];
extern u16 * ImgArray_LunaBg3[];

extern const u16 Frames_efxLunaBG3[];

void StartSubSpell_efxLunaBG3(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = Frames_efxLunaBG3;

    proc->tsal = TsaArray_LunaBg3;
    proc->tsar = TsaArray_LunaBg3;

    proc->img = ImgArray_LunaBg3;

    SpellFx_RegisterBgPal(Pal_LunaBg3, PLTT_SIZE_4BPP);

    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
        {
            BG_SetPosition(BG_1, 232, 0);
        }
        else
        {
            BG_SetPosition(BG_1, 24, 0);
        }
    }

    return;
}
