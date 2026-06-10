#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

struct BgCnt *BG_GetControlBuffer(u16 bg);

int BG_GetTileMapOffset(int bg)
{
    return BG_GetControlBuffer(bg)->screenBaseBlock << 11;
}
