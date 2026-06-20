#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/items.h"

void EfxCalcSplitedColorStep(s8 * src1, s8 * src2, u16 * pal, u32 length, int ref)
{
    u32 i;
    s16 c1, c2, c;

    for (i = 0; i < length; i++)
    {
        c1 = *src2;
        c2 = *src1;
        c = (c1 - c2) * 0x100;
        src1++, src2++;
        *pal++ = Div(c, ref);

        c1 = *src2;
        c2 = *src1;
        c = (c1 - c2) * 0x100;
        src1++, src2++;
        *pal++ = Div(c, ref);

        c1 = *src2;
        c2 = *src1;
        c = (c1 - c2) * 0x100;
        src1++, src2++;
        *pal++ = Div(c, ref);
    }
}
