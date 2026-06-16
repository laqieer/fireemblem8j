#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_efxReserveBG[];
extern u16 * TsaArray_Fortify[];
extern const u16 Frames_efxReserveBG[];

void StartSubSpell_efxReserveBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxReserveBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = Frames_efxReserveBG;

    proc->tsal = TsaArray_Fortify;
    proc->tsar = TsaArray_Fortify;

    SpellFx_RegisterBgGfx(Img_HealSpellBg, 32 * 1 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();

    return;
}
