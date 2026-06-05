#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "banim_data.h"
#include "ctc.h"

struct BanimUnkStructCommPriv
{
    PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x32);

    /* 32 */ s16 unk32;

    /* 34 */ STRUCT_PAD(0x34, 0x3A);

    /* 3A */ s16 unk3A;

    /* 3C */ STRUCT_PAD(0x3C, 0x4C);

    /* 4C */ int unk4C;
};

struct ProcEkrUnitMainMini
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x5C);
    /* 5C */ void * unk_5C;
};

//! FE8U = 0x0805A3DC
void EkrUnitMainMini_UpdateAnim(struct AnimBuffer * pAnimBuf, struct Anim * anim)
{
    int _tmp;
    int r0;
#if NONMATCHING
    register int animState2 asm("r5");
#else
    int animState2;
#endif

    if (anim == NULL)
    {
        return;
    }

    _tmp = anim->state2;
    animState2 = _tmp & 0xf000;
    animState2 &= anim->state2;

    if (animState2 == 0)
    {
        return;
    }

    if (animState2 & 0x1000)
    {
    _loop:
    {
        if (anim->commandQueueSize == 0)
        {
            goto _exit;
        }

        // FIXME: I really have no idea what is going on here...
        r0 = ((struct Anim *)((anim->commandQueueSize + (u8 *)(anim))))->commandQueueSize;

        switch (r0)
        {
            case 1:
            case 2:
                // _0805A4F0
                EkrMainMini_AnimMarkRoundEnd(anim);
                break;

            case 5:
                // _0805A4F8
                if (GetAISLayerId(anim) == 0)
                {
                    StartClassReelSpellAnim(anim);
                }

                // fallthrough

            case 3:
            case 4:
                anim->pScrCurrent++;

                break;

            case 13:
                // _0805A510
                EkrMainMini_AnimUpdateFrameGfx(anim);
                break;

            case 14:
                // _0805A518
                StartClassReelSpellAnim(anim);
                break;

            case 24:
                // _0805A520
                EkrMainMini_AnimMarkRoundEnd(anim);
                break;

            case 0:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
            case 12:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
            case 21:
            case 22:
            case 23:
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 38:
            case 39:
            case 40:
            case 41:
            case 42:
            case 43:
            case 44:
            case 45:
            case 46:
            case 47:
            case 48:
            case 49:
            case 50:
            default:
                // _0805A526
                break;
        }

        anim->commandQueueSize--;
        goto _loop;
    }

    _exit:
        anim->state2 &= 0xe700;
    }

    if (animState2 & 0x2000)
    {
        if ((GetAISLayerId(anim) == 0) && (pAnimBuf->unk_2C != anim->pImgSheet))
        {
            RegisterAISSheetGraphics(anim);
            pAnimBuf->unk_2C = anim->pImgSheet;
        }

        anim->state2 &= 0xd700;
    }

    animState2 &= 0x4000;

    if (animState2 != 0)
    {
        anim->nextRoundId = -1;
    }

    return;
}

//! FE8U = 0x0805A580
void EkrMainMini_AnimMarkRoundEnd(struct Anim * anim)
{
    anim->nextRoundId = -2;

    if (anim->state3 & ANIM_BIT3_HIT_EFFECT_APPLIED)
    {
        anim->state3 &= ANIM_BIT3_HIT_EFFECT_APPLIED;
        anim->nextRoundId = 0;
        anim->pScrCurrent++;
    }

    return;
}

//! FE8U = 0x0805A5A8
void EkrMainMini_AnimUpdateFrameGfx(struct Anim * anim)
{
    struct AnimBuffer * pAnimBuffer = anim->pUnk44;
    struct BattleAnim * banim = banim_data;
    void * pool;

    if (GetAISLayerId(anim) == 0)
    {
        int mode = BanimDefaultModeConfig[0x18];
        int * whoKnows = banim[pAnimBuffer->animId].modes;

        struct Anim * anim1 = pAnimBuffer->anim1;
        struct Anim * anim2 = pAnimBuffer->anim2;

        const void * unk28 = pAnimBuffer->unk_28;
#ifndef NONMATCHING
        register struct BanimModeData * frameData asm("r1") = (void *)unk28 + whoKnows[mode];
        register u32 r1 asm("r1");

        anim1->pImgSheet = frameData->img;
        unk28 = anim1->pSpriteDataPool;
        anim1->pSpriteData = unk28 += r1 = frameData->unk2;

        unk28 = anim2->pSpriteDataPool;
        anim2->pSpriteData = unk28 += 0x000057F0;
#else
        struct BanimModeData * frameData = (void *)unk28 + whoKnows[mode];

        anim1->pImgSheet = frameData->img;
        anim1->pSpriteData = anim1->pSpriteDataPool + frameData->unk2;

        anim2->pSpriteData = anim2->pSpriteDataPool + 0x000057F0;
#endif

        if (pAnimBuffer->unk_2C != anim->pImgSheet)
        {
            NewEkrChienCHR(anim);
            pAnimBuffer->unk_2C = anim->pImgSheet;
        }
    }

    return;
}

//! FE8U = 0x0805A60C
void InitMainMiniAnim(struct AnimBuffer * pAnimBuf)
{
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[pAnimBuf->roundType * 4];
    configA = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 1];
    modeB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 2];
    configB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 3];

    LZ77UnCompWram(ba[pAnimBuf->animId].script, (void *)pAnimBuf->unk_28);

    ba2 = ba + pAnimBuf->animId;
    modes = ba2->modes;
    scr = (u32 *)pAnimBuf->unk_28;

    scrA = BanimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = BanimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (pAnimBuf->state2 == 0)
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = AnimCreate(scrA, configA);

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (pAnimBuf->state2 << 9) | 0x400 | anim->state2;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    pAnimBuf->anim1 = anim;
    anim->pUnk44 = pAnimBuf;

    if (pAnimBuf->animId == 0xc4)
    {
        pAnimBuf->anim2 = 0;
    }
    else
    {
        anim = AnimCreate(scrB, configB);

        anim->pSpriteDataPool = pAnimBuf->unk_24;

        anim->xPosition = pAnimBuf->xPos;
        anim->yPosition = pAnimBuf->yPos;

        anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
        anim->state2 = (pAnimBuf->state2 << 9) | 0x500 | anim->state2;

        anim->nextRoundId = 0;
        anim->currentRoundType = pAnimBuf->roundType;
        anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

        pAnimBuf->anim2 = anim;
        anim->pUnk44 = pAnimBuf;
    }

    LZ77UnCompWram(ba[pAnimBuf->animId].pal, pAnimBuf->unk_20);

    if (pAnimBuf->charPalId != -1)
    {
        struct BattleAnimCharaPal * cbap = &character_battle_animation_palette_table[pAnimBuf->charPalId];
        LZ77UnCompWram(cbap->pal, pAnimBuf->unk_20);
    }

    CpuFastSet(pAnimBuf->unk_20 + pAnimBuf->genericPalId * 0x20, pAnimBuf->oam2Pal * 0x10 + gPaletteBuffer + 0x100, 8);

    EnablePaletteSync();

    pAnimBuf->unk_2C = 0;
}

//! FE8U = 0x0805A7B4
void RestartMainMiniAnim(struct AnimBuffer * pAnimBuf)
{
    struct BattleAnimCharaPal * cbapt = character_battle_animation_palette_table;
    u32 modeA;
    u32 configA;
    u32 modeB;
    u32 configB;

    struct Anim * anim;
    u32 * puVar8;
    u32 * scrA;
    u32 * scrB;
    struct BattleAnim * ba;
    struct BattleAnim * ba2;
    u32 * scr;
    int * modes;
    int mode;

    ba = banim_data;

    modeA = BanimDefaultModeConfig[pAnimBuf->roundType * 4];
    modeB = BanimDefaultModeConfig[pAnimBuf->roundType * 4 + 2];

    LZ77UnCompWram(ba[pAnimBuf->animId].script, (void *)pAnimBuf->unk_28);

    ba2 = ba + pAnimBuf->animId;
    modes = ba2->modes;
    scr = (u32 *)pAnimBuf->unk_28;

    scrA = BanimScr_DefaultAnim;
    if (modeA != 0xff)
    {
        scrA = (void *)scr + modes[modeA];
    }

    scrB = BanimScr_DefaultAnim;
    if (modeB != 0xff)
    {
        scrB = (void *)scr + modes[modeB];
    }

    if (pAnimBuf->state2 == 0)
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_l, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }
    else
    {
        int * p;
        puVar8 = pAnimBuf->unk_24;
        LZ77UnCompWram(ba2->oam_r, puVar8);
        p = (puVar8 + 0x15FC);
        *p = 1;
    }

    anim = pAnimBuf->anim1;

    anim->pScrStart = scrA;
    anim->pScrCurrent = scrA;

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    anim->commandQueueSize = 0;
    pAnimBuf->anim1 = anim;

    anim = pAnimBuf->anim2;

    anim->pScrStart = scrB;
    anim->pScrCurrent = scrB;

    anim->pSpriteDataPool = pAnimBuf->unk_24;

    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim->oam2Base = (pAnimBuf->oam2Pal << 0xc) | 0x800 | pAnimBuf->oam2Tile;
    anim->state2 = (anim->state2 & 0x700);

    anim->state3 = 0;
    anim->timer = 0;
    anim->nextRoundId = 0;
    anim->currentRoundType = pAnimBuf->roundType;
    anim->pImgSheetBuf = pAnimBuf->pImgSheetBuf;

    anim->commandQueueSize = 0;
    pAnimBuf->anim2 = anim;

    LZ77UnCompWram(ba[pAnimBuf->animId].pal, pAnimBuf->unk_20);

    if (pAnimBuf->charPalId != -1)
        LZ77UnCompWram(cbapt[pAnimBuf->charPalId].pal, pAnimBuf->unk_20);

    CpuFastCopy(pAnimBuf->unk_20 + pAnimBuf->genericPalId * 0x20, pAnimBuf->oam2Pal * 0x10 + gPaletteBuffer + 0x100, 0x20);

    EnablePaletteSync();

    return;
}
