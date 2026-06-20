#include "global.h"
#include "hardware.h"
#include "event.h"
void BgChangeChr(int bg, int chr_chg) {
    int b = (u8)bg;
    int cc = (s8)chr_chg;
    u16 i;
    u16 * buf = BG_GetMapBuffer(b);
    for (i = 0; i < 0x400; i++) {
        int tmp = *buf;
        u8 a = (tmp >> 0xc);
        a += cc;
        *buf &= 0xfff;
        *buf |= ((a) << 0xc);
        buf++;
    }
    BG_EnableSyncByMask(1 << b);
}
