#include "global.h"
#include "hardware.h"
#include "bmfx.h"
#include "soundwrapper.h"
#include "bmlib.h"
#include "variables.h"
#include "constants/songs.h"
#include "constants/video-global.h"

void ProcLightRuneAnim_Init(struct ProcBmFx *proc)
{
    int i;

    Decompress(Img_LightRune, BG_CHR_ADDR(BGCHR_BMFX_IMG));
    ApplyPalette(Pal_LightRune, BGPAL_LIGHTRUNE_IMG);
    Decompress(Tsa_LightRune, gUiTmScratchA);

    for (i = 0; i < 0x360; i++)
        gUiTmScratchA[i] += TILEREF(BGCHR_BMFX_IMG, BGPAL_LIGHTRUNE_IMG);

    BG_Fill(gBG0TilemapBuffer, TILEREF(BGCHR_BMFX_IMG, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    PlaySoundEffect(SONG_2D8);

    SetBlendConfig(0x1, 0x10, 0x10, 0x0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);

    proc->counter = 0;
}
