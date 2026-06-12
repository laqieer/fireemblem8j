#include "global.h"
#include "icon.h"
#include "hardware.h"

void LoadIconPalettes(u32 Dest)
{
    ApplyPalettes(item_icon_palette[0], Dest, 2);
}
