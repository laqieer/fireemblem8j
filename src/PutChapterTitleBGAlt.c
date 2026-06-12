#include "global.h"
#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern u8 gUnkData_47[];

void PutChapterTitleBGAlt(int chr)
{
    gChapterTitleFxSt.chr_bg = chr & 0x3FF;
    Decompress(gUnkData_47, (void*)((chr * TILE_SIZE_4BPP) + VRAM));
}
