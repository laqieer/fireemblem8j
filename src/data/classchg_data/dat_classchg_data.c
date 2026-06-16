#include "global.h"

/* Migrated from asm/dat_classchg_data.s (self-contained data/residual incbin).
 * Types matched to variables.h decls; byte-identical via INCBIN_U*. */

SECTION(".rodata.dat_classchg_data") u8 gPromoJidLut[][2] = INCBIN_U8("data/residual/gPromoJidLut.bin");
SECTION(".rodata.dat_classchg_data") u8 gAnimCharaPalConfig[0x100][7] = INCBIN_U8("data/residual/gAnimCharaPalConfig.bin");
SECTION(".rodata.dat_classchg_data") u8 gAnimCharaPalConfigUnused[] = INCBIN_U8("data/residual/gAnimCharaPalConfigUnused.bin");
SECTION(".rodata.dat_classchg_data") u8 gAnimCharaPalIt[0x100][7] = INCBIN_U8("data/residual/gAnimCharaPalIt.bin");
