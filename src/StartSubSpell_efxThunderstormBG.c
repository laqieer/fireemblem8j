#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd gProcScr_efxThunderstormBG[];
extern u16 * TsaArray_BoltingBg[];
extern u16 * ImgArray_BoltingBg[];
extern const u16 Frames_efxThunderstormBG[];

void StartSubSpell_efxThunderstormBG(struct Anim * anim)
{
    struct ProcEfxBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(gProcScr_efxThunderstormBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = Frames_efxThunderstormBG;
    proc->tsal = TsaArray_BoltingBg;
    proc->tsar = TsaArray_BoltingBg;
    proc->img = ImgArray_BoltingBg;

    SpellFx_RegisterBgPal(Pal_BoltingBg, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
