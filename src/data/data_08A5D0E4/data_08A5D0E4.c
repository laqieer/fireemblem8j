#include "global.h"

/* Byte-neutral SPLIT of the 8-byte all-NULL data_08A5D0E4 residue into the
 * Chapter 16 (Ephraim) UnitMove/Tutorial empty event lists (4 zero bytes each,
 * at their original addresses 0x08A5D0E4 / 0x08A5D0E8). The original INCBIN_U8
 * of the 8-byte .bin expanded to eight `.byte 0x0`; two explicitly-zeroed
 * arrays in the same residue sections are byte-identical. make compare is the oracle. */

u8 EventListScr_Ch16b_UnitMove[4] __attribute__((section(".data.residue.08A5D0E4"))) = {0};
u8 EventListScr_Ch16b_Tutorial[4] __attribute__((section(".data.residue.08A5D0E8"))) = {0};
