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

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxLiveALPHA(struct Anim * anim, int timer, int c, int d);
void StartSubSpell_efxReserveOBJ(struct Anim * anim);
void StartSubSpell_efxReserveBG(struct Anim * anim);
void StartSubSpell_efxReserveBGCOL(struct Anim * anim, u32 kind);
void StartSubSpell_efxReserveBG2(struct Anim * anim);
void StartSubSpell_efxReserveBGCOL2(struct Anim * anim, u32 kind);

//! FE8U = 0x08061C78
void efxReserve_Loop_Main(struct ProcEfx * proc)
{
    proc->timer++;

    if (proc->timer == 1)
    {
        StartSubSpell_efxReserveOBJ(proc->anim);
        PlaySFX(0x2cc, 0x100, proc->anim->xPosition, 1);
    }
    else if (proc->timer == 52)
    {
        StartSubSpell_efxReserveBG(proc->anim);
        StartSubSpell_efxReserveBGCOL(proc->anim, proc->hitted);
    }
    else if (proc->timer == 183)
    {
        PlaySFX(0x114, 0x100, 120, 0);

        StartSubSpell_efxReserveBG2(proc->anim);
        StartSubSpell_efxReserveBGCOL2(proc->anim, proc->hitted);

        SetBlendAlpha(0, 16);

        StartSubSpell_efxLiveALPHA(proc->anim, 1, 20, 0);
        StartSubSpell_efxLiveALPHA(proc->anim, 180, 40, 1);
    }
    else if (proc->timer == 453)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
