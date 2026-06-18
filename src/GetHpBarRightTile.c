#include "global.h"
#include "hardware.h"
void GetHpBarRightTile(u16 * buffer, s16 hpArg, int tileBase)
{
    int hp = hpArg;
    int base;
    if (hp >= 5) hp = 5;
    if (hp < 0) hp = 0;
    base = tileBase + 15;
    *buffer = hp + base;
}
