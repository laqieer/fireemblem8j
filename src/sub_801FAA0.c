#include "global.h"
#include "hardware.h"
#include "bmlib.h"

extern const u8 gUnknown_08A7AE50[];
extern u16 gUnknown_02001F72[];

void sub_801FAA0(void)
{
    register u16 *dstBase asm("ip");
    register int srcBase asm("r8");
    u16 *src;
    u16 *dst;
    int row;
    int col;
    register int i asm("r6");
    int idx;
    int j;

    i = 0;
    BG_Fill(gBG2TilemapBuffer, 0);
    Decompress(gUnknown_08A7AE50, gUnknown_02001F72);

    row = 0;
    dstBase = gBG2TilemapBuffer;
    srcBase = (int)gUnknown_02001F72;
    do
    {
        col = 0;
        j = row + 1;
        idx = j * 32 + 3;
        src = (u16 *)(i * 2 + srcBase);
        dst = dstBase + idx;
        do
        {
            *dst = 0x5001 + *src;
            src++;
            i++;
            dst++;
            col++;
        } while (col <= 23);
        row = j;
    } while (row <= 17);
}
