#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "opanim.h"

void OpAnimHS_BrightenPalette(u16 * src, int palid, int line, int cur, int max)
{
    int i, len = line * 0x10;
    u16 * pal = PAL_BG(palid);

    if (cur < max)
    {
        for (i = 0; i < len; i++)
        {
            int color_base = src[i];

            int color_r = RED_VALUE(color_base) * cur / max;
            int color_g = GREEN_VALUE(color_base) * cur / max;
            int color_b = BLUE_VALUE(color_base) * cur / max;

            *pal++ = RGB(color_r, color_g, color_b);
        }
    }
    else
    {
        CpuFastCopy(src, pal, (len * 2));
    }
    EnablePaletteSync();
}
