#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u16 gWorldmapSkirmish_2[];
extern u16 gWorldmapSkirmish_3[];

//! FE8U = 0x080C3A28
void WmMinimap_BlinkPalette(struct GMapRadarProc * proc)
{
    int colorIdx = GM_CURSOR->unk_34;

    u16 * pal = PAL_OBJ(9);

    pal[9] = *(gWorldmapSkirmish_2 + colorIdx);
    pal[7] = *(gWorldmapSkirmish_3 + colorIdx);

    EnablePaletteSync();

    return;
}
