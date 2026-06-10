#include "global.h"
#include "icon.h"
#include "hardware.h"

u16 GetIconGfxTileIndex(u32 Index)
{
    return 0x300 - Index * 4;
}
