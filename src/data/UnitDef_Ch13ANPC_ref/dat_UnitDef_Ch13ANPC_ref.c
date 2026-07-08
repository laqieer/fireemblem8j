#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch13ANPC.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch13ANPC_0[];
extern const u8 REDA_Ch13ANPC_1[];
extern const u8 REDA_Ch13ANPC_2[];
extern const u8 REDA_Ch13ANPC_3[];
extern const u8 REDA_Ch13ANPC_4[];
extern const u8 REDA_Ch13ANPC_5[];
extern const u8 REDA_Ch13ANPC_6[];
SECTION(".rodata.dat_UnitDef_Ch13ANPC_ref") struct UnitDefinition UnitDef_Ch13ANPC[] =
{
    { .charIndex=0xC8, .classIndex=0x7, .autolevel=0x1, .allegiance=0x1, .level=0x2, .xPosition=0x14, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13ANPC_0), .items={0x17,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xCD, .classIndex=0x5, .autolevel=0x1, .allegiance=0x1, .level=0x2, .xPosition=0x13, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13ANPC_1), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xCD, .classIndex=0x5, .autolevel=0x1, .allegiance=0x1, .level=0x2, .xPosition=0x13, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13ANPC_2), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xCD, .classIndex=0x5, .autolevel=0x1, .allegiance=0x1, .level=0x2, .xPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13ANPC_3), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xCD, .classIndex=0x5, .autolevel=0x1, .allegiance=0x1, .level=0x2, .xPosition=0x16, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13ANPC_4), .items={0x14,0x00,0x00,0x00}, .ai={0x00,0x00,0x09,0x00} },
    { .charIndex=0xCD, .classIndex=0x1D, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x13, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13ANPC_5), .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x0F,0x09,0x00} },
    { .charIndex=0xCD, .classIndex=0x1D, .autolevel=0x1, .allegiance=0x1, .level=0x1, .xPosition=0x15, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch13ANPC_6), .items={0x2D,0x00,0x00,0x00}, .ai={0x00,0x0F,0x09,0x00} },
    {0},
};
