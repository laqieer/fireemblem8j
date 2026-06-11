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
void StartSubSpell_efxRestBG(struct Anim * anim);
void StartSubSpell_efxRestOBJ(struct Anim * anim);

//! FE8U = 0x08062128
void efxRest_Loop_Main(struct ProcEfx * proc)
{
    struct Unit * unit;

    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        StartSubSpell_efxRestBG(anim);
        NewEfxALPHA(anim, 40, 30, 16, 8, 0);
        NewEfxALPHA(anim, 71, 30, 8, 16, 0);
        NewEfxALPHA(anim, 102, 30, 16, 8, 0);
        NewEfxALPHA(anim, 133, 30, 8, 16, 0);
        NewEfxALPHA(anim, 164, 60, 16, 0, 0);
        PlaySFX(0xfd, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 80)
    {
        StartSubSpell_efxRestOBJ(anim);
    }
    else if (proc->timer == duration + 164)
    {
        NewEfxFlashUnit(anim, 1, 5, 0);
    }
    else if (proc->timer == duration + 200)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimStatusChgHitEffects(anim, proc->hitted);

        if (GetAnimPosition(anim) == 0)
        {
            unit = &gpEkrBattleUnitLeft->unit;
        }
        else
        {
            unit = &gpEkrBattleUnitRight->unit;
        }

        if (unit->statusIndex == UNIT_STATUS_PETRIFY)
        {
            SetUnitEfxDebuff(anim, 0);

            unit = GetUnit(unit->index);
            unit->state &= ~(US_UNSELECTABLE | US_HAS_MOVED | US_HAS_MOVED_AI);

            RefreshEntityBmMaps();
            RefreshUnitSprites();
            EndAllMus();
        }

        SetUnitEfxDebuff(anim, 0);
    }
    else if (proc->timer == duration + 300)
    {
        anim->state3 |= ANIM_BIT3_NEXT_ROUND_START;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();

        Proc_Break(proc);
    }

    return;
}
