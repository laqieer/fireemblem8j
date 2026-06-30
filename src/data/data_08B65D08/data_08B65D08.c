#include "global.h"

/* Migrated from asm/data_08B65D08.s (region-same graphics, single section).
 * Editable gfx: graphics/reuse/data_08B65D08.png (4bpp) -> .4bpp.lz, byte-identical
 * to the JP ROM LZ stream (gbagfx round-trips bit-exact). Was data/residual/data_08B65D08.bin.
 */

u8 data_08B65D08[] __attribute__((section(".data.residue.08B65D08"))) = INCBIN_U8("graphics/reuse/data_08B65D08.4bpp.lz");
