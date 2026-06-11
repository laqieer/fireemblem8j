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
extern struct ProcCmd ProcScr_efxReserve[];

// clang-format on

//! FE8U = 0x08061C18
void StartSpellAnimFortify(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 0;

    return;
}

//! FE8U = 0x08061C48
void StartSpellAnimLatona(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    NewEfxSpellCast();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxReserve, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = 1;

    return;
}
