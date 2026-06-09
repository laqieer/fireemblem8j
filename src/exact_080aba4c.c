#include "global.h"

#include "worldmap.h"
#include "agb_sram.h"
#include "bmsave.h"

/* file-scope type definitions used by this run */


union Unk_80A6FBC {
    struct __attribute__((packed, aligned(2))) Unk_80A6FBC_pat1 {
        u8 unk0_0 : 1;
        u8 unk0_1 : 6;
        u8 unk0_7 : 1;
        u8 unk1;
    } pat1;
    u16 pat2;
};

//! FE8U = 0x080A7034
void WriteWorldMapSkirmishes(struct GMapData* pGMapData, u8* skirmishFlags) {
    int i;

    for (i = 0; i < 3; i++) {
        skirmishFlags[i] = pGMapData->unk_c9[i];
    }

    return;
}
