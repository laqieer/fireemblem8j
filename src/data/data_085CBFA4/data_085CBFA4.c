#include "global.h"

/* Migrated from asm/data_085CBFA4.s (region-same graphics, single section).
 * Editable gfx: graphics/reuse/data_085CBFA4.png (4bpp) -> .4bpp.lz, byte-identical
 * to the JP ROM LZ stream (gbagfx round-trips bit-exact). Was data/residual/data_085CBFA4.bin.
 */

u8 data_085CBFA4[] __attribute__((section(".data.residue.085CBFA4"))) = INCBIN_U8("graphics/reuse/data_085CBFA4.4bpp.lz");
