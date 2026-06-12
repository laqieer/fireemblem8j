#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void EfxCyclePaletteHi(const u16 *src, u16 *dst, u32 a, u32 b, u32 c)
{
    u32 i;
    for (i = 0; i < c; i++, a++) {
        
        if (a >= b)
            a = 0;

        dst[i + 0x120] = src[a];
    }

    EnablePaletteSync();
}
