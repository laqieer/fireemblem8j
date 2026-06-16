#include "global.h"

extern char *gTerrainNames[];

char* GetTerrainName(int terrainId) {
    return gTerrainNames[terrainId];
}
