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

void MapAnimEffectAnimator_Init(struct ProcMapAnimator * proc)
{
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    BG_SetPosition(BG_2, 0, 0);

    Decompress(proc->img, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_140);

    PutTmRectSequential(
        gBG2TilemapBuffer,
        SCREEN_TILE_X(proc->unit->xPos) * 2 - 2,
        SCREEN_TILE_Y(proc->unit->yPos) * 2 - 2,
        TILEREF(BGCHR_MANIM_140, BGPAL_MANIM_4), 6, 6);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    StartPaletteAnimatorNormal(proc->pal, BGPAL_MANIM_4 * 0x20, 0x20, 4, proc);

    proc->ca = 0;
    proc->cb = 0x10;

    PlaySeSpacial(proc->song, (SCREEN_TILE_X(proc->unit->xPos) * 2 + 1) * 8);
}
