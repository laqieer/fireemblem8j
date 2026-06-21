#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

//! FE8U = 0x080001D50
int GetBackgroundFromBufferPointer(u16 *ptr)
{
    if (ptr >= gBG0TilemapBuffer && ptr < gBG0TilemapBuffer + 0x400)
        return 0;
    if (ptr >= gBG1TilemapBuffer && ptr < gBG1TilemapBuffer + 0x400)
        return 1;
    if (ptr >= gBG2TilemapBuffer && ptr < gBG2TilemapBuffer + 0x400)
        return 2;
    if (ptr >= gBG3TilemapBuffer && ptr < gBG3TilemapBuffer + 0x400)
        return 3;
    return -1;
}
