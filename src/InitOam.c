#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void InitOam(int loSz)
{
    sOamLo.buf = gOam;
    sOamLo.oam = (void *) OAM;
    sOamLo.offset = 0;
    sOamLo.count = loSz;

    sOamHi.buf = gOam + loSz * 4;
    sOamHi.oam = (void *) OAM + loSz * 8;
    sOamHi.offset = loSz * 8;
    sOamHi.count = 0x80 - loSz;
}
