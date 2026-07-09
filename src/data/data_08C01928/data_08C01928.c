#include "global.h"

/* All-zero padding before __data_start at 0x08C01928 (1752 B = 438 u32 words).
 * Byte-neutral migration from the raw INCBIN of data/residual/data_08C01928.bin
 * to a typed zero array (fe8u padding form). make compare is the oracle. */

const u32 gZeroPadding_08C01928[438] __attribute__((section(".data.residue.08C01928"))) = {0};
