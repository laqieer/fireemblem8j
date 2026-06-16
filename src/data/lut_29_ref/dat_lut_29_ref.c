#include "global.h"

/* Migrated from asm/dat_lut_29_ref.s. The GCC label `lut.29` (invalid C identifier)
 * is unreferenced; the only consumer (SubtitleHelp_Loop.c) uses the descriptive
 * alias SubtitleHelp_TextShowLut, so define the bytes directly under that name. */

SECTION(".rodata.dat_lut_29_ref") const u8 SubtitleHelp_TextShowLut[] = INCBIN_U8("data/residual/lut.29.bin");
