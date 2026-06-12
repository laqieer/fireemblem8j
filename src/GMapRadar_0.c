#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gUnk_17[];

//! FE8U = 0x080C3A8C
void GMapRadar_0(struct GMapRadarProc * unused)
{
    TileMap_FillRect(gUnk_17, 8, 8, 0);
    CallARM_FillTileRect(gUnk_17, gWorldmapSkirmish_1, 0x000071E0);
    return;
}
