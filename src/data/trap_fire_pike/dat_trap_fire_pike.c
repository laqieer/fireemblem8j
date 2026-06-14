#include "global.h"

/* Migrated from asm/dat_trap_fire_pike.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

SECTION(".rodata.dat_trap_fire_pike") u8 Img_FireTrap[] = INCBIN_U8("graphics/misc_gfx2/Img_FireTrap.bin.lz");
SECTION(".rodata.dat_trap_fire_pike") u8 Pal_FireTrap[] = INCBIN_U8("graphics/misc_gfx2/Pal_FireTrap.gbapal");
