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
void StartCRSubSpell_efxopThunderBG(struct Anim * anim, struct ProcEfx * unused);
void StartCRSubSpell_efxopThunderBGCOL(struct Anim * anim, struct ProcEfx * unused);
void StartCRSubSpell_efxopThunderOBJ(struct Anim * anim, struct ProcEfx * unused);

//! FE8U = 0x0806ED2C
void efxopThunder_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopThunderBG(proc->anim, proc);
    StartCRSubSpell_efxopThunderBGCOL(proc->anim, proc);
    StartCRSubSpell_efxopThunderOBJ(proc->anim, proc);

    Proc_Break(proc);

    return;
}
