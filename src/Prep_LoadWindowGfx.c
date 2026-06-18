#include "global.h"
#include "bmlib.h"
#include "hardware.h"
#include "prepscreen.h"

extern u16 Pal_PrepWindowA[];
extern u16 Pal_PrepWindowB[];
extern u16 Pal_PrepWindowC[];
extern u16 Pal_PrepWindowD[];
extern u8 Img_PrepWindow[];

void Prep_LoadWindowGfx(int vram, int palId)
{
    u16 * palettes[4] =
    {
        Pal_PrepWindowA,
        Pal_PrepWindowB,
        Pal_PrepWindowC,
        Pal_PrepWindowD,
    };

    Decompress(Img_PrepWindow, (void *)(vram + VRAM));
    ApplyPalette(palettes[gPlaySt.config.windowColor], palId);

    return;
}
