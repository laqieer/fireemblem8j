#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



//! FE8U = 0x08065D84
void PrepareSomeIvaldiParticleGraphics(void)
{
    SpellFx_RegisterObjPal(Img_IvaldiSprites, PLTT_SIZE_4BPP);
    SpellFx_RegisterObjGfx(Pal_IvaldiSprites, 32 * 4 * CHR_SIZE);
    return;
}
