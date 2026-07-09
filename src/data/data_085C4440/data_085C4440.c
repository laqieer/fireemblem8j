#include "global.h"

/* All-zero align padding between debug menus at 0x085C4440 (36 B = 9 u32 words).
 * Byte-neutral migration from the raw INCBIN of data/residual/data_085C4440.bin
 * to a typed zero array (fe8u padding form). make compare is the oracle. */

const u32 gPadding_085C4440[9] __attribute__((section(".data.residue.085C4440"))) = {0};
