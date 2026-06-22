#include "global.h"
#include "agb_sram.h"

void ReadSramFast_Core(const u8 *src, u8 *dest, u32 size)
{
    REG_WAITCNT = (REG_WAITCNT & ~3) | 3;
    while (--size != -1)
        *dest++ = *src++;
}
