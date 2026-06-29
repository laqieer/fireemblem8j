#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch14BEnemy_8.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 frontier_df3_unitdef_b_034_919A90[];
SECTION(".rodata.dat_UnitDef_Ch14BEnemy_8_ref") struct UnitDefinition UnitDef_Ch14BEnemy_8[] =
{
    { .charIndex=0x80, .classIndex=0x45, .autolevel=0x1, .allegiance=0x2, .level=0xE, .xPosition=0x7, .yPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_034_919A90 + 0x96C), .items={0x4E,0x00,0x00,0x00}, .ai={0x0E,0x03,0x08,0x00} },
    { .charIndex=0x80, .classIndex=0x2D, .autolevel=0x1, .allegiance=0x2, .level=0xE, .xPosition=0x7, .yPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_034_919A90 + 0x974), .items={0x46,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x2D, .autolevel=0x1, .allegiance=0x2, .level=0xE, .xPosition=0x7, .yPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)frontier_df3_unitdef_b_034_919A90 + 0x97C), .items={0x46,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
