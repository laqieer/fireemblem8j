extern int ReadWorldMapNodes();
extern int ReadWorldMapPaths();
extern int ReadWorldMapSkirmishes();
extern int ReadWorldMapUnits();
#include "global.h"
#include "worldmap.h"
#include "agb_sram.h"
#include "bmsave.h"

//! FE8U = 0x080A7138
void ReadWorldMapStuff(const void* sram_src, void* dst) {
    struct GMapData* pGMapData;
    struct GMapSaveInfo info;

    pGMapData = (struct GMapData*) dst;
    ReadSramFast(sram_src, &info, sizeof(struct GMapSaveInfo));

    ReadWorldMapNodes(pGMapData, info.nodes);
    ReadWorldMapPaths(pGMapData, info.paths);
    ReadWorldMapUnits(pGMapData, info.units);
    ReadWorldMapSkirmishes(pGMapData, info.skirmishes);

    pGMapData->unk_cc = info.skirmishState;

    if (info.unk_1c_1) {
        pGMapData->state.bits.monster_merged = 1;
    } else {
        pGMapData->state.bits.monster_merged = 0;
    }

    if (info.unk_1c_2) {
        pGMapData->state.bits.state_2 = 1;
    } else {
        pGMapData->state.bits.state_2 = 0;
    }

    pGMapData->state.bits.state_4_5 = info.unk_1c_3;

    pGMapData->xCamera = info.xCursor;
    pGMapData->yCamera = info.yCursor;

    return;
}
