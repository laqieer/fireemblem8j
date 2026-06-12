#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "soundwrapper.h"

#include "worldmap.h"

extern u8 gUnk_3[];

extern u8 gUnk_59[];
extern u8 gUnk_60[];
extern u8 gUnk_61;

extern u8 gWorldmapGmap_0[];  // FEB: worldmap_big_image Length:76800
extern u16 gWorldmapGmap_2[]; // FEB: worldmap_big_palette Length:128
extern u16 gWorldmapGmap_3[];

//! FE8U = 0x080BAB00
void GMapScreen_ResetState(void)
{
    gUnk_61 = 0;
    return;
}
