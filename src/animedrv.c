#include "global.h"

#include "hardware.h"

#include "anime.h"

static int  AnimInterpret(struct Anim* anim);
static void AnimInsert(struct Anim* anim);
static void AnimDisplayPrivate(struct Anim* anim);
 void Anim_0(struct Anim* anim, u32 instruction);

typedef void (*AnimCallback_t) (struct Anim* anim);


EWRAM_DATA static struct Anim* sFirstAnim = NULL;

int AnimInterpret(struct Anim* anim)
{
    int boolNeedsResort = FALSE;

    u32 instruction = *anim->pScrCurrent++;

    if (ANINS_IS_NOT_FORCESPRITE(instruction))
    {
        if (ANINS_IS_PTRINS(instruction))
        {
            switch (ANINS_PTRINS_GET_TYPE(instruction))
            {

            case 0: // function call
                ((AnimCallback_t) (ANINS_PTRINS_GET_ADDRESS(instruction)))(anim);
                break;

            case 1: // set new frame data
                anim->pScrStart   = ANINS_PTRINS_GET_ADDRESS(instruction);
                anim->pScrCurrent = ANINS_PTRINS_GET_ADDRESS(instruction);

                anim->timer = 1;

                break;

            } // switch (ANINS_PTRINS_GET_TYPE(instruction))
        }
        else
        {
            switch (ANINS_GET_TYPE(instruction))
            {

            case ANIM_INS_TYPE_STOP:
                anim->pScrCurrent--;
                anim->timer = 1;

                anim->state2 = (anim->state2 & 0xFFF) | ANIM_BIT2_STOP;

                break;

            case ANIM_INS_TYPE_END:
                anim->state = 0;
                anim->timer = 1;

                boolNeedsResort = TRUE;

                break;

            case ANIM_INS_TYPE_LOOP:
                anim->pScrCurrent = anim->pScrStart;
                anim->timer = 1;

                break;

            case ANIM_INS_TYPE_WAIT:
                anim->timer = ANINS_WAIT_GET_DELAY(instruction);
                break;

            case ANIM_INS_TYPE_MOVE:
                anim->xPosition += ANINS_MOVE_GET_XOFF(instruction);
                anim->yPosition += ANINS_MOVE_GET_YOFF(instruction);

                anim->timer = ANINS_MOVE_GET_DELAY(instruction);

                break;

            case ANIM_INS_TYPE_COMMAND:
                anim->state2 = (anim->state2 & 0xFFF) | ANIM_BIT2_COMMAND;

                anim->commandQueue[anim->commandQueueSize] = ANINS_COMMAND_GET_ID(instruction);
                anim->commandQueueSize++;

                anim->timer = 1;

                switch (ANINS_COMMAND_GET_ID(instruction))
                {

                case ANIM_CMD_WAIT_01:
                case ANIM_CMD_WAIT_02:
                case ANIM_CMD_WAIT_03:
                case ANIM_CMD_WAIT_04:
                case ANIM_CMD_WAIT_05:
                case ANIM_CMD_WAIT_13:
                case ANIM_CMD_WAIT_18:
                case ANIM_CMD_WAIT_2D:
                case ANIM_CMD_WAIT_39:
                case ANIM_CMD_WAIT_52:
                    anim->pScrCurrent--;
                    break;

                } // switch (ANINS_COMMAND_GET_ID(instruction))

                break;

            case ANIM_INS_TYPE_FRAME:
                anim->timer = ANINS_FRAME_GET_DELAY(instruction);
                anim->unk13 = ANINS_FRAME_GET_UNK(instruction);

                anim->pImgSheet = (const void*) (*anim->pScrCurrent++);

                // ???????
                anim->pSpriteData = (const void*) (*anim->pScrCurrent++);
                anim->pSpriteData += (unsigned) anim->pSpriteDataPool;

                anim->state2 = (anim->state2 & 0xFFF) | ANIM_BIT2_FRAME;

                break;

            } // switch (0x3F & (instruction >> 24))
        }
    }
    else
    {
        anim->pSpriteData = ANINS_FORCESPRITE_GET_ADDRESS(instruction);
        anim->timer       = ANINS_FORCESPRITE_GET_DELAY(instruction);
    }

    return boolNeedsResort;
}

void AnimInsert(struct Anim* anim)
{
    struct Anim* it = sFirstAnim;

    if (!sFirstAnim)
    {
        sFirstAnim = anim;
        return;
    }

    for (;;)
    {
        if (anim->drawLayerPriority > it->drawLayerPriority)
        {
            struct Anim* prev = it->pPrev;

            anim->pPrev = it->pPrev;
            anim->pNext = it;
            it->pPrev = anim;

            if (!anim->pPrev)
                sFirstAnim = anim;
            else
                prev->pNext = anim;

            break;
        }

        if (!it->pNext)
        {
            anim->pNext = it->pNext;
            anim->pPrev = it;
            it->pNext = anim;

            return;
        }

        it = it->pNext;
    }
}

void AnimDisplayPrivate(struct Anim* anim)
{
    unsigned baseAffineId = gOamAffinePutId;

    const struct AnimSpriteData* oamData = anim->pSpriteData;
    const struct AnimSpriteData* it;

    int i;
    int x, y;

    if (!oamData)
        return;

    if ((oamData->header &~ 0xFFFF) == 0xFFFF0000)
    {
        for (i = oamData->header & 0xFFFF; i != 0; gOamAffinePutId++, --i, oamData++)
        {
            gOamAffinePutIt[3] = oamData->as.affine.pa;
            gOamAffinePutIt += 4;

            gOamAffinePutIt[3] = oamData->as.affine.pb;
            gOamAffinePutIt += 4;

            gOamAffinePutIt[3] = oamData->as.affine.pc;
            gOamAffinePutIt += 4;

            gOamAffinePutIt[3] = oamData->as.affine.pd;
            gOamAffinePutIt += 4;
        }
    }

    for (it = oamData; it->header != 1 && (void *)gOamHiPutIt < (void *)((u32*) (gOam) + 0x100); ++it)
    {
        x = it->as.object.x + anim->xPosition;
        y = it->as.object.y + anim->yPosition;

        if (x > 0x100)
            x = 0x180;
        else if (x < -0x40)
            x = 0x180;

        if (y > 0x0A0)
            x = 0x180;
        else if (y < -0x40)
            x = 0x180;

        x = x & 0x1FF;
        y = y & 0x0FF;

        i = 0;

        if (it->header & 0x100)
            i = (baseAffineId << 25);

        i = i + anim->oamBase;

        // ugh
        *gOamHiPutIt++ = (it->header + i) | (x << 16) | (y);
        *(u16*)(gOamHiPutIt++) = (it->as.object.oam2 & 0xF3FF) + anim->oam2Base;
    }
}
