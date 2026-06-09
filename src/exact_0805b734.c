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

//! FE8U = 0x0805A990
void ApplyMainMiniAnimHitEffect(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim;

    anim = pAnimBuf->anim1;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    anim = pAnimBuf->anim2;
    anim->state3 |= ANIM_BIT3_HIT_EFFECT_APPLIED;

    return;
}

//! FE8U = 0x0805A9A4
bool IsMainMiniAnimEnd(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim = pAnimBuf->anim1;

    if (anim->nextRoundId != (u16)-1)
    {
        return false;
    }

    return true;
}
