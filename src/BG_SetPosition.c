#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void BG_SetPosition(u16 bg, u16 x, u16 y)
{
    switch (bg) {
    case BG_0:
        gLCDControlBuffer.bgoffset[0].x = x;
        gLCDControlBuffer.bgoffset[0].y = y;
        break;
    case BG_1:
        gLCDControlBuffer.bgoffset[1].x = x;
        gLCDControlBuffer.bgoffset[1].y = y;
        break;
    case BG_2:
        gLCDControlBuffer.bgoffset[2].x = x;
        gLCDControlBuffer.bgoffset[2].y = y;
        break;
    case BG_3:
        gLCDControlBuffer.bgoffset[3].x = x;
        gLCDControlBuffer.bgoffset[3].y = y;
        break;
    }
}
