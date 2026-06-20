#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmfx.h"
#include "gba_sprites.h"
#include "ctc.h"
#include "ekrbattle.h"
#include "variables.h"
#include "functions.h"
ProcPtr StartMuralBackgroundAlt(ProcPtr parent, void * vram, int pal, int flag) {
    int f = (s8)flag;
    int tileref;
    int i;
    u16 * tm = gBG3TilemapBuffer;
    if (vram == 0) {
        vram = ((void *)VRAM) + GetBackgroundTileDataOffset(3);
    }
    if (pal < 0) {
        pal = 0xe;
    }
    if (f != 0) {
        ApplyPalettes(Pal_CommGameBgScreenInShop, pal, 2);
    } else {
        ApplyPalettes(Pal_CommGameBgScreenInShop, pal, 2);
    }
    Decompress(Img_CommGameBgScreen, vram);
    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + OAM2_PAL(pal);
    for (i = 0; i < 0x280; i++) {
        *tm++ = i + tileref;
    }
    return Proc_Start(ProcScr_SlidingWallBg, parent);
}
