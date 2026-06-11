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
extern struct ProcCmd ProcScr_efxopFire[];
extern SpellAnimFunc gClassReelSpellAnimFuncLut[];

// clang-format on

//! FE8U = 0x0806EB54
void StartClassReelSpellAnim(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

#if BUGFIX
    if (gClassReelSpellAnimFuncLut[magicFx->magicFuncIdx] == NULL)
        return;
#endif

    gClassReelSpellAnimFuncLut[magicFx->magicFuncIdx](anim);

    return;
}

//! FE8U = 0x0806EB78
void StartClassReelSpellAnimDummy(struct Anim * anim)
{
    return;
}

// clang-format on

//! FE8U = 0x0806EB7C
void StartClassReelSpellAnimFire(struct Anim * anim)
{
    struct ProcEfx * proc = Proc_Start(ProcScr_efxopFire, PROC_TREE_3);
    SetActiveClassReelSpell(proc);

    proc->anim = anim;

    return;
}
