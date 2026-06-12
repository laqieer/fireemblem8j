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
extern u16 * ImgArray_DemonLightBg4_Close[];
extern u16 * ImgArray_DemonLightBg4_Far[];
extern u16 * PalArray_DemonLightBg4_Close[];
extern u16 * PalArray_DemonLightBg4_Far[];
extern struct ProcCmd ProcScr_efxMaohFlashBG4[];
extern u16 * TsaArray_DemonLightBg4_Close[];
extern u16 * TsaArray_DemonLightBg4_Far[];

// clang-format on

//! FE8U = 0x08066A0C
void StartSubSpell_efxMaohFlashBG4(struct Anim * anim)
{
    // clang-format off
    static const u16 frames[] =
    {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 3,
        7, 4,
        -1
    };
    // clang-format on

    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxMaohFlashBG4, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = frames;

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE)
    {
        proc->tsal = TsaArray_DemonLightBg4_Far;
        proc->tsar = TsaArray_DemonLightBg4_Far;
        proc->img = ImgArray_DemonLightBg4_Far;
        proc->pal = PalArray_DemonLightBg4_Far;
    }
    else
    {
        proc->tsal = TsaArray_DemonLightBg4_Close;
        proc->tsar = TsaArray_DemonLightBg4_Close;
        proc->img = ImgArray_DemonLightBg4_Close;
        proc->pal = PalArray_DemonLightBg4_Close;
    }

    BG_SetPosition(BG_1, 0, 0);
    SpellFx_SetSomeColorEffect();

    return;
}
