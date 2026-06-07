#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"







void EfxMagicHBlank_0(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1HOFS = *gpBg1ScrollOffset++;
}

void EfxMagicHBlank_1(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK))
        REG_BG1VOFS = *gpBg1ScrollOffset++;
}

void EfxMagicHBlank_2(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
        REG_BG1HOFS = *gpBg1ScrollOffset++;
    }
}

void EfxMagicHBlank_3(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
        REG_BG1VOFS = *gpBg1ScrollOffset++;
    }
}

void EfxMagicHBlank_4(void)
{
    if (!(REG_DISPSTAT & DISPSTAT_VBLANK)) {
        REG_BG2VOFS = *gpBg2ScrollOffset++;
    }
}
