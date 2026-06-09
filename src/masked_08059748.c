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

bool CheckBattleHasHit(void)
{
    const struct BattleHit *bh = &gBattleHitArray[0];
    if (bh->info & BATTLE_HIT_INFO_FINISHES)
        return true;
    else
        return false;
}
