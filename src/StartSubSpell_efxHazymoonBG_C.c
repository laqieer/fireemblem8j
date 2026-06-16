#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxHazymoonBG[];
extern u16 * TsaArray_EclipseBg[];
extern u16 * ImgArray_EclipseBg[];
extern const u16 Frames_efxHazymoonBG_C[];

void StartSubSpell_efxHazymoonBG_C(struct Anim * anim)
{
    struct ProcEfxEclipseBG * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxHazymoonBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = Frames_efxHazymoonBG_C;

    proc->tsal = TsaArray_EclipseBg;
    proc->tsar = TsaArray_EclipseBg;

    proc->img = ImgArray_EclipseBg;
    proc->pal = NULL;

    SpellFx_RegisterBgPal(Pal_EclipseBg_C, PLTT_SIZE_4BPP);
    SpellFx_SetSomeColorEffect();

    return;
}
