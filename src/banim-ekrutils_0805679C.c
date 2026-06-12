#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_RegisterObjPal(const u16 * pal, u32 size)
{
    CpuFastCopy(pal, PAL_OBJ(OBJPAL_BANIM_SPELL_OBJ), size);
    EnablePaletteSync();
}
