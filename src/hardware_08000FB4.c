#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"



struct BgCnt *BG_GetControlBuffer(u16 bg);

void SetBackgroundMapDataOffset(int bg, int offset)
{
    struct BgCnt *bgcnt = BG_GetControlBuffer(bg);

    if ((offset & 0x7FF) == 0)  // must be aligned
    {
        bgcnt->screenBaseBlock = offset >> 11;
        gBGVramTilemapPointers[bg] = (void *)(VRAM | offset);
    }
}
