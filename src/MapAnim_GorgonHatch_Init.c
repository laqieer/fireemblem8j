#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "mu.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmio.h"
#include "hardware.h"
#include "ap.h"
#include "bmmap.h"
#include "bmudisp.h"
#include "mapanim.h"
#include "bmlib.h"
#include "bmtrick.h"
#include "rng.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/songs.h"


//! FE8U = 0x0807CE18
void MapAnim_GorgonHatch_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(BG_2, 0, 0);

    // TODO: BM_BANIM_BGCHR_...
    Decompress(
        Img_NightMareMapAnimfx,
        (void *)(VRAM) + GetBackgroundTileDataOffset(BG_2) + 0x140 * CHR_SIZE);

    ApplyPalette(
        Pal_NightMareMapAnimfx,
        BM_BGPAL_BANIM_UNK4);

    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();
}