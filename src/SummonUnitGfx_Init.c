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
#include "bmudisp.h"
#include "bmmap.h"
#include "constants/songs.h"

//! FE8U = 0x08080EE4
void SummonUnitGfx_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();

    BG_SetPosition(BG_2, 0, 0);

    Decompress(Img_GorgonHatchCloud, (void *)(0x06002800 + GetBackgroundTileDataOffset(BG_2)));
    ApplyPalette(Pal_GorgonHatchCloud, 4);
    SetBlendAlpha(16, 16);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();

    return;
}
