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

void InitBaseTilesBmMap(void) {
    int ix, iy;

    u16** rows;
    u16*  tiles;
    u16*  itBuffer;

    rows  = gBmMapBaseTiles;
    tiles = gBmMapBuffer;

    gBmMapSize.y++; // ?

    // Ignore first short (x, y byte pair)
    tiles++;

    // Tile buffer starts after the rows
    itBuffer = (u16*)(gBmMapBaseTiles + gBmMapSize.y);

    for (iy = 0; iy < gBmMapSize.y; ++iy) {
        // Set row buffer
        rows[iy] = itBuffer;
        itBuffer += gBmMapSize.x;

        // Set tiles
        for (ix = 0; ix < gBmMapSize.x; ++ix)
            gBmMapBaseTiles[iy][ix] = *tiles++;
    }

    // Fill "bottom" row with empty tiles?
    // "bottom" as the y had been increased too this is just weird

    tiles = gBmMapBaseTiles[iy - 1];

    for (ix = 0; ix < gBmMapSize.x; ++ix)
        *tiles++ = 0;

    gBmMapSize.y--; // ?
}
