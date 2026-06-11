#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

extern EWRAM_DATA ProcPtr gpActiveClassReelSpellProc;
extern EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc;

/* prototypes for same-file helpers called by this run */
void StartCRSubSpell_efxopFireBG(struct Anim * anim, struct ProcEfx * parent);
void StartCRSubSpell_efxopFireOBJ(struct Anim * anim, struct ProcEfx * parent);

//! FE8U = 0x0806EB9C
void efxopFire_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopFireBG(proc->anim, proc);
    StartCRSubSpell_efxopFireOBJ(proc->anim, proc);

    Proc_Break(proc);

    return;
}
