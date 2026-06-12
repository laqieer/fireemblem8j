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
extern u16 * ImgArray_GleipnirBg_Fog[];
extern u16 * TsaArray_GleipnirBg_Fog[];
extern const u16 gFrameConfig_GleipnirBg_Fog[];

// clang-format on

//! FE8U = 0x080693CC
void efxDarkGradoBG02_0(struct ProcEfxBG * proc)
{
    proc->timer = 0;
    proc->terminator = 0;
    proc->frame = 0;
    proc->frame_config = gFrameConfig_GleipnirBg_Fog;

    proc->tsal = TsaArray_GleipnirBg_Fog;
    proc->img = ImgArray_GleipnirBg_Fog;

    SpellFx_RegisterBgPal(Pal_GleipnirBg_Fog, PLTT_SIZE_4BPP);

    return;
}
