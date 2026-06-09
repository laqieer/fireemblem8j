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

bool EkrCheckAttackRound(u16 round)
{
    int i;
    s16 cur;

    for (i = round; i < 0x14; i = i + 2) {
        cur = gAnimRoundData[i];
        
        if (cur == ANIM_ROUND_HIT_CLOSE)
            return true;

        if (cur == ANIM_ROUND_CRIT_CLOSE)
            return true;

        if (cur == ANIM_ROUND_NONCRIT_FAR)
            return true;

        if (cur == ANIM_ROUND_CRIT_FAR)
            return true;

        if (cur == ANIM_ROUND_MISS_CLOSE)
            return true;
    }

    return false;
}
