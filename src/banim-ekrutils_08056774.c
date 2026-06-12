#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_RegisterObjGfx(const u16 * img, u32 size)
{
    u16 * dst = OBJ_VRAM0 + VRAMOFF_BANIM_SPELL_OBJ;
    LZ77UnCompWram(img, gBuf_Banim);
    RegisterDataMove(gBuf_Banim, dst, size);
}
