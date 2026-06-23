#include "global.h"
#include "hardware.h"
#include "chap_title.h"
#include "chapterdata.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"

// JP-specific compressed TSA for the full-width chapter title string
extern const u8 gChapterTitleStrTsa_jp[]; // 0x08A92410

void DrawChapterTitleStrEx_jp(u16 * tm, int pal, int c)
{
    int i;
    int tile = TILEREF(gChapterTitleFxSt.chr_str, pal);

    if (chap_title_data[c].null_1 != 0)
    {
        Decompress(gChapterTitleStrTsa_jp, gGenericBuffer);
        CallARM_FillTileRect(gBG0TilemapBuffer, gGenericBuffer, (u16)TILEREF(0x280, pal));
        BG_SetPosition(0, 0, 2);
    }
    else
    {
        for (i = 0; i < 0x40; i++)
            *tm++ = tile++;
    }
}
