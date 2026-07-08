#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10AAlly_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 REDA_Ch10AAlly_1_0[];
extern const u8 REDA_Ch10AAlly_1_1[];
extern const u8 REDA_Ch10AAlly_1_2[];
extern const u8 REDA_Ch10AAlly_1_3[];
extern const u8 REDA_Ch10AAlly_1_4[];
extern const u8 REDA_Ch10AAlly_1_5[];
extern const u8 REDA_Ch10AAlly_1_6[];
extern const u8 REDA_Ch10AAlly_1_7[];
extern const u8 REDA_Ch10AAlly_1_8[];
extern const u8 REDA_Ch10AAlly_1_9[];
SECTION(".rodata.dat_UnitDef_Ch10AAlly_1_ref") struct UnitDefinition UnitDef_Ch10AAlly_1[] =
{
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_0), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_1), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_2), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_3), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_4), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_5), .items={0x09,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_6), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_7), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_8), .items={0x16,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)REDA_Ch10AAlly_1_9), .items={0x17,0x6C,0x6C,0x00} },
    {0},
};
