#include "global.h"

/* Migrated from asm/data_08B7229C.s (region-same graphics, single section).
 * Editable gfx: graphics/reuse/data_08B7229C.png (4bpp) -> .4bpp.lz, byte-identical
 * to the JP ROM LZ stream (gbagfx round-trips bit-exact). Was data/residual/data_08B7229C.bin.
 */

u8 data_08B7229C[] __attribute__((section(".data.residue.08B7229C"))) = INCBIN_U8("graphics/reuse/data_08B7229C.4bpp.lz");
