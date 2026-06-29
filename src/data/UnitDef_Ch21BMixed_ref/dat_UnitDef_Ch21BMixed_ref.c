#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch21BMixed.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_051_91F300[];
SECTION(".rodata.dat_UnitDef_Ch21BMixed_ref") struct UnitDefinition UnitDef_Ch21BMixed[] =
{
    { .charIndex=0x40, .classIndex=0x7B, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xB, .yPosition=0x2 },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0xA, .yPosition=0x4 },
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0xB, .yPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_051_91F300 + 0x1AC) },
    { .charIndex=0xB, .classIndex=0x1B, .level=0x1, .xPosition=0xB, .yPosition=0x5 },
    { .charIndex=0x19, .classIndex=0x4B, .level=0x1, .xPosition=0xA, .yPosition=0x6 },
    { .charIndex=0x1E, .classIndex=0x3C, .level=0x1, .xPosition=0xC, .yPosition=0x6 },
    {0},
};
