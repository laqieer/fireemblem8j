#include "global.h"

/* All-zero align padding at 0x08EF86C8 (2360 B = 590 u32 words). Byte-neutral
 * migration from the raw INCBIN of data/residual/data_08EF86C8.bin to a typed
 * zero array (fe8u padding form). make compare is the oracle. */

const u32 gPadding_08EF86C8[590] __attribute__((section(".data.residue.08EF86C8"))) = {0};
