#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "hardware.h"
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

//! FE8U = 0x0807FF28
void MapAnimTorch_Init(struct MAEffectProc * proc)
{
    PlaySoundEffect(SONG_B3);

    Decompress(Img_MapAnimTorchfx, ((void *) VRAM) + 0x10000 + OBCHR_MANIM_1C0 * CHR_SIZE);
    ApplyPalette(Pal_MapAnimTorchfx, 0x10 + OBJPAL_MANIM_4);

    SetWhitePal(BGPAL_MANIM_4);
    Memset16(
        ((void *) VRAM) + GetBackgroundTileDataOffset(BG_2) + BGCHR_MANIM_140 * CHR_SIZE,
        CHR_SIZE / sizeof(u16),
        0xFFFF);

    Memset16(
        gBG2TilemapBuffer,
        ARRAY_COUNT(gBG2TilemapBuffer),
        TILEREF(BGCHR_MANIM_140, BGPAL_MANIM_4));

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    proc->frame = 0;
    proc->timer = 0;

    APProc_Create(
        ApConf_MapAnimTorchfx,
        proc->xDisplay + 4,
        proc->yDisplay,
        OAM2_CHR(OBCHR_MANIM_1C0) + OAM2_PAL(OBJPAL_MANIM_4), 0, 2);
    InitScanline();
    SetupMapAnimScanlineWindow();
    SetDefaultMapAnimScreenConf();

    SetBlendAlpha(0, 0x10);
}
