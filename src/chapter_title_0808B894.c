#include "global.h"

#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"

extern EWRAM_DATA struct ChapterTitleFxSt gChapterTitleFxSt;

void PutChapterTitleGfx(int chr, u32 titleId)
{
    if (titleId > 0x108)
        titleId = 0x54;

    gChapterTitleFxSt.chr_str = chr & 0x3FF;
    Decompress(chap_title_data[titleId].save, (void*)((chr * TILE_SIZE_4BPP) + VRAM));
}
