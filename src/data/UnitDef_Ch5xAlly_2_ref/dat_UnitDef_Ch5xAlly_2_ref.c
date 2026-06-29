#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch5xAlly_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890A3D4[];
SECTION(".rodata.dat_UnitDef_Ch5xAlly_2_ref") struct UnitDefinition UnitDef_Ch5xAlly_2[] =
{
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0x9, .yPosition=0xC, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A3D4 + 0x28) },
    { .charIndex=0x10, .classIndex=0x5, .level=0x1, .xPosition=0x9, .yPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A3D4 + 0x30) },
    { .charIndex=0x11, .classIndex=0x5, .level=0x1, .xPosition=0x8, .yPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A3D4 + 0x38) },
    { .charIndex=0x42, .classIndex=0x7, .level=0x1, .xPosition=0x8, .yPosition=0xE, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890A3D4 + 0x40) },
    {0},
};
