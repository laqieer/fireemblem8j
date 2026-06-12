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
/* TU-private data externs bound at their JP addresses */
extern const int gMapanimEventcall_6[];
extern const u8 gMapanimEventcall_7[];

// clang-format on

//! FE8U = 0x08080498
void MapanimEventcall_SummonLoadFrameAndPal(int frame, int unk44)
{
    Decompress(gMapanimEventcall_17[frame].img, (void *)(VRAM + gMapanimEventcall_6[unk44] * 0x20));
    Decompress(gMapanimEventcall_17[frame].tsa, gGenericBuffer);
    AddAttr2dBitMap(
        gBG2TilemapBuffer, (u16 *)gGenericBuffer, 0, 0, gMapanimEventcall_6[unk44] | gMapanimEventcall_7[unk44] << 12);

    BG_EnableSyncByMask(BG2_SYNC_BIT);

    ApplyPalette(gMapanimEventcall_17[frame].pal, gMapanimEventcall_7[unk44]);
    EnablePaletteSync();

    return;
}
