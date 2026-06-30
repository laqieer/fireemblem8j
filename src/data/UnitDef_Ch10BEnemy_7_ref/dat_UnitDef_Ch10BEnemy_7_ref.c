#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10BEnemy_7.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch10BEnemy_7_0[];
extern struct REDA REDAs_UnitDef_Ch10BEnemy_7_1[];
extern struct REDA REDAs_UnitDef_Ch10BEnemy_7_2[];
extern struct REDA REDAs_UnitDef_Ch10BEnemy_7_3[];
extern struct REDA REDAs_UnitDef_Ch10BEnemy_7_4[];
extern struct REDA REDAs_UnitDef_Ch10BEnemy_7_5[];
SECTION(".rodata.dat_UnitDef_Ch10BEnemy_7_ref") struct UnitDefinition UnitDef_Ch10BEnemy_7[] =
{
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x11, .redaCount=0x1, .redas=REDAs_UnitDef_Ch10BEnemy_7_0, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x13, .redaCount=0x1, .redas=REDAs_UnitDef_Ch10BEnemy_7_1, .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x12, .redaCount=0x1, .redas=REDAs_UnitDef_Ch10BEnemy_7_2, .items={0x01,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x12, .redaCount=0x1, .redas=REDAs_UnitDef_Ch10BEnemy_7_3, .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x5, .autolevel=0x1, .allegiance=0x2, .level=0xA, .xPosition=0x11, .redaCount=0x1, .redas=REDAs_UnitDef_Ch10BEnemy_7_4, .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0x80, .classIndex=0x4B, .autolevel=0x1, .allegiance=0x2, .level=0x9, .xPosition=0x13, .redaCount=0x1, .redas=REDAs_UnitDef_Ch10BEnemy_7_5, .items={0x4E,0x00,0x00,0x00}, .ai={0x0E,0x00,0x09,0x00} },
    {0},
};
