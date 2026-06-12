#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_RegisterBgPal(const u16 * pal, u32 size)
{
    CpuFastCopy(pal, PAL_BG(OBJPAL_BANIM_SPELL_BG), size);
    EnablePaletteSync();
}
