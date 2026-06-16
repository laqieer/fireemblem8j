#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "bm.h"
#include "ekrlevelup.h"

extern struct ProcCmd ProcScr_efxFirebreathBGCOL[];
extern const u16 Frames_efxFirebreathBGCOL[];

void StartSubSpell_efxFirebreathBGCOL(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxFirebreathBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    proc->frame = 0;
    proc->frame_config = Frames_efxFirebreathBGCOL;

    proc->pal = Pal_FireBreathBg;

    return;
}
