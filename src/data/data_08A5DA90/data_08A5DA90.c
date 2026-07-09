#include "global.h"

/* All-zero padding at 0x08A5DA90 (16 B = 4 u32 words). Byte-neutral migration
 * from the raw INCBIN of data/residual/data_08A5DA90.bin to a typed zero array
 * (fe8u padding form). make compare is the oracle. */

const u32 gPadding_08A5DA90[4] __attribute__((section(".data.residue.08A5DA90"))) = {0};
