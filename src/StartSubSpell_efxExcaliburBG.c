#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxExcaliburBG[];

// clang-format on

//! FE8U = 0x080644E0
void StartSubSpell_efxExcaliburBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxExcaliburBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 40;

    SpellFx_RegisterBgGfx(Img_ExcaliburBg1, 32 * 8 * CHR_SIZE);
    SpellFx_ClearBG1();

    LZ77UnCompWram(Tsa_ExcaliburBg1, gEkrTsaBuffer);

    SpellFx_SetSomeColorEffect();

    SetWinEnable(0, 0, 0);

    return;
}
