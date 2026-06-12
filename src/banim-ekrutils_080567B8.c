#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_RegisterBgGfx(const u16 * img, u32 size)
{
    u16 *dst = (void *)BG_VRAM + VRAMOFF_BANIM_SPELL_BG;
    LZ77UnCompWram(img, gSpellAnimBgfx);
    RegisterDataMove(gSpellAnimBgfx, dst, size);
}
