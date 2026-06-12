#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_DemonLightBg2[];
extern u16 * PalArray_DemonLightBg2[];
extern struct ProcCmd ProcScr_efxMaohFlashBG2[];
extern u16 * TsaArray_DemonLightBg2[];

// clang-format on

//! FE8U = 0x080667E0
void StartSubSpell_efxMaohFlashBG2(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 120,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    proc->tsal = TsaArray_DemonLightBg2;
    proc->tsar = TsaArray_DemonLightBg2;
    proc->img = ImgArray_DemonLightBg2;
    proc->pal = PalArray_DemonLightBg2;

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}
