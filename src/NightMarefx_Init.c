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

extern u8 Img_MonsterStoneMapAnimfx[];
extern u16 Pal_MonsterStoneMapAnimfx[];

void NightMarefx_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(2, 0, 0);

    Decompress(
        Img_MonsterStoneMapAnimfx,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + 0x140 * 0x20);

    ApplyPalette(
        Pal_MonsterStoneMapAnimfx,
        BM_BGPAL_BANIM_UNK4);

    SetBlendConfig(1, 0x10, 0x10, 0);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();
}
