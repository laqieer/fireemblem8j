#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxDarkLongMonsBG02[];
extern u16 * TsaArray_efxDarkLongMonsBG02[];
extern const u16 gFrameConfig_efxDarkLongMonsBG02[];

// clang-format on

//! FE8U = 0x0806B1E8
void StartSubSpell_efxDarkLongMonsBG02(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsBG02, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxDarkLongMonsBG02;

    proc->tsal = TsaArray_efxDarkLongMonsBG02;

    SpellFx_RegisterBgGfx(Img_efxDarkLongMonsBG, 32 * 8 * CHR_SIZE);
    SpellFx_RegisterBgPal(Pal_efxDarkLongMonsBG, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SpellFx_SetSomeColorEffect();

    return;
}
