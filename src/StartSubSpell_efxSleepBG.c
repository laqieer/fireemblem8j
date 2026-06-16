#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_efxSleepBG[];
extern u16 * TsaArray_SleepBg[];
extern const u16 Frames_efxSleepBG[];

void StartSubSpell_efxSleepBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSleepBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = Frames_efxSleepBG;

    proc->tsal = TsaArray_SleepBg;
    proc->tsar = TsaArray_SleepBg;

    SpellFx_RegisterBgPal(Pal_SleepBg, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_SleepBg, 32 * 8 * CHR_SIZE);

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
