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

//! FE8U = 0x0806E9E4
struct Anim * CRSpellCreateFrontAnim(struct Anim * anim, u16 scrIdx, void * scrA, void * scrB)
{
    struct Anim * newAnim;

    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    if (scrIdx == 0)
    {
        newAnim = AnimCreate(scrA, 120);
    }
    else
    {
        newAnim = AnimCreate(scrB, 120);
    }

    newAnim->oam2Base = (magicFx->objPalId << 12) | magicFx->objChr | OAM2_LAYER(2);
    newAnim->xPosition = anim->xPosition;
    newAnim->yPosition = anim->yPosition;

    return newAnim;
}

//! FE8U = 0x0806EA38
void CRSpell_WriteBgMap(struct Anim * anim, u16 notFlipped, void * src, u16 isCompressed)
{
    void * buf;
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    if (isCompressed == 1)
    {
        LZ77UnCompWram(src, magicFx->bgTsaBuf);
    }

    buf = src;

    if (isCompressed == 1)
    {
        buf = magicFx->bgTsaBuf;
    }

    if (notFlipped == 0)
    {
        EfxTmCpyBgHFlip(buf, magicFx->bgTmBuf, 30, 20, magicFx->bgPalId, magicFx->bgChr);
    }
    else
    {
        EfxTmCpyBG(buf, magicFx->bgTmBuf, 30, 20, magicFx->bgPalId, magicFx->bgChr);
    }

    BG_EnableSyncByMask(1 << magicFx->bg);

    return;
}

//! FE8U = 0x0806EAA4
void CRSpell_RegisterBgGfx(struct Anim * anim, void * src)
{
    struct AnimMagicFxBuffer * magicFx = GetMagicEffectBufferFor(anim);

    void * dst = (void *)(VRAM + magicFx->bgChr * CHR_SIZE);

    LZ77UnCompWram(src, magicFx->bgImgBuf);
    RegisterDataMove(magicFx->bgImgBuf, dst, 0x2000);

    return;
}
