#include "global.h"

/* Region-different data (JP 0x08a602f0, read from a funcmap-aligned code literal;
 * US 0x088c6ac4). Its bytes do not decode as a clean array of struct UnitDefinition
 * (the would-be `redas` words are not pointers into a REDA pool), so unlike the other
 * UnitDef_Ch* tables it is NOT typed; kept as a byte-identical INCBIN. */

SECTION(".rodata.dat_UnitDef_Ch14BAlly_7_ref") u8 UnitDef_Ch14BAlly_7[] = INCBIN_U8("data/residual/UnitDef_Ch14BAlly_7.bin");
