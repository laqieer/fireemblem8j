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

//! FE8U = 0x0806EAD4
void CRSpell_RegisterBgPal(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastCopy(src, gPaletteBuffer + (magicFx->bgPalId * 0x10), PLTT_SIZE_4BPP);
    EnablePaletteSync();

    return;
}

//! FE8U = 0x0806EAFC
void CRSpell_RegisterObjGfx(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    void * dst = (void *)(0x6010000 + magicFx->objChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->objImgBuf);
    RegisterDataMove(magicFx->objImgBuf, dst, 0x1000);

    return;
}

//! FE8U = 0x0806EB2C
void CRSpell_RegisterObjPal(struct Anim * anim, u16 * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    CpuFastCopy(src, gPaletteBuffer + 0x100 + (magicFx->objPalId * 0x10), PLTT_SIZE_4BPP);
    EnablePaletteSync();

    return;
}
