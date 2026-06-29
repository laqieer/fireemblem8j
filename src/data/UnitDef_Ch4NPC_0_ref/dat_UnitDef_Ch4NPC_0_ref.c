#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch4NPC_0.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch4NPC_0_DOZLA[];
extern const u8 REDA_Ch4NPC_0_LARACHEL[];
extern const u8 REDA_Ch4NPC_0_RENNAC[];
SECTION(".rodata.dat_UnitDef_Ch4NPC_0_ref") struct UnitDefinition UnitDef_Ch4NPC_0[] =
{
    { .charIndex=0x19, .classIndex=0x4B, .leaderCharIndex=0x1, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0xD, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4NPC_0_LARACHEL, .items={0x4C,0x00,0x00,0x00} },
    { .charIndex=0x1C, .classIndex=0x33, .leaderCharIndex=0x1, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0xE, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4NPC_0_RENNAC, .items={0x03,0x00,0x00,0x00} },
    { .charIndex=0x1A, .classIndex=0x43, .leaderCharIndex=0x1, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0xC, .redaCount=0x1, .redas=(const struct REDA *)REDA_Ch4NPC_0_DOZLA, .items={0x21,0x00,0x00,0x00} },
    {0},
};
