#include "global.h"
#include "ctc.h"

extern const u16 Sprite_80356C8_A[];
extern const u16 Sprite_80356C8_B[];
extern const u16 Sprite_80356C8_C[];

void sub_80356C8(int y)
{
    const u16 *spr;
    int count = 0;
    int oamBase;
    u8 *g = (u8 *)&gPlaySt;

    if (g[0x42] << 26 < 0)
        count = 5;

    spr = Sprite_80356C8_A;
    oamBase = count << 12;

    PutSprite(2, 0x38, y, spr, oamBase + 0x280);
    PutSprite(2, 0x58, y, spr, oamBase + 0x284);
    PutSprite(2, 0x78, y, spr, oamBase + 0x288);
    PutSprite(2, 0x98, y, Sprite_80356C8_B, oamBase + 0x28C);
    PutSprite(2, 0xa8, y, Sprite_80356C8_C, oamBase + 0x28E);

    if (g[0x42] << 26 >= 0)
    {
        PutSprite(2, 0xb0, y, Sprite_80356C8_B, oamBase + 0x28F);
    }
    else
    {
        PutSprite(2, 0xb0, y, Sprite_80356C8_B, oamBase + 0x292);
        PutSprite(2, 0xc0, y, Sprite_80356C8_C, oamBase + 0x294);
    }

    return;
}
