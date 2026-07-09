#include "global.h"

/* ROM-tail fill at 0x08FFF000 (4096 B): 3840 bytes of 0x00 followed by 256
 * bytes of 0xFF (flash-erase fill). Byte-neutral migration from the raw INCBIN
 * of data/residual/data_08FFF000.bin to an explicit typed array; the two range
 * initializers reproduce the exact fill (verified byte-identical). make compare
 * is the oracle. */

const u8 gRomTailPadding_08FFF000[4096] __attribute__((section(".data.residue.08FFF000"))) = {
    [0 ... 3839]    = 0x00,
    [3840 ... 4095] = 0xFF,
};
