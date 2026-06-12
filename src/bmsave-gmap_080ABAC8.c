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

/* prototypes for same-file helpers called by this run */
void WriteWorldMapNodes(struct GMapData* pGMapData, u8* nodeFlags);
void WriteWorldMapPaths(struct GMapData* pGMapData, u8* pathFlags);
void WriteWorldMapUnits(struct GMapData* pGMapData, u16* param_2);
void WriteWorldMapSkirmishes(struct GMapData* pGMapData, u8* skirmishFlags);

//! FE8U = 0x080A70B0
void WriteWorldMapStuff(void* sram_dest, void* src) {
    struct GMapData* pGMapData;
    struct GMapSaveInfo info;

    pGMapData = (struct GMapData*)src;

    WriteWorldMapNodes(pGMapData, info.nodes);
    WriteWorldMapPaths(pGMapData, info.paths);
    WriteWorldMapUnits(pGMapData, info.units);
    WriteWorldMapSkirmishes(pGMapData, info.skirmishes);

    info.skirmishState = pGMapData->unk_cc;
    info.xCursor = pGMapData->xCamera;
    info.yCursor = pGMapData->yCamera;

    info.unk_1c_1 = pGMapData->state.bits.monster_merged;
    info.unk_1c_2 = pGMapData->state.bits.state_2;
    info.unk_1c_3 = pGMapData->state.bits.state_4_5;

    WriteAndVerifySramFast(&info, sram_dest, sizeof(struct GMapSaveInfo));

    return;
}
