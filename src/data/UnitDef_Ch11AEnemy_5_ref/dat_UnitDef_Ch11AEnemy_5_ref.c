#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch11AEnemy_5.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890E394[];
SECTION(".rodata.dat_UnitDef_Ch11AEnemy_5_ref") struct UnitDefinition UnitDef_Ch11AEnemy_5[] =
{
    { .charIndex=0x43, .classIndex=0x23, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x8, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0xC4), .items={0x1A,0x00,0x00,0x00} },
    { .charIndex=0x66, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x7, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0xCC) },
    { .charIndex=0x67, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x9, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0xD4) },
    {0},
};
