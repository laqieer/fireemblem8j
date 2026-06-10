#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

struct BgCnt *BG_GetControlBuffer(u16 bg)
{
    switch (bg)
    {
    case 0: return &gLCDControlBuffer.bg0cnt;
    case 1: return &gLCDControlBuffer.bg1cnt;
    case 2: return &gLCDControlBuffer.bg2cnt;
    case 3: return &gLCDControlBuffer.bg3cnt;
    }
}
