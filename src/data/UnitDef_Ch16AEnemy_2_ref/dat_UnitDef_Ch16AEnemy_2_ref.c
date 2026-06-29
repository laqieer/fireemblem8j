#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch16AEnemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_007_911200[];
SECTION(".rodata.dat_UnitDef_Ch16AEnemy_2_ref") struct UnitDefinition UnitDef_Ch16AEnemy_2[] =
{
    { .charIndex=0x8D, .classIndex=0x35, .autolevel=0x1, .allegiance=0x2, .level=0x4, .yPosition=0x1B, .items={0x17,0x6D,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x35, .autolevel=0x1, .allegiance=0x2, .level=0x3, .yPosition=0x1B, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_007_911200 + 0x78), .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x35, .autolevel=0x1, .allegiance=0x2, .level=0x3, .yPosition=0x1B, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_007_911200 + 0x80), .items={0x20,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xF, .yPosition=0x1B, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_007_911200 + 0x88), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
