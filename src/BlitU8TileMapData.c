#include "global.h"
#include "hardware.h"

void BlitU8TileMapData(void* outTm, void const* inData, u8 base, u8 linebits)
{
    u8 const* it = (u8 const*) inData + 2;
    u8* out;

    u8 ySize = (*(u32 const*) inData) >> 8;
    s8 xSize = (s8)(*(u8 const*) inData);

    s8 ix, iy;

    for (iy = ySize; iy >= 0; iy--)
    {
        out = (u8*) outTm + (iy << linebits);

        for (ix = xSize; ix >= 0; ix--)
            *out++ = *it++ + base;
    }
}
