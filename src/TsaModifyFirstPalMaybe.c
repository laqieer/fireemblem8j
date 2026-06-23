#include "global.h"
#include "hardware.h"
#include "opanim.h"

void TsaModifyFirstPalMaybe(s16 end, s16 start, s16 unused, u16 bg, u16 * src1, u16 * src2, s8 flag)
{
    u16 * dst;
    u16 * src;
    int i;

    dst = BG_GetMapBuffer(bg);

    if (start == 0)
        start -= 8;

    for (i = (start >> 3) + 1; i < (end >> 3) + 1; i++)
    {
        if ((i < 0 || i >= 0x40) || (i >= 0x20 && src2 == 0))
        {
            ClearFirstPalDirectly(dst + (i & 0x1f));
            continue;
        }

        if (i < 0x20)
            src = src1;
        else
            src = src2;

        if (flag == 0)
            CopyFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f));
        else
            SetFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f), 0xf);
    }
    BG_SetPosition(bg, end + 0x10, 0);
}
