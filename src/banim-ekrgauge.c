

#include "gbafe.h"

void EkrGauge_BuildHpBarGfx(void *_src, void *_dst)
{
    u16 *src = _src;
    u16 *dst = _dst;
    u32 i, val;

    for (i = 0; i < 11; i++) {
        u32 val = *src == 0xFF ? 0xF : *src;
        CpuFastCopy(&PAL_BUF_COLOR(gBanimmisc_9, val, 0), &PAL_BUF_COLOR(dst, i, 0), 0x10 * sizeof(u16));
        src++;
    }

    CpuFastFill(0, &PAL_BUF_COLOR(dst, 0xC, 0), 0x10 * sizeof(u16));
}
