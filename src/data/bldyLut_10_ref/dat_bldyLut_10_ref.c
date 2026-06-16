#include "global.h"

/* Migrated from asm/dat_bldyLut_10_ref.s. GCC label `bldyLut.10` is unreferenced;
 * the consumer (SubtitleHelpDarkenerOnHBlank.c) uses SubtitleHelpDarkener_BldyLut. */

SECTION(".rodata.dat_bldyLut_10_ref") const u8 SubtitleHelpDarkener_BldyLut[] = INCBIN_U8("data/residual/bldyLut.10.bin");
