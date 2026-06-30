#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch16BEnemy_4.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch16BEnemy_4_0[];
extern struct REDA REDAs_UnitDef_Ch16BEnemy_4_1[];
extern struct REDA REDAs_UnitDef_Ch16BEnemy_4_2[];
extern struct REDA REDAs_UnitDef_Ch16BEnemy_4_3[];
SECTION(".rodata.dat_UnitDef_Ch16BEnemy_4_ref") struct UnitDefinition UnitDef_Ch16BEnemy_4[] =
{
    { .charIndex=0x8D, .classIndex=0x1D, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0xE, .yPosition=0x1B, .redaCount=0x1, .redas=REDAs_UnitDef_Ch16BEnemy_4_0, .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x1D, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x10, .yPosition=0x1B, .redaCount=0x1, .redas=REDAs_UnitDef_Ch16BEnemy_4_1, .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x4C, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0xE, .yPosition=0x1B, .redaCount=0x1, .redas=REDAs_UnitDef_Ch16BEnemy_4_2, .items={0x41,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x8D, .classIndex=0x1D, .autolevel=0x1, .allegiance=0x2, .level=0x3, .xPosition=0x10, .yPosition=0x1B, .redaCount=0x1, .redas=REDAs_UnitDef_Ch16BEnemy_4_3, .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
