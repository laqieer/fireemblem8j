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


void MapAnimUnlock_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_8D, proc->xDisplay);

    BG_SetPosition(BG_2, 0, 0);
    Decompress(Img_MapAnimUnlockBgfx, ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + CHR_SIZE * BGCHR_MANIM_140);

    PutTmAnimFrameFromTsa(
        gBG2TilemapBuffer,
        proc->xDisplay / 8 - 2, proc->yDisplay / 8 - 2,
        TILEREF(BGCHR_MANIM_140, BGPAL_MANIM_4),
        4, 4, Tsa_MapAnimUnlockBgfx, 0);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    Decompress(Img_MapAnimUnlockObjfx, ((void *) VRAM) + 0x10000 + CHR_SIZE * OBCHR_MANIM_1C0);
    ApplyPalette(Pal_MapAnimUnlockObjfx, 0x10 + OBJPAL_MANIM_4);

    StartPaletteAnimatorReverse(Pal_MapAnimUnlockObjfx_Unk, 0x20 * BGPAL_MANIM_4, 0x20, 4, proc);

    InitScanline();
    SetupMapAnimScanlineWindow();
    SetDefaultMapAnimScreenConf();

    SetBlendAlpha(0x10, 0x10);

    proc->unk48 = 1;
}
