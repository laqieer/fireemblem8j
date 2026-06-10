#include "global.h"
#include "bmmap.h"

extern u8 sBmMapUnitPool[];
extern u8 sBmMapTerrainPool[];
void BmMapInit(void * pool, void * mapOut, int width, int height);

void InitMapForMinimap(int chapterId) {
    UnpackChapterMap(gBmMapBuffer, chapterId);

    BmMapInit(sBmMapUnitPool,    &gBmMapUnit,    gBmMapSize.x, gBmMapSize.y);
    BmMapInit(sBmMapTerrainPool, &gBmMapTerrain, gBmMapSize.x, gBmMapSize.y);

    BmMapFill(gBmMapUnit, 0);
    BmMapFill(gBmMapTerrain, 0);

    InitBaseTilesBmMap();
    RefreshTerrainBmMap();
}
