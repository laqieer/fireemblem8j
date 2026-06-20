#include "global.h"
#include "face.h"
#include "hardware.h"
#include "worldmap.h"

//! FE8U = 0x080B82C8
void PutWMFaceOnBg(int bg, u32 offset, int xIn, int yIn, s8 flip)
{
    int f = flip;
    int bgX;
    u16* r0;
    int x;
    int y;
    int y_;

    x = GetWMFaceTileXAndScroll(xIn, &bgX);
    y = yIn / 8;
    y_ = (y * 8) - yIn;

    r0 = BG_GetMapBuffer(bg) + y * 0x20 + x;

    PutFaceOnBackGround(
        r0,
        (offset >> 5) + 0x4000,
        f
    );

    BG_EnableSyncByMask(1 << (bg));

    BG_SetPosition(bg, bgX, y_);
}
