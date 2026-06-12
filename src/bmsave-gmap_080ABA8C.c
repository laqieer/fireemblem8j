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

//! FE8U = 0x080A7074
void ClearWorldMapStuff(void* ptr) {
    struct GMapSaveInfo info;

    CpuFill16(0, &info, sizeof(struct GMapSaveInfo));

    info.unk_1c_2 = 1;
    info.unk_1c_3 = 3;

    WriteAndVerifySramFast(&info, ptr, sizeof(struct GMapSaveInfo));

    return;
}
