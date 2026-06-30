#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch16AAlly_8.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch16AAlly_8_0[];
extern struct REDA REDAs_UnitDef_Ch16AAlly_8_1[];
extern struct REDA REDAs_UnitDef_Ch16AAlly_8_2[];
SECTION(".rodata.dat_UnitDef_Ch16AAlly_8_ref") struct UnitDefinition UnitDef_Ch16AAlly_8[] =
{
    { .charIndex=0x40, .classIndex=0x4F, .level=0x1, .xPosition=0x7, .yPosition=0xB, .redaCount=0x1, .redas=REDAs_UnitDef_Ch16AAlly_8_0 },
    { .charIndex=0x57, .classIndex=0x2B, .level=0x1, .xPosition=0x8, .yPosition=0xB },
    { .charIndex=0x80, .classIndex=0x3F, .level=0x1, .xPosition=0x6, .yPosition=0x9, .redaCount=0x2, .redas=REDAs_UnitDef_Ch16AAlly_8_1 },
    { .charIndex=0x81, .classIndex=0x4E, .level=0x1, .xPosition=0x9, .yPosition=0x9, .redaCount=0x2, .redas=REDAs_UnitDef_Ch16AAlly_8_2 },
    {0},
};
