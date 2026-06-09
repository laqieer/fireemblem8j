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

int GetBanimFactionPalette(u32 arg)
{
    u8 _arg = arg;
    switch (_arg) {
    case FACTION_RED:
        return BANIMPAL_RED;

    case FACTION_GREEN:
        return BANIMPAL_GREEN;

    case FACTION_PURPLE:
        return BANIMPAL_PURPLE;

    case FACTION_BLUE:
        return BANIMPAL_BLUE;
    }

    return BANIMPAL_BLUE;
}
