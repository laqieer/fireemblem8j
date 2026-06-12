#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

struct MuralBackgroundProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 offset;
};

//! FE8U = 0x08086CE8
ProcPtr StartMuralBackgroundExt(ProcPtr parent, void* vram, int a, int b, int palOffset) {
    int i;
    int tileref;

    u16 * tm = gBG3TilemapBuffer;

    if (vram == 0) {
        vram = ((void*) VRAM) + GetBackgroundTileDataOffset(3);
    }

    ApplyPalettes(Pal_CommGameBgScreenInShop + palOffset * 0x10, 0xE, 2);

    Decompress(Img_CommGameBgScreen, vram);

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + OAM2_PAL(0xe);

    for (i = 0; i < a * 0x20; i++) {
        *tm++ = i + tileref;
    }

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + OAM2_PAL(0xf);

    for (; i < (a + b) * 0x20; i++) {
        *tm++ = i + tileref;
    }

    tileref = ((((uintptr_t)(vram - GetBackgroundTileDataOffset(3))) / CHR_SIZE) & 0xFFF) + OAM2_PAL(0xe);

    for (; i < 0x280; i++) {
        *tm++ = i + tileref;
    }

    return Proc_Start(ProcScr_SlidingWallBg, parent);
}
