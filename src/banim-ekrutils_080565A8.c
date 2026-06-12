#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

void SpellFx_WriteBgMapRaw(struct Anim * anim, const u16 * src1, const u16 * src2)
{
    const u16 * buf;

    if (gEkrDistanceType == EKR_DISTANCE_CLOSE)
        buf = src1;
    else
        buf = src2;

    if (GetAnimPosition(anim) == EKR_POS_L)
        EfxTmCpyBgHFlip(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);
    else
        EfxTmCpyBG(buf, gBG1TilemapBuffer, 30, 20, OBJPAL_BANIM_SPELL_BG, 0x100);

    BG_EnableSyncByMask(BG1_SYNC_BIT);
}
