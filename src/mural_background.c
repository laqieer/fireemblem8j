#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

struct MuralBackgroundProc {
    /* 00 */ PROC_HEADER;

    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 offset;
};

//! FE8U = 0x08086B7C
void BackgroundSlide_Loop(struct MuralBackgroundProc* proc) {
    proc->offset++;
    BG_SetPosition(3, proc->offset / 4, 0);
    REG_BG3HOFS = proc->offset / 4;
    return;
}

//! FE8U = 0x08086BB8
ProcPtr StartMuralBackground(ProcPtr parent, void* vram, int pal) {
    int tileref;
    int i;

    u16 * tm = gBG3TilemapBuffer;

    if (vram == NULL) {
        vram = ((void*) VRAM) + GetBackgroundTileDataOffset(3);
    }

    if (pal < 0) {
        pal = 0xe;
    }

    if (gBmSt.gameStateBits & BM_FLAG_LINKARENA) {
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
