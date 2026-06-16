#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_efxLunaSCR[];
void StartSubSpell_efxLunaSCR2(ProcPtr proc);

void StartSubSpell_efxLunaSCR(void)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxLunaSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;
    StartSubSpell_efxLunaSCR2(proc);
    return;
}
