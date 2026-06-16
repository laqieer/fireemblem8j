#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_efxFirebreathBG[];

void StartSubSpell_efxFirebreathBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    u16 * tsa;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBG, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 112;

    SpellFx_RegisterBgGfx(Img_FireBreathBg, 32 * 8 * CHR_SIZE);

    tsa = Tsa_FireBreathBg;
    SpellFx_WriteBgMap(proc->anim, tsa, tsa);

    SpellFx_ClearBG1Position();
    SpellFx_SetSomeColorEffect();

    return;
}
