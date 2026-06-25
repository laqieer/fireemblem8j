#include "global.h"
#include "functions.h"
#include "variables.h"
#include "constants/video-global.h"
#include "proc.h"
#include "hardware.h"
#include "bmfx.h"
#include "bmlib.h"

/* JP-specific sparkle/dance-anim Init (gbadisasm sub_8021AFC).
 * Structurally the ProcDanceAnim_Init idiom but with a JP-larger
 * scratch-tilemap rebase loop (0x360 vs 0x240) and its own asset
 * pointers (bound below as raw ROM data aliases). */

extern const u8 Img_sub_8021AFC[];
extern const u16 Pal_sub_8021AFC[];
extern const u8 Tsa_sub_8021AFC[];

void sub_8021AFC(struct ProcBmFx *proc)
{
    int i;

    Decompress(Img_sub_8021AFC, BG_CHR_ADDR(BGCHR_BMFX_IMG));
    ApplyPalette(Pal_sub_8021AFC, BGPAL_DANCERING_IMG);
    Decompress(Tsa_sub_8021AFC, gUiTmScratchA);

    for (i = 0; i < 0x360; i++)
        gUiTmScratchA[i] += TILEREF(BGCHR_BMFX_IMG, BGPAL_DANCERING_IMG);

    BG_Fill(gBG0TilemapBuffer, TILEREF(BGCHR_BMFX_IMG, 0));
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    SetBlendConfig(0x1, 0x10, 0x10, 0x0);
    SetBlendTargetA(1, 0, 0, 0, 0);
    SetBlendTargetB(0, 1, 1, 1, 1);
    proc->counter = 0;
}
