#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDarkbreathBG[];
extern u16 * TsaArray_DarkBreathBg[];

// clang-format on

//! FE8U = 0x0805D59C
void StartSubSpell_efxDarkbreathBG(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        11, 12,
         0,  2,
         1,  2,
         2,  2,
         1,  2,
         3,  2,
         4,  2,
         5,  2,
         6,  2,
        11,  2,
         7,  2,
         8,  2,
        11,  2,
         9,  2,
        10,  2,
         8,  2,
        11, 10,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkbreathBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_DarkBreathBg;
    proc->tsar = TsaArray_DarkBreathBg;

    SpellFx_RegisterBgGfx(Img_DarkBreathBg, 32 * 8 * CHR_SIZE);
    SpellFx_SetSomeColorEffect();

    return;
}
