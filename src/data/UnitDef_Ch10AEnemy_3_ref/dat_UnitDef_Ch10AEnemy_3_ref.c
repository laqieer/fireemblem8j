#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10AEnemy_3.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch10AEnemy_3_0[];
extern const u8 REDA_Ch10AEnemy_3_1[];
extern const u8 REDA_Ch10AEnemy_3_2[];
extern const u8 REDA_Ch10AEnemy_3_3[];
extern const u8 REDA_Ch10AEnemy_3_4[];
SECTION(".rodata.dat_UnitDef_Ch10AEnemy_3_ref") struct UnitDefinition UnitDef_Ch10AEnemy_3[] =
{
    { .charIndex=0xA8, .classIndex=0x48, .autolevel=0x1, .allegiance=0x2, .level=0xA, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_3_0), .items={0x15,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x48, .autolevel=0x1, .allegiance=0x2, .level=0xA, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_3_1), .items={0x15,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x49, .autolevel=0x1, .allegiance=0x2, .level=0x1, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_3_2), .items={0x16,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x48, .autolevel=0x1, .allegiance=0x2, .level=0xA, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_3_3), .items={0x15,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xA8, .classIndex=0x48, .autolevel=0x1, .allegiance=0x2, .level=0xA, .yPosition=0x1E, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AEnemy_3_4), .items={0x15,0x61,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    {0},
};
