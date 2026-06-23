#include "global.h"

#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"

extern const u8 gChapterTitleGfxFrame[]; // 0x08A8BFA4 (JP-specific compressed frame gfx)

void _PutChapterTitleGfx(int chr, int titleId)
{
    if (chap_title_data[titleId].null_1 != 0)
    {
        Decompress(gChapterTitleGfxFrame, (void *)(VRAM + chr * TILE_SIZE_4BPP));
        Decompress(chap_title_data[titleId].null_1, (void *)(VRAM + chr * TILE_SIZE_4BPP + 0x20));
        Decompress(chap_title_data[titleId].null_2, (void *)(VRAM + chr * TILE_SIZE_4BPP + 0x2A0));
    }
    else
    {
        PutChapterTitleGfx(chr, titleId);
    }
}
