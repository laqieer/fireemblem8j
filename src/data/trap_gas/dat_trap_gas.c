#include "global.h"

/* Migrated from asm/dat_trap_gas.s (region-same graphics, single section).
 * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.
 */

SECTION(".rodata.dat_trap_gas") u8 Img_GasTrapVertical[] = INCBIN_U8("graphics/misc_gfx2/Img_GasTrapVertical.bin.lz");
SECTION(".rodata.dat_trap_gas") u8 Img_GasTrapHorizontal[] = INCBIN_U8("graphics/misc_gfx2/Img_GasTrapHorizontal.bin.lz");
SECTION(".rodata.dat_trap_gas") u8 Pal_GasTrap[] = INCBIN_U8("graphics/misc_gfx2/Pal_GasTrap.gbapal");
SECTION(".rodata.dat_trap_gas") u8 Pal_ArrowTrap[] = INCBIN_U8("graphics/misc_gfx2/Pal_ArrowTrap.gbapal");
SECTION(".rodata.dat_trap_gas") u8 Img_ArrowTrap[] = INCBIN_U8("graphics/misc_gfx2/Img_ArrowTrap.bin.lz");
