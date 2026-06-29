#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch8Enemy_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df4_banim_b_076_90B4DC[];
SECTION(".rodata.dat_UnitDef_Ch8Enemy_3_ref") struct UnitDefinition UnitDef_Ch8Enemy_3[] =
{
    { .charIndex=0x4D, .classIndex=0xB, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x13, .yPosition=0xB, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x37C) },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x8, .xPosition=0x13, .yPosition=0xA, .redaCount=0x2, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x384), .ai={0x00,0x03,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0x8, .xPosition=0x13, .yPosition=0x9, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df4_banim_b_076_90B4DC + 0x394), .ai={0x00,0x03,0x09,0x00} },
    {0},
};
