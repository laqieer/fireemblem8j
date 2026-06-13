#include "global.h"

/* Battle-background region-different graphics, segment p0 (JP 0x087AB004).
 * Migrated from asm/dat_data_btl_bg_p0.s — gbagfx -mindist 2 round-trip verified.
 */

u8 btl_bg_0_tiles[] = INCBIN_U8("graphics/btl_bg/btl_bg_0.feimg3.bin.lz");
u8 btl_bg_0_palette[] = INCBIN_U8("graphics/btl_bg/btl_bg_0.gbapal.lz");
u8 btl_bg_0_map[] = INCBIN_U8("graphics/btl_bg/btl_bg_0.fetsa3.bin.lz");
u8 btl_bg_1_tiles[] = INCBIN_U8("graphics/btl_bg/btl_bg_1.feimg3.bin.lz");
