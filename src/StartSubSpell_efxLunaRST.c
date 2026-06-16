#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_efxLunaRST[];

void StartSubSpell_efxLunaRST(struct Anim * anim, ProcPtr efxproc, int duration)
{
    struct ProcEfxRST * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxLunaRST, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->duration = duration;
    proc->efxproc = efxproc;
}
