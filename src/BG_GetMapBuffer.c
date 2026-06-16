#include "global.h"
#include "hardware.h"

extern u16 *sBgTilemapBuffers[];

u16* BG_GetMapBuffer(int bg)
{
    return sBgTilemapBuffers[bg];
}
