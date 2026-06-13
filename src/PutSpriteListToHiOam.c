#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

struct UnknownDmaStruct2
{
    int attr01;
    u16 attr2;
    s16 x;
    s16 y;
};

void PutSpriteListToHiOam(struct UnknownDmaStruct2 *a, int _x, int _y)
{
    while (a->attr01 != 1 && gOamHiPutIt < (u32 *)(gOam + 0x80))
    {
        int x = OBJ_X(a->x + _x);
        int y = OBJ_Y(a->y + _y);

        *(u32 *)gOamHiPutIt++ = a->attr01 | (x << 16) | (y);
        *(u16 *)gOamHiPutIt++ = a->attr2;
        a++;
    }
}
