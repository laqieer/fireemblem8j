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
struct AnimMagicFxBuffer * GetMagicEffectBufferFor(struct Anim * anim);

//! FE8U = 0x0806E9B4
void ClearCRSpellBgTmBuf(struct Anim * anim)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastFill(0, magicFx->bgTmBuf, 0x800);
    BG_EnableSyncByMask(1 << magicFx->bg);

    return;
}
