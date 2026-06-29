#include "global.h"
#include "bmunit.h"
#include "muctrl.h"

/* Typed from data/residual/UnitDef_Ch10AAlly_1.bin (axis #6 editability, fe8u events_udefs.c parity).
 * Each 20-byte struct UnitDefinition entry decoded from the residual table; the
 * redas reinforcement pointer is kept as a relocatable symbol reference so the ROM
 * stays SHIFTABLE. Byte-identical to baserom (gated by `make compare`).
 */

extern const u8 data_0890C9BC[];
SECTION(".rodata.dat_UnitDef_Ch10AAlly_1_ref") struct UnitDefinition UnitDef_Ch10AAlly_1[] =
{
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xA4), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xAC), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xB4), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xBC), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xC4), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xCC), .items={0x09,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xD4), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x2, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xDC), .items={0x17,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x3, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xE4), .items={0x16,0x6C,0x6C,0x00} },
    { .charIndex=0x2, .classIndex=0x7, .level=0xA, .xPosition=0x1, .redaCount=0x1, .redas=(const struct REDA *)((const u8 *)data_0890C9BC + 0xEC), .items={0x17,0x6C,0x6C,0x00} },
    {0},
};
