#include "global.h"

/* Migrated from asm/data_08B6EE04.s (region-same graphics, single section).
 * Editable gfx: graphics/reuse/data_08B6EE04.png (4bpp) -> .4bpp.lz, byte-identical
 * to the JP ROM LZ stream (gbagfx round-trips bit-exact). Was data/residual/data_08B6EE04.bin.
 */

u8 data_08B6EE04[] __attribute__((section(".data.residue.08B6EE04"))) = INCBIN_U8("graphics/reuse/data_08B6EE04.4bpp.lz");
