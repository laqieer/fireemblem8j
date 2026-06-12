#include "global.h"
#include "icon.h"
#include "hardware.h"

void LoadIconPalette(u32 Index, u32 Dest)
{
    ApplyPalette(item_icon_palette[Index], Dest);
}
