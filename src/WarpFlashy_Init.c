#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmitem.h"
#include "bmmind.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "ap.h"
#include "eventinfo.h"
#include "efxbattle.h"
#include "constants/items.h"
#include "constants/video-global.h"
#include "constants/songs.h"

void WarpFlashy_Init(struct MAEffectProc * proc)
{
    BG_SetPosition(BG_2, 0, 0);

    Decompress(Img_LinkArenaWarpFx, ((void *) VRAM) + GetBackgroundTileDataOffset(2) + CHR_SIZE * BGCHR_MANIM_140);
    ApplyPalette(Pal_LinkArenaWarpFx, BGPAL_MANIM_4);

    LoadSparkGfx();

    proc->frame = 0;
}
