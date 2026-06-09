#include "global.h"

#include "hardware.h"

#include "anime.h"

 int  AnimInterpret(struct Anim* anim);
 void AnimInsert(struct Anim* anim);
 void AnimDisplayPrivate(struct Anim* anim);
 void Anim_0(struct Anim* anim, u32 instruction);

typedef void (*AnimCallback_t) (struct Anim* anim);

EWRAM_DATA static struct Anim sAnimPool[ANIM_MAX_COUNT] = {};
EWRAM_DATA static struct Anim* sFirstAnim = NULL;

/* prototypes for same-file helpers called by this run */
int AnimInterpret(struct Anim* anim);
void AnimInsert(struct Anim* anim);
void AnimDisplayPrivate(struct Anim* anim);

void AnimUpdateAll(void)
{
    struct Anim* anim;
    int boolNeedsSort = FALSE;

    if (!sFirstAnim)
        return;

    for (anim = sFirstAnim;; anim = anim->pNext)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        if (!(anim->state & ANIM_BIT_FROZEN))
        {
            if (anim->timer == 0 || --anim->timer == 0)
            {
                do
                {
                    if (AnimInterpret(anim) == TRUE)
                        boolNeedsSort = TRUE;
                }
                while (anim->timer == 0);
            }

            if (ANIM_IS_DISABLED(anim))
                continue;
        }

        if (!(anim->state & ANIM_BIT_HIDDEN))
            AnimDisplayPrivate(anim);

        if (!anim->pNext)
            break;
    }

    if (boolNeedsSort == TRUE)
        AnimSort();
}

void AnimClearAll(void)
{
    struct Anim* it;

    for (it = sAnimPool; it < sAnimPool + ANIM_MAX_COUNT; ++it)
    {
        it->state = 0;
        it->pPrev = NULL;
        it->pNext = NULL;
    }

    sFirstAnim = NULL;
}

struct Anim* AnimCreate_unused(const void* frameData)
{
    struct Anim* anim;

    // Find anim slot for new anim
    for (anim = sAnimPool; (anim < sAnimPool + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == sAnimPool + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_ENABLED;

    anim->pScrCurrent = frameData;
    anim->pScrStart = frameData;

    anim->timer = 0;
    anim->oam2Base = 0;
    anim->drawLayerPriority = 0;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->commandQueueSize = 0;

    anim->pImgSheetBuf = NULL;
    anim->pSpriteDataPool = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    AnimInsert(anim);

    return anim;
}

struct Anim* AnimCreate(const void* frameData, u16 displayPriority)
{
    struct Anim* anim;

    // Find anim slot for new anim
    for (anim = sAnimPool; (anim < sAnimPool + ANIM_MAX_COUNT) && !ANIM_IS_DISABLED(anim); ++anim) {}

    // return null if no anim slot was found
    if (anim == sAnimPool + ANIM_MAX_COUNT)
        return NULL;

    anim->state = ANIM_BIT_ENABLED;

    anim->pScrCurrent = frameData;
    anim->pScrStart = frameData;

    anim->timer = 0;
    anim->oam2Base = 0;
    anim->drawLayerPriority = displayPriority;
    anim->state2 = 0;
    anim->state3 = 0;
    anim->oamBase = 0;

    anim->commandQueueSize = 0;

    anim->pImgSheetBuf = NULL;
    anim->pSpriteDataPool = NULL;
    anim->pUnk40 = NULL;
    anim->pUnk44 = NULL;

    AnimInsert(anim);

    return anim;
}

void AnimSort(void)
{
    struct Anim* anim;

    for (anim = sAnimPool; anim < sAnimPool + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        anim->pPrev = NULL;
        anim->pNext = NULL;
    }

    sFirstAnim = NULL;

    for (anim = sAnimPool; anim < sAnimPool + ANIM_MAX_COUNT; ++anim)
    {
        if (ANIM_IS_DISABLED(anim))
            continue;

        AnimInsert(anim);
    }
}

void AnimDelete(struct Anim* anim)
{
    if (anim->pPrev == NULL)
    {
        sFirstAnim = anim->pNext;
        anim->pNext->pPrev = NULL;
    }
    else
    {
        anim->pPrev->pNext = anim->pNext;
        anim->pNext->pPrev = anim->pPrev;
    }

    anim->state = 0;
    anim->pPrev = NULL;
    anim->pNext = NULL;
}
