#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void ClearBg0Tilemap(void)
{
    gUnk_34 = gUnk_35 = 0;
    BG_Fill(gBG0TilemapBuffer, 0);
    sModifiedBGs |= 1 << 0;
}
