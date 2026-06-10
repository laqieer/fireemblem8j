#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x08082764
void PrepareFeatheredBandScanlineBuf(int arg_1) {
    int i;
    int r4;
    int ip;

    arg_1 = (arg_1 > 0x70) ? 0x70 : arg_1;

    r4 = 0x50 - arg_1;
    ip = arg_1 + 0x50;

    for (i = 0; i < r4; i++) {
        gManimScanlineBufs[1][i] = 0x1000;
    }

    for (i = ip; i < 0xa0; i++) {
        gManimScanlineBufs[1][i] = 0x1000;
    }

    for (i = r4; i < 0x50 && i < r4 + 0x20; i++) {
        gManimScanlineBufs[1][i] = (0x10 - ((i - r4) >> 1)) * 0x100 | ((i - r4) >> 1);
    }

    for (i = ip - 1; i >= 0x50 && i >= ip - 0x20; i--) {
        gManimScanlineBufs[1][i] = (0x10 - ((ip - i) >> 1)) * 0x100 | ((ip - i) >> 1);
    }

    for (i = r4 + 0x20; i < ip - 0x20; i++) {
        gManimScanlineBufs[1][i] = 0x10;
    }

    SwapScanlineBufs();

    return;
}
