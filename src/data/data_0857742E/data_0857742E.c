#include "global.h"

/* Migrated from asm/data_0857742E.s. This residue is progressively decomposed into
 * its real newlib meaning: dtoa.o(.rodata) @ 0x08577430-0x08577442 (the "Infinity"/
 * "NaN"/"0" dtoa strings) and locale.o(.rodata) @ 0x08577444-0x0857747E (the lconv
 * struct + "."/""/"C" strings), both lib-linked (see D289). Only the 2-byte gaps
 * around them remain as raw residue.
 */

u8 data_0857742E[] __attribute__((section(".data.residue.0857742E"))) = INCBIN_U8("data/residual/data_0857742E.bin", 0x0, 0x2);
u8 data_08577442[] __attribute__((section(".data.residue.08577442"))) = INCBIN_U8("data/residual/data_0857742E.bin", 0x14, 0x2);
u8 data_0857747E[] __attribute__((section(".data.residue.0857747E"))) = INCBIN_U8("data/residual/data_0857742E.bin", 0x50, 0x2);
