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

//! FE8U = 0x0805A96C
bool IsMainMiniAnimRoundEnd(struct AnimBuffer * pAnimBuf)
{
    struct Anim * anim1 = pAnimBuf->anim1;
    struct Anim * anim2 = pAnimBuf->anim2;

    if (anim1->nextRoundId == (u16)-2)
    {
        return true;
    }

    if (anim2->nextRoundId == (u16)-2)
    {
        return true;
    }

    return false;
}
