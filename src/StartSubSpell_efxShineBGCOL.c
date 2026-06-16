#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_efxShineBGCOL[];
extern const u16 Frames_efxShineBGCOL[];

void StartSubSpell_efxShineBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxShineBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->frame = 0;
    proc->frame_config = Frames_efxShineBGCOL;

    proc->pal = Pal_ShineBg_0;
    SpellFx_RegisterBgPal(Pal_ShineBg_0, PLTT_SIZE_4BPP);

    return;
}
