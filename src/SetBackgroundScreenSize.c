#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

struct BgCnt *BG_GetControlBuffer(u16 bg);

void SetBackgroundScreenSize(int bg, int size)
{
    BG_GetControlBuffer(bg)->screenSize = size;
}
