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

extern struct ProcCmd ProcScr_efxLunaBG[];
extern u16 * TsaArray_LunaBg1[];

extern const u16 Frames_efxLunaBG[];

void StartSubSpell_efxLunaBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = Frames_efxLunaBG;

    proc->tsal = TsaArray_LunaBg1;
    proc->tsar = TsaArray_LunaBg1;

    SpellFx_RegisterBgPal(Pal_LunaBg1, PLTT_SIZE_4BPP);
    SpellFx_RegisterBgGfx(Img_LunaBg1, 32 * 8 * CHR_SIZE);

    SpellFx_SetSomeColorEffect();

    return;
}
