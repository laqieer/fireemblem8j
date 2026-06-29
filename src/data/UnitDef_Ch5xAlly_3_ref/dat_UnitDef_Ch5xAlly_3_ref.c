#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch5xAlly_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890A480[];
SECTION(".rodata.dat_UnitDef_Ch5xAlly_3_ref") struct UnitDefinition UnitDef_Ch5xAlly_3[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0x9, .yPosition=0x4, .redaCount=0x3, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x14) },
    { .charIndex=0x10, .classIndex=0x5, .level=0x1, .xPosition=0x9, .yPosition=0x4, .redaCount=0x3, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x2C) },
    { .charIndex=0x11, .classIndex=0x5, .level=0x1, .xPosition=0x9, .yPosition=0x4, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)data_0890A480 + 0x44) },
    {0},
};
