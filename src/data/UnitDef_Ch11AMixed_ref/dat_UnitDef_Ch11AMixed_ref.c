#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch11AMixed.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890E394[];
SECTION(".rodata.dat_UnitDef_Ch11AMixed_ref") struct UnitDefinition UnitDef_Ch11AMixed[] =
{
    { .charIndex=0x17, .classIndex=0x27, .level=0x1, .xPosition=0xB, .yPosition=0x3 },
    { .charIndex=0x19, .classIndex=0x4B, .level=0x1, .xPosition=0x8, .yPosition=0x5, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0x8C) },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0x6, .yPosition=0x4, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0x94) },
    { .charIndex=0xB, .classIndex=0x1B, .level=0x1, .xPosition=0x7, .yPosition=0x5, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0x9C) },
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0x6, .yPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0xA4) },
    { .charIndex=0x69, .classIndex=0x21, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x8, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0xAC), .items={0x04,0x00,0x00,0x00} },
    { .charIndex=0x80, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0x6, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0xB4) },
    { .charIndex=0x81, .classIndex=0x1F, .autolevel=0x1, .allegiance=0x2, .level=0x1, .xPosition=0xA, .yPosition=0xA, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890E394 + 0xBC) },
    {0},
};
