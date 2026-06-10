#include "global.h"
#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"

void DrawChapterTitleStrEx(u16 * tm, int pal, int c)
{
    int i;
    int tile = TILEREF(gChapterTitleFxSt.chr_str, pal);
    for (i = 0; i < 0x40; i++)
        *tm++ = tile++;
}
