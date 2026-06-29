#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch16BEnemy_2.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_038_91B948[];
SECTION(".rodata.dat_UnitDef_Ch16BEnemy_2_ref") struct UnitDefinition UnitDef_Ch16BEnemy_2[] =
{
    { .charIndex=0x8D, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xF, .yPosition=0x1B, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_038_91B948 + 0x164), .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xF, .yPosition=0x1B, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_038_91B948 + 0x16C), .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xF, .yPosition=0x1B, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_038_91B948 + 0x174), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xF, .yPosition=0x1B, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_038_91B948 + 0x17C), .items={0x1C,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x35, .autolevel=0x1, .allegiance=0x2, .level=0x4, .yPosition=0x1B, .items={0x20,0x76,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
