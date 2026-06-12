#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxExcaliburSCR[];

// clang-format on

//! FE8U = 0x080646FC
void StartSubSpell_efxExcaliburSCR(int unk)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxExcaliburSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;

    StartSubSpell_efxExcaliburSCR2(proc, unk);

    return;
}
