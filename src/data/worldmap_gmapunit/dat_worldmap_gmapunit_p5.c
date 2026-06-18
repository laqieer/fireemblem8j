#include "global.h"

/* Migrated from asm/dat_worldmap_gmapunit_p5.s (region-same data, dot-in-name label
 * via GNU asm() symbol alias). chance_lut.3 = static-local LUT, byte-identical INCBIN. */
SECTION(".rodata.dat_worldmap_gmapunit_p5") u8 chance_lut_3[] asm("chance_lut.3") = INCBIN_U8("data/residual/chance_lut.3.bin");
