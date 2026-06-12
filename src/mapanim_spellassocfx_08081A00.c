#include "global.h"
#include "mu.h"
#include "proc.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "ap.h"
#include "ctc.h"
#include "bmio.h"
#include "rng.h"
#include "bmlib.h"
#include "mapanim.h"
#include "bm.h"




extern CONST_DATA struct ProcCmd ProcScr_MapAnimStartSpellAssocFade[];

void LoadSparkGfx(void)
{
    Decompress(
        Img_MapAnimBerserkfx_1,
        OBJ_VRAM0 + BM_OBJCHR_BANIM_EFFECT2 * 0x20);

    ApplyPalette(Pal_MapAnimBerserkfx_0, 0x10 + BM_OBJPAL_BANIM_EFFECT2);
}
