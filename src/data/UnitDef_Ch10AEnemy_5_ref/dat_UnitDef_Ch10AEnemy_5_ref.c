#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10AEnemy_5.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch10AEnemy_5_0[];
extern const u8 REDA_Ch10AEnemy_5_1[];
SECTION(".rodata.dat_UnitDef_Ch10AEnemy_5_ref") struct UnitDefinition UnitDef_Ch10AEnemy_5[] =
{
    { .charIndex=0xA8, .classIndex=0x48, .autolevel=0x1, .allegiance=0x2, .level=0xA, .yPosition=0x7, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_5_0), .items={0x15,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x48, .autolevel=0x1, .allegiance=0x2, .level=0xA, .yPosition=0x8, .items={0x15,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x48, .autolevel=0x1, .allegiance=0x2, .level=0x9, .yPosition=0x6, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_5_1), .items={0x1C,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
