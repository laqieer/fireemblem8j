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

void AntitoxinPureWaterfx_Init(struct MAEffectProc * proc)
{
    PlaySeSpacial(SONG_B6, proc->xDisplay);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;

    BG_SetPosition(BG_2, 0, 0);

    Decompress(
        proc->img,
        (void*)(VRAM) + GetBackgroundTileDataOffset(2) + 0x140 /* JP BGCHR (US BM_BGCHR_BANIM_UNK160=0x160) */ * 0x20);

    ApplyPalette(
        proc->pal,
        BM_BGPAL_BANIM_UNK4);

    SetDefaultMapAnimScreenConf();
    SetBlendConfig(1, 0x10, 0x10, 0);

    proc->frame = 0;
}
