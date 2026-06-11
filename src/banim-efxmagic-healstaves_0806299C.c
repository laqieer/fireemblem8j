#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "ctc.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxLiveALPHA[];

// clang-format on

//! FE8U = 0x0806189C
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxLiveALPHA, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = timer;
    proc->unk2E = c;
    proc->unk29 = d;

    return;
}
