#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxMagicQUAKE[];
ProcPtr NewEfxQuakePure(int index, int kind);

void StartSpellThing_MagicQuake(struct Anim * anim, int terminator, int c)
{
    struct ProcEfxMagicQuake * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxMagicQUAKE, PROC_TREE_3);
    proc->anim = anim;
    proc->pQuakePureProc = NewEfxQuakePure(c, 0);
    proc->timer = 0;
    proc->terminator = terminator;
    return;
}
