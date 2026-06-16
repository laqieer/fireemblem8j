#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_efxLunaBGCOL[];
extern const u16 Frames_efxLunaBGCOL[];

void StartSubSpell_efxLunaBGCOL(struct Anim * anim, int terminator)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLunaBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = 0;
    proc->terminator = terminator;

    proc->frame = 0;
    proc->frame_config = Frames_efxLunaBGCOL;

    proc->pal = Pal_LunaBg2;
    SpellFx_RegisterBgPal(Pal_LunaBg2, PLTT_SIZE_4BPP);

    return;
}
