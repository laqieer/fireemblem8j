#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format on

//! FE8U = 0x080657D4
extern struct ProcCmd ProcScr_efxIvaldi[];
void sub_8055E2C(void);
void StartSpellAnimIvaldi(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    sub_8055E2C();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxIvaldi, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}
