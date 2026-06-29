#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch9AAlly_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890C0A4[];
SECTION(".rodata.dat_UnitDef_Ch9AAlly_0_ref") struct UnitDefinition UnitDef_Ch9AAlly_0[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x8, .yPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C0A4 + 0x78) },
    { .charIndex=0x22, .classIndex=0x48, .level=0x4, .xPosition=0x8, .yPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C0A4 + 0x80) },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x9, .yPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C0A4 + 0x88) },
    {0},
};
