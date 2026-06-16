#include "global.h"
#include "hardware.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "anime.h"

extern const u16 Pal_DemonLightSprites_EyeFlash[];
extern const u16 Img_DemonLightSprites_EyeFlash[];

void efxMaohFlash_RegisterEyeFlashGfx(void)
{
    SpellFx_RegisterObjPal(Pal_DemonLightSprites_EyeFlash, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Img_DemonLightSprites_EyeFlash, 32 * 4 * CHR_SIZE);

    return;
}
