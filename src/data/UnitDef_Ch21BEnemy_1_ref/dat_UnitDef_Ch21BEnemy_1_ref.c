#include "global.h"

/* Region-different data (JP 0x08a6c000, read from a funcmap-aligned code literal;
 * US 0x088cb448). Its bytes do not decode as a clean array of struct UnitDefinition
 * (the would-be `redas` words are not pointers into a REDA pool), so unlike the other
 * UnitDef_Ch* tables it is NOT typed; kept as a byte-identical INCBIN. */

SECTION(".rodata.dat_UnitDef_Ch21BEnemy_1_ref") u8 UnitDef_Ch21BEnemy_1[] = INCBIN_U8("data/residual/UnitDef_Ch21BEnemy_1.bin");
