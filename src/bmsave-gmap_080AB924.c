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

//! FE8U = 0x080A6F0C
void ReadWorldMapPaths(struct GMapData* pGMapData, u8* pathFlags) {
    int i;

    pGMapData->openPaths.openPathsLength = 0;

    for (i = 0; i < 0x20; i++) {
        int idx = i / 8;

        if ((pathFlags[idx] >> (i & 7)) & 1) {
            AddGmPath(pGMapData, &pGMapData->openPaths, i);
        }
    }

    return;
}
