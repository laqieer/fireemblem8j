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

void MapAnimRepair_Init0(struct MAEffectProc * proc)
{
    BG_SetPosition(BG_2, 0, 0);
    SetDefaultMapAnimScreenConf();
    SetBlendAlpha(0x10, 0x10);
    Decompress(Img_MapAnimRepairfx, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_140);
    ApplyPalette(Pal_HammerneBg, BGPAL_MANIM_4);
    proc->unk48 = 0;
    proc->frame_idx = 0;
}
