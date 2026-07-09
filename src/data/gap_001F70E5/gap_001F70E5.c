#include "global.h"

/* 3-byte residual inter-symbol gap at JP 0x081F70E5..0x081F70E8 (all-zero fill).
 * Extracted from the raw data/residual/*.bin incbin into an explicit typed array so
 * the gap is editable source with no baserom/.bin dependency; the three zero bytes
 * are byte-identical to the .bin. Kept in .rodata.gap_001F70E5 at its original
 * address; make compare is the byte oracle. (Same migrated form as gap_000D2AD0.) */

u8 gap_001F70E5[3] __attribute__((section(".rodata.gap_001F70E5"))) = { 0, 0, 0 };
