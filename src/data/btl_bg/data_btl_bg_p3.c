#include "global.h"

/* Battle-background region-different graphics, segment p3 (JP 0x087B8100).
 * Migrated from asm/dat_data_btl_bg_p3.s — gbagfx -mindist 2 round-trip verified.
 */

u8 btl_bg_8_palette[] = INCBIN_U8("graphics/btl_bg/btl_bg_8.gbapal.lz");
u8 btl_bg_8_map[] = INCBIN_U8("graphics/btl_bg/btl_bg_8.fetsa3.bin.lz");
