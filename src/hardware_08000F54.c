#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

int GetTileIndex(int bg, int offset)
{
    offset &= 0xFFFF;
    return (offset - GetBackgroundTileDataOffset(bg)) / 32;
}
