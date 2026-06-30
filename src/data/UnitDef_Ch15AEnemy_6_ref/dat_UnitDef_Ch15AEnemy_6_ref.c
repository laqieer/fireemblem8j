#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch15AEnemy_6.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch15AEnemy_6_0[];
extern struct REDA REDAs_UnitDef_Ch15AEnemy_6_1[];
extern struct REDA REDAs_UnitDef_Ch15AEnemy_6_2[];
extern struct REDA REDAs_UnitDef_Ch15AEnemy_6_3[];
extern struct REDA REDAs_UnitDef_Ch15AEnemy_6_4[];
extern struct REDA REDAs_UnitDef_Ch15AEnemy_6_5[];
extern struct REDA REDAs_UnitDef_Ch15AEnemy_6_6[];
SECTION(".rodata.dat_UnitDef_Ch15AEnemy_6_ref") struct UnitDefinition UnitDef_Ch15AEnemy_6[] =
{
    { .charIndex=0x80, .classIndex=0x7, .autolevel=0x1, .allegiance=0x2, .level=0x4, .yPosition=0x12, .redaCount=0x1, .redas=REDAs_UnitDef_Ch15AEnemy_6_0, .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xE, .yPosition=0x13, .redaCount=0x1, .redas=REDAs_UnitDef_Ch15AEnemy_6_1, .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xE, .yPosition=0x11, .redaCount=0x1, .redas=REDAs_UnitDef_Ch15AEnemy_6_2, .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x11, .redaCount=0x1, .redas=REDAs_UnitDef_Ch15AEnemy_6_3, .items={0x20,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x3F, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x12, .redaCount=0x1, .redas=REDAs_UnitDef_Ch15AEnemy_6_4, .items={0x20,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0xF, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x14, .redaCount=0x1, .redas=REDAs_UnitDef_Ch15AEnemy_6_5, .items={0x03,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x25, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x13, .items={0x38,0x00,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x25, .autolevel=0x1, .allegiance=0x2, .level=0xE, .yPosition=0x11, .items={0x39,0x6D,0x00,0x00}, .ai={0x00,0x12,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x25, .autolevel=0x1, .allegiance=0x2, .level=0xD, .yPosition=0x10, .redaCount=0x1, .redas=REDAs_UnitDef_Ch15AEnemy_6_6, .items={0x38,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
