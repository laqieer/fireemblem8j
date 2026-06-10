#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

struct BgCnt *BG_GetControlBuffer(u16 bg);

void SetBackgroundTileDataOffset(int bg, int offset)
{
    BG_GetControlBuffer(bg)->charBaseBlock = offset >> 14;
}
