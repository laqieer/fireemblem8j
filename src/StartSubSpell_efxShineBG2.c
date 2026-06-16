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

extern struct ProcCmd ProcScr_efxShineBG2[];
extern u16 * TsaArray_ShineBg2[];

extern const u16 Frames_efxShineBG2[];

void StartSubSpell_efxShineBG2(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = Frames_efxShineBG2;

    proc->tsal = TsaArray_ShineBg2;
    proc->tsar = TsaArray_ShineBg2;

    SpellFx_RegisterBgPal(Pal_ShineBg2, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_ShineBg2, 32 * 8 * CHR_SIZE);

    if (gEkrDistanceType != 0)
    {
        if (GetAnimPosition(proc->anim) == 0)
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
