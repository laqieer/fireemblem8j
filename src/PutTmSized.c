#include "global.h"

#include "bmlib.h"

//! FE8U = 0x080148C4
void PutTmSized(u16 * tm, int x, int y, u32 const * arg_3, u16 tileref)
{
    s16 iy, ix;

    u16 const * r2 = ((u16 const *) arg_3) + 1;

    s16 r9 = 0xFF & (((u32 const *) arg_3)[0] >> 0);
    s16 r3 = 0xFF & (((u32 const *) arg_3)[0] >> 8);

    for (iy = r3; iy >= 0; --iy)
    {
        if ((y + iy >= 0 && y + iy < 0x20))
        {
            u16 * r1 = x + (y + iy) * 32 + tm;

            for (ix = r9; ix >= 0; --ix, r2++, r1++)
            {
                if (x+ix >= 0 && x+ix < 0x20)
                    *(r1) = *r2 + tileref;
            }
        }
    }
}
