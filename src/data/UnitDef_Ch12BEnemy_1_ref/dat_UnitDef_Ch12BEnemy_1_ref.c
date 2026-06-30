#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch12BEnemy_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch12BEnemy_1_0[];
extern struct REDA REDAs_UnitDef_Ch12BEnemy_1_1[];
extern struct REDA REDAs_UnitDef_Ch12BEnemy_1_2[];
extern struct REDA REDAs_UnitDef_Ch12BEnemy_1_3[];
extern struct REDA REDAs_UnitDef_Ch12BEnemy_1_4[];
extern struct REDA REDAs_UnitDef_Ch12BEnemy_1_5[];
SECTION(".rodata.dat_UnitDef_Ch12BEnemy_1_ref") struct UnitDefinition UnitDef_Ch12BEnemy_1[] =
{
    { .charIndex=0x5C, .classIndex=0x5A, .allegiance=0x2, .level=0x9, .xPosition=0x11, .itemDrop=0x1, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_1_0, .items={0x28,0x2B,0x00,0x00}, .ai={0x03,0x03,0x0C,0x00} },
    { .charIndex=0xAB, .classIndex=0x53, .autolevel=0x1, .allegiance=0x2, .level=0x5, .xPosition=0x12, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_1_1, .items={0xAE,0x00,0x00,0x00}, .ai={0x00,0x03,0x0C,0x00} },
    { .charIndex=0xAD, .classIndex=0x55, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0xC, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_1_2, .items={0x2E,0x00,0x00,0x00}, .ai={0x00,0x03,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0xF, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_1_3, .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x03,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x14, .yPosition=0x3, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_1_4, .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x03,0x0C,0x00} },
    { .charIndex=0xAC, .classIndex=0x54, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x14, .yPosition=0x4, .redaCount=0x1, .redas=REDAs_UnitDef_Ch12BEnemy_1_5, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x03,0x0C,0x00} },
    {0},
};
