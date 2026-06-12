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
extern u16 * ImgArray_DemonLightBg3_Close[];
extern u16 * ImgArray_DemonLightBg3_Far[];
extern u16 * PalArray_DemonLightBg3_Close[];
extern u16 * PalArray_DemonLightBg3_Far[];
extern struct ProcCmd ProcScr_efxMaohFlashBG3[];
extern u16 * TsaArray_DemonLightBg3_Close[];
extern u16 * TsaArray_DemonLightBg3_Far[];

// clang-format on

//! FE8U = 0x08066914
void StartSubSpell_efxMaohFlashBG3(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 6,
        1, 6,
        2, 6,
        3, 6,
        4, 6,
        3, 6,
        2, 6,
        1, 6,
        0, 6,
        -1,
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG3, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_DemonLightBg3_Far;
        proc->tsar = TsaArray_DemonLightBg3_Far;
        proc->img = ImgArray_DemonLightBg3_Far;
        proc->pal = PalArray_DemonLightBg3_Far;
    }
    else
    {
        proc->tsal = TsaArray_DemonLightBg3_Close;
        proc->tsar = TsaArray_DemonLightBg3_Close;
        proc->img = ImgArray_DemonLightBg3_Close;
        proc->pal = PalArray_DemonLightBg3_Close;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}
