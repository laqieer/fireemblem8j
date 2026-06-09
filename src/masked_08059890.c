#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmbattle.h"
#include "anime.h"
#include "bmitem.h"
#include "constants/items.h"



/* file-scope type definitions used by this run */


struct UnkStruct1_sub_805893C {
    u8 _pad_[0x23];
    u8 unk23[5];
    u32 unk28;
};

struct UnkStruct2_sub_805893C {
    struct UnkStruct1_sub_805893C * unk1;
    struct UnkStruct1_sub_805893C * unk2;
};

s16 GetEfxHp(int index)
{
    return (u8)gEfxHpLut[index];
}

s16 GetEfxHpModMaybe(int index)
{
    s16 * buf = (s16 *)gEfxHpLut;
    return buf[index] & (-0x100);
}
