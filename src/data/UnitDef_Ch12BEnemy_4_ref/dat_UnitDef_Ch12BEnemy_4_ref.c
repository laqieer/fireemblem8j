#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch12BEnemy_4.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch12BEnemy_4_0[];
extern struct REDA REDAs_UnitDef_Ch12BEnemy_4_1[];
extern struct REDA REDAs_UnitDef_Ch12BEnemy_4_2[];
SECTION(".rodata.dat_UnitDef_Ch12BEnemy_4_ref") struct UnitDefinition UnitDef_Ch12BEnemy_4[] =
{
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x1, .yPosition=0x1E, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_4_0, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x3, .yPosition=0x1E, .itemDrop=0x1, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_4_1, .items={0x1B,0x00,0x00,0x00}, .ai={0x00,0x12,0x0C,0x00} },
    { .charIndex=0xBB, .classIndex=0x63, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x4, .yPosition=0x1E, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_4_2, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x12,0x0C,0x00} },
    {0},
};
