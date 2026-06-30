#include "global.h"

/* Migrated from asm/data_08B755D4.s (region-same graphics, single section).
 * Editable gfx: graphics/reuse/data_08B755D4.png (4bpp) -> .4bpp.lz, byte-identical
 * to the JP ROM LZ stream (gbagfx round-trips bit-exact). Was data/residual/data_08B755D4.bin.
 */

u8 data_08B755D4[] __attribute__((section(".data.residue.08B755D4"))) = INCBIN_U8("graphics/reuse/data_08B755D4.4bpp.lz");
