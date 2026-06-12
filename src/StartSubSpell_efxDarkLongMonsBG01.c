#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * ImgArray_efxDarkLongMonsBG01[];
extern u16 * PalArray_efxDarkLongMonsBG01[];
extern struct ProcCmd ProcScr_efxDarkLongMonsBG01[];
extern u16 * TsaArray_efxDarkLongMonsBG01[];
extern const u16 gFrameConfig_efxDarkLongMonsBG01[];

// clang-format on

//! FE8U = 0x0806B134
void StartSubSpell_efxDarkLongMonsBG01(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDarkLongMonsBG01, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = gFrameConfig_efxDarkLongMonsBG01;

    proc->tsal = TsaArray_efxDarkLongMonsBG01;
    proc->img = ImgArray_efxDarkLongMonsBG01;
    proc->pal = PalArray_efxDarkLongMonsBG01;

    BG_SetPosition(BG_1, 0, 0);

    SetPrimaryHBlankHandler(OnHBlank_0);

    return;
}
