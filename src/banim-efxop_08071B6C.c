#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_efxopMistyrain[];
extern struct ProcCmd ProcScr_efxopMyrrh[];

void StartCRSubSpell_efxopMistyrainBG(struct Anim * anim, struct ProcEfx * parent);

// clang-format on

//! FE8U = 0x0806F5BC
void StartClassReelSpellAnimFlux(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMistyrain, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;
    proc->timer = 0;

    return;
}

//! FE8U = 0x0806F5E0
void efxopMistyrain_Loop_Main(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        StartCRSubSpell_efxopMistyrainBG(proc->anim, proc);
    }

    if (proc->timer == 16)
    {
        StartCRSubSpell_efxopMistyrainOBJ(proc->anim, proc);
    }

    if (proc->timer == 75)
    {
        proc->unk_64 = StartCRSubSpell_efxopMistyrainOBJ2(proc->anim, proc);
    }

    if (proc->timer == 94)
    {
        StartCRSubSpell_efxopMistyrainBG_2(proc->anim, proc);
    }

    if (proc->timer == 114)
    {
        Proc_End(proc->unk_64);
        Proc_Break(proc);
    }

    return;
}

// clang-format on

//! FE8U = 0x0806F648
void StartClassReelSpellAnimMyrrh(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopMyrrh, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}
