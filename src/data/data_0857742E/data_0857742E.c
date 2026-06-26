#include "global.h"

/* Migrated from asm/data_0857742E.s (region-same graphics, single section).
 * Split around locale.o(.rodata) @ 0x08577444-0x0857747E (the newlib lconv struct
 * + "."/""/"C" strings, now lib-linked from libc.a:locale.o, see D289): this object
 * keeps only the head (Infinity/NaN/"0" strings, 0x0857742E-0x08577444) and the
 * 2-byte tail (0x0857747E-0x08577480).
 */

u8 data_0857742E[] __attribute__((section(".data.residue.0857742E"))) = INCBIN_U8("data/residual/data_0857742E.bin", 0x0, 0x16);
u8 data_0857747E[] __attribute__((section(".data.residue.0857747E"))) = INCBIN_U8("data/residual/data_0857742E.bin", 0x50, 0x2);
