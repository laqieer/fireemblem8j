#include "global.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "uiutils.h"

extern const u16* sUiFrameModelTilemapLookup[];


void DrawUiFrame(u16* tilemap, int x, int y, int width, int height, int tilebase, int style)
{
    const u16* model = sUiFrameModelTilemapLookup[style];

    int xMax = x + width  - 1;
    int yMax = y + height - 1;

    int iy, ix;

    for (iy = y + 1; iy < yMax; iy += 2)
    {
        for (ix = x + 1; ix < xMax; ix += 2)
        {
            u16 tilemapOffset = TILEMAP_INDEX(ix, iy);

            tilemap[tilemapOffset + TILEMAP_INDEX(0, 0)] = model[6]  + tilebase; // center tile
            tilemap[tilemapOffset + TILEMAP_INDEX(1, 0)] = model[6]  + tilebase; // center tile
            tilemap[tilemapOffset + TILEMAP_INDEX(0, 1)] = model[9]  + tilebase; // bottom center tile (0, 0)
            tilemap[tilemapOffset + TILEMAP_INDEX(1, 1)] = model[10] + tilebase; // bottom center tile (1, 0)
        }

        tilemap[TILEMAP_INDEX(x,    iy+0)] = model[8]  + tilebase; // left center tile
        tilemap[TILEMAP_INDEX(xMax, iy+0)] = model[7]  + tilebase; // right center tile 0
        tilemap[TILEMAP_INDEX(x,    iy+1)] = model[8]  + tilebase; // left center tile
        tilemap[TILEMAP_INDEX(xMax, iy+1)] = model[11] + tilebase; // right center tile 1
    }

    for (ix = x + 1; ix < xMax; ix += 2)
    {
        tilemap[TILEMAP_INDEX(ix+0, y)]    = model[2]  + tilebase; // top center tile
        tilemap[TILEMAP_INDEX(ix+1, y)]    = model[2]  + tilebase; // top centertile
        tilemap[TILEMAP_INDEX(ix+0, yMax)] = model[13] + tilebase; // bottom center tile (0, 1)
        tilemap[TILEMAP_INDEX(ix+1, yMax)] = model[14] + tilebase; // bottom center tile (1, 1)
    }

    tilemap[TILEMAP_INDEX(x+0, y+0)] = model[0] + tilebase; // top left tile (0, 0)
    tilemap[TILEMAP_INDEX(x+1, y+0)] = model[1] + tilebase; // top left tile (1, 0)
    tilemap[TILEMAP_INDEX(x+0, y+1)] = model[4] + tilebase; // top left tile (0, 1)
    tilemap[TILEMAP_INDEX(x+1, y+1)] = model[5] + tilebase; // top left tile (1, 1)

    tilemap[TILEMAP_INDEX(xMax, y)] = model[3] + tilebase; // top right tile

    tilemap[TILEMAP_INDEX(x, yMax)] = model[12] + tilebase; // bottom left tile

    tilemap[TILEMAP_INDEX(xMax, yMax)] = model[15] + tilebase; // bottom right tile
}
