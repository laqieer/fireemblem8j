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

extern u8 gMapanimEventcall_293[];
extern u16 gMapanimEventcall_294[];

void MapAnimMonsterStone_Init(struct MAEffectProc * proc)
{
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(2, 0, 0);

    Decompress(
        gMapanimEventcall_293,
        (void*)(VRAM) + GetBackgroundTileDataOffset(BG_2) + 0x140 * CHR_SIZE);

    ApplyPalette(
        gMapanimEventcall_294,
        BGPAL_MANIM_4);

    SetBlendAlpha(0x10, 0x10);

    proc->frame = 0;
    proc->timer = 0;

    EnablePaletteSync();
}
