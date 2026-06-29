#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch8Enemy_8.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890BDC4[];
SECTION(".rodata.dat_UnitDef_Ch8Enemy_8_ref") struct UnitDefinition UnitDef_Ch8Enemy_8[] =
{
    { .charIndex=0x8D, .classIndex=0xF, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x10, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890BDC4 + 0x90), .items={0x06,0x00,0x00,0x00} },
    { .charIndex=0x8D, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x10, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890BDC4 + 0x98), .items={0x06,0x00,0x00,0x00} },
    { .charIndex=0x8D, .classIndex=0xF, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x10, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890BDC4 + 0xA0), .items={0x06,0x00,0x00,0x00} },
    { .charIndex=0x8D, .classIndex=0x4E, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x10, .yPosition=0x18, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890BDC4 + 0xA8), .items={0x06,0x00,0x00,0x00} },
    {0},
};
