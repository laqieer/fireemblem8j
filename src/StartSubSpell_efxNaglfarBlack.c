#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxNaglfarBlack[];

// clang-format on

//! FE8U = 0x08068614
void StartSubSpell_efxNaglfarBlack(struct Anim * anim, int b, int c)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxNaglfarBlack, PROC_TREE_VSYNC);

    proc->anim = anim;
    proc->timer = 0;
    proc->step = b;
    proc->unk30 = c;

    return;
}
