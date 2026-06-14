#include "global.h"

/* Migrated from asm/rom_header_080000C0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 rom_header_080000C0[] __attribute__((section(".data.residue.080000C0"))) = INCBIN_U8("data/residual/rom_header_080000C0.bin");
