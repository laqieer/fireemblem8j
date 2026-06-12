#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern const u8 gMapanimEventcall_7[];

//! FE8U = 0x080805AC
void MapanimEventcall_SummonFadeFramePal(int idxA, int idxB, int val)
{
    s32 i;

    const u16 * src = gMapanimEventcall_17[idxA].pal;
    u16 * dst = PAL_BG(gMapanimEventcall_7[idxB]);

    for (i = 0; i < 16; i++)
    {
        u16 r;
        u16 g;
        u16 b;
        u16 color = src[i];

        r = RED_VALUE(color);
        r += (31 - r) * val / 32;

        g = GREEN_VALUE(color);
        g += (31 - g) * val / 32;

        b = BLUE_VALUE(color);
        b += (31 - b) * val / 32;

        dst[i] = RGB(r, g, b);
    }

    EnablePaletteSync();

    return;
}
