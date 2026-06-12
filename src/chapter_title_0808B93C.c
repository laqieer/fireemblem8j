#include "global.h"

#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"

extern EWRAM_DATA struct ChapterTitleFxSt gChapterTitleFxSt;

void PutChapterTitleBG(int chr)
{
    gChapterTitleFxSt.chr_bg = chr & 0x3FF;
    Decompress(gGfx_UnkData_0, (void*)((chr * TILE_SIZE_4BPP) + VRAM));
}
