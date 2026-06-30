#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch16AAlly_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern struct REDA REDAs_UnitDef_Ch16AAlly_0_0[];
SECTION(".rodata.dat_UnitDef_Ch16AAlly_0_ref") struct UnitDefinition UnitDef_Ch16AAlly_0[] =
{
    { .charIndex=0x1, .classIndex=0x2, .level=0x1, .xPosition=0xC, .yPosition=0x5 },
    { .charIndex=0xF, .classIndex=0x1, .level=0x1, .xPosition=0xE, .yPosition=0x5 },
    { .charIndex=0x2, .classIndex=0x7, .level=0x1, .xPosition=0xD, .yPosition=0xB, .redaCount=0x1, .redas=REDAs_UnitDef_Ch16AAlly_0_0 },
    {0},
};
