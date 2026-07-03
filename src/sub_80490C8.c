#include "global.h"
#include "ctc.h"

int Div(int value, int base);
int DivRem(int value, int base);

extern const u16 gObj_80490C8_a[];
extern const u16 gObj_80490C8_b[];

// JP play-time clock sprite draw. frameTotal -> H:M:S formatted, capped, drawn
// as digit sprites.
void sub_80490C8(u32 frameTotal)
{
    u16 a;
    u16 b;
    u16 c;

    FormatTime(frameTotal, &a, &b, &c);

    if (a > 99)
    {
        a = 99;
        c = 59;
        b = 59;
    }

    PutSprite(4, 0xd8, 0x90, gObj_80490C8_a, DivRem(c, 10));
    PutSprite(4, 0xd0, 0x90, gObj_80490C8_a, Div(c, 10));
    PutSprite(4, 0xc8, 0x90, gObj_80490C8_a, 10);

    PutSprite(4, 0xc0, 0x88, gObj_80490C8_b, DivRem(b, 10));
    PutSprite(4, 0xb8, 0x88, gObj_80490C8_b, Div(b, 10));
    PutSprite(4, 0xb0, 0x88, gObj_80490C8_b, 10);

    PutSprite(4, 0xa8, 0x88, gObj_80490C8_b, DivRem(a, 10));
    if (Div(a, 10) > 0)
    {
        PutSprite(4, 0xa0, 0x88, gObj_80490C8_b, Div(a, 10));
    }
}
