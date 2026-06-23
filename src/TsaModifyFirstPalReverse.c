#include "global.h"
#include "hardware.h"
#include "opanim.h"

void TsaModifyFirstPalReverse(s16 end, s16 start, s16 offset, u16 bg, u16 * src1, u16 * src2, s8 flag)
{
    u16 * src;
    u16 * dst;
    int i;

    dst = BG_GetMapBuffer(bg);

    if (start == 0)
        start -= 8;

    end = end + offset;
    start = start + offset;

    if (src2 != 0)
    {
        end = 0x200 - end;
        start = 0x200 - start;
    }
    else
    {
        end = 0x100 - end;
        start = 0x100 - start;
    }

    for (i = (start >> 3) - 1; i > (end >> 3) - 1; i--)
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

        if (src == 0)
            break;

        if (flag == 0)
            CopyFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f));
        else
            SetFirstPalDirectly(src + (i & 0x1f), dst + (i & 0x1f), 0xf);
    }

    BG_SetPosition(bg, end, 0);

    return;
}
