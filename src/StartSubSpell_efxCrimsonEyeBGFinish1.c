#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_efxCrimsonEyeBGFinish1[];
extern struct ProcCmd ProcScr_efxCrimsonEyeBGFinish1[];
extern u16 * TsaArray_efxCrimsonEyeBGFinish1[];
extern const u16 gFrameConfig_efxCrimsonEyeBGFinish1[];

// clang-format on

//! FE8U = 0x0806A068
void StartSubSpell_efxCrimsonEyeBGFinish1(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxCrimsonEyeBGFinish1, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxCrimsonEyeBGFinish1;

    proc->tsal = TsaArray_efxCrimsonEyeBGFinish1;
    proc->img = ImgArray_efxCrimsonEyeBGFinish1;

    SpellFx_RegisterBgPal(Pal_efxCrimsonEyeBGFinish1, PLTT_SIZE_4BPP);

    BG_SetPosition(BG_1, 0, 0);

    SetPrimaryHBlankHandler(OnHBlank_0);

    return;
}
