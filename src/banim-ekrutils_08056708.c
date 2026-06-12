#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_WriteBgMapExt(struct Anim * anim, const u16 * src, int width, int height)
{
    LZ77UnCompWram(src, gEkrTsaBuffer);

    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(gEkrTsaBuffer, gBG1TilemapBuffer, width, height, OBJPAL_BANIM_SPELL_BG, 0x100);
    else
        EfxTmCpyBG(gEkrTsaBuffer, gBG1TilemapBuffer, width, height, OBJPAL_BANIM_SPELL_BG, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}
