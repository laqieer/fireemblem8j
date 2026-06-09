#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void EfxCyclePaletteRaw(const u16 * src, u16 * dst, u32 cur, u32 len_src, u32 len_dst)
{
    u32 i;
    for (i = 0; i < len_dst; i++, cur++) {
        if (cur >= len_src)
            cur = 0;

        dst[i] = src[cur];
    }
}
