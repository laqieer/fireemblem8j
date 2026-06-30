#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch19BEnemy_8.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch19BEnemy_8_0[];
extern struct REDA REDAs_UnitDef_Ch19BEnemy_8_1[];
extern struct REDA REDAs_UnitDef_Ch19BEnemy_8_2[];
SECTION(".rodata.dat_UnitDef_Ch19BEnemy_8_ref") struct UnitDefinition UnitDef_Ch19BEnemy_8[] =
{
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xF, .xPosition=0x1B, .yPosition=0x2, .redaCount=0x1, .redas=REDAs_UnitDef_Ch19BEnemy_8_0, .items={0x1C,0x16,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xF, .xPosition=0x1B, .yPosition=0x2, .redaCount=0x1, .redas=REDAs_UnitDef_Ch19BEnemy_8_1, .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xF, .xPosition=0x1B, .yPosition=0x2, .redaCount=0x1, .redas=REDAs_UnitDef_Ch19BEnemy_8_2, .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    {0},
};
