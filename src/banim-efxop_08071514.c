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
void StartCRSubSpell_efxopLiveBG(struct Anim * anim, struct ProcEfx * unused);
void StartCRSubSpell_efxopLiveBGCOL(struct Anim * anim, struct ProcEfx * unused);
void StartCRSubSpell_efxopLiveALPHA(struct Anim * anim, int timer, int c, int d, struct ProcEfx * unused);
void StartCRSubSpell_efxopLiveOBJ(struct Anim * anim, struct ProcEfx * unused);

//! FE8U = 0x0806EF64
void efxopLive_Loop_Main(struct ProcEfx * proc)
{
    StartCRSubSpell_efxopLiveOBJ(proc->anim, proc);
    StartCRSubSpell_efxopLiveBG(proc->anim, proc);
    StartCRSubSpell_efxopLiveBGCOL(proc->anim, proc);

    SetBlendAlpha(0, 16);

    StartCRSubSpell_efxopLiveALPHA(proc->anim, 1, 12, 0, proc);
    StartCRSubSpell_efxopLiveALPHA(proc->anim, 35, 25, 1, proc);

    Proc_Break(proc);

    return;
}
