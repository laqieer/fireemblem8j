#include "global.h"
#include "hardware.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "constants/terrains.h"
#include "constants/chapters.h"

void ApplyWaterShadowsBmMap(void) {
    int ix, iy;

    // Automatic water shadows?

    for (iy = 0; iy < gBmMapSize.y; ++iy) {
        for (ix = 0; ix < gBmMapSize.x; ++ix) {
            int connexion;

            if (gBmMapTerrain[iy][ix] != TERRAIN_WATER)
                continue;

            connexion = 0;

            if (ix > 0) {
                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_FLOOR_REGULAR)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_STAIRS)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST_EMPTY)
                    connexion = 1;

                if (gBmMapTerrain[iy][ix - 1] == TERRAIN_CHEST_FULL)
                    connexion = 1;
            }

            if (iy > 0) {
                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_FLOOR_REGULAR)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_STAIRS)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST_EMPTY)
                    connexion += 2;

                if (gBmMapTerrain[iy - 1][ix] == TERRAIN_CHEST_FULL)
                    connexion += 2;
            }

            if (ix > 0 && iy > 0)
                if ((gBmMapTerrain[iy]    [ix - 1] == TERRAIN_FLOOR_REGULAR) &&
                    (gBmMapTerrain[iy + 1][ix - 1] == TERRAIN_WATER) &&
                    (gBmMapTerrain[iy - 1][ix]     != TERRAIN_FLOOR_REGULAR))
                    connexion = 4;

            switch (connexion) {

            case 1: // straight shadow on the left
                gBmMapBaseTiles[iy][ix] = 0x2DC;
                break;

            case 2: // straight shadow on the top
                gBmMapBaseTiles[iy][ix] = 0x2D8;
                break;

            case 3: // shadow on both the left and the top
                gBmMapBaseTiles[iy][ix] = 0x358;
                break;

            case 4: // shadow on the left, but stronger at the top-left than bottom-left
                gBmMapBaseTiles[iy][ix] = 0x35C;
                break;

            } // switch (connexion)
        }
    }
}
