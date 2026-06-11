#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"
#include "worldmap.h"
#include "constants/worldmap.h"

//! FE8U = 0x080C2C80
void BlendWmDotPalette(int a, int b, const u16 * srcA, const u16 * srcB, u16 * dst)
{
    int i;

    int coeff = _DivArm1(a, b, 0);

    for (i = 0; i < 0x10; i++)
    {
        u16 color = srcA[i];

        int r1 = (color & 0x1f);
        int g1 = ((color & 0x3e0) >> 5);
        int b1 = ((color & 0x7c00) >> 10);

        u16 color2 = srcB[i];
        int r2 = r1 + DivArm(0x1000, coeff * ((color2 & 0x1f) - r1));
        int g2 = g1 + DivArm(0x1000, coeff * (((color2 & 0x3e0) >> 5) - g1));
        int b2 = b1 + DivArm(0x1000, coeff * (((color2 & 0x7c00) >> 10) - b1));

        dst[i] = (b2 << 10) + (g2 << 5) + r2;
    }

    EnablePaletteSync();

    return;
}
