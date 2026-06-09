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

//! FE8U = 0x0805A940
void SetMainMiniAnimPos(struct AnimBuffer * pAnimBuf, u16 x, u16 y)
{
    struct Anim * anim;

    pAnimBuf->xPos = x;
    pAnimBuf->yPos = y;

    anim = pAnimBuf->anim1;
    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    anim = pAnimBuf->anim2;
    anim->xPosition = pAnimBuf->xPos;
    anim->yPosition = pAnimBuf->yPos;

    return;
}

//! FE8U = 0x0805A95C
void SetMainMiniAnimLayer(struct AnimBuffer * pAnimBuf, u16 layer)
{
    struct Anim * anim;

    anim = pAnimBuf->anim1;
    anim->oam2Base = layer << 10;

    anim = pAnimBuf->anim2;
    anim->oam2Base = layer << 10;

    return;
}
