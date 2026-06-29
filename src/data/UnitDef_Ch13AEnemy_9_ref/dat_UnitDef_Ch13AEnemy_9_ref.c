#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch13AEnemy_9.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890ECE8[];
SECTION(".rodata.dat_UnitDef_Ch13AEnemy_9_ref") struct UnitDefinition UnitDef_Ch13AEnemy_9[] =
{
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0xA, .yPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890ECE8 + 0x108), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xE, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0xB, .yPosition=0xF, .itemDrop=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890ECE8 + 0x110), .items={0x1A,0x67,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x2, .yPosition=0xF, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890ECE8 + 0x118), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
