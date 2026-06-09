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

int GetBanimSheetSelectByte(struct UnkStruct2_sub_805893C * arg)
{
    u32 val;
    u32 val1;
    u16 * buf = gUnk_51;
    val = ((arg->unk1->unk28 | arg->unk2->unk28) >> 0x8) & 0x1;
    *buf = val = arg->unk1->unk23[val];
    return val - 1;
}
