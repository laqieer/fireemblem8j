#include "global.h"
#include "bmlib.h"

void Decompress(const void* src, void* dst)
{
    typedef void (* DecompressFunc)(const void *src, void *dst);

    static CONST_DATA DecompressFunc func_lut[] = {
        UnpackRaw,      // 00, vram
        UnpackRaw,      // 00, wram
        LZ77UnCompVram, // 10, vram
        LZ77UnCompWram, // 10, wram
        HuffUnComp,     // 20, vram
        HuffUnComp,     // 20, wram
        RLUnCompVram,   // 30, vram
        RLUnCompWram,   // 30, wram
    };

    int is_wram;
    const struct TileMapArr *tsa = src;

    if ((((u32) dst) - VRAM) < VRAM_SIZE)
        is_wram = FALSE; // is vram
    else
        is_wram = TRUE;

    func_lut[is_wram + ((tsa->type & 0xF0) >> 3)](src, dst);
}
